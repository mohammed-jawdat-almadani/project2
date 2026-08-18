import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enums/notification_category.dart';
import '../../../../core/notifications/app_notification_type.dart';
import '../../../../core/notifications/notification_action_handler.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../orders/domain/entities/quote_part.dart';
import '../../../orders/domain/usecases/get_quotes_usecase.dart';
import '../../../orders/domain/usecases/request_closure_usecase.dart';
import '../../../orders/domain/usecases/request_waiting_for_parts_usecase.dart';
import '../../../orders/domain/usecases/resume_order_usecase.dart';
import '../../../orders/domain/usecases/send_addon_quote_usecase.dart';
import '../../../orders/domain/usecases/send_quote_usecase.dart';
import '../../../orders/domain/usecases/verify_closure_usecase.dart';
import '../../domain/entities/dispatch_offer.dart';
import '../../domain/usecases/set_availability_usecase.dart';
import '../../domain/usecases/get_availability_usecase.dart';
import '../../domain/usecases/get_offers_usecase.dart';
import '../../domain/usecases/get_orders_usecase.dart';
import '../../domain/usecases/accept_offer_usecase.dart';
import '../../domain/usecases/decline_offer_usecase.dart';
import '../../domain/usecases/update_location_usecase.dart';
import '../../domain/usecases/arrive_order_usecase.dart';
import '../../domain/usecases/withdraw_order_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SetAvailabilityUseCase _setAvailabilityUseCase;
  final GetAvailabilityUseCase _getAvailabilityUseCase;
  final GetOffersUseCase _getOffersUseCase;
  final GetOrdersUseCase _getOrdersUseCase;
  final AcceptOfferUseCase _acceptOfferUseCase;
  final DeclineOfferUseCase _declineOfferUseCase;
  final UpdateLocationUseCase _updateLocationUseCase;
  final ArriveOrderUseCase _arriveOrderUseCase;
  final WithdrawOrderUseCase _withdrawOrderUseCase;
  final SendQuoteUseCase _sendQuoteUseCase;
  final SendAddonQuoteUseCase _sendAddonQuoteUseCase;
  final GetQuotesUseCase _getQuotesUseCase;
  final RequestWaitingForPartsUseCase _requestWaitingForPartsUseCase;
  final ResumeOrderUseCase _resumeOrderUseCase;
  final RequestClosureUseCase _requestClosureUseCase;
  final VerifyClosureUseCase _verifyClosureUseCase;
  final LocationService _locationService;
  final NotificationActionHandler _notificationHandler;

  StreamSubscription<Position>? _positionSubscription;
  StreamSubscription? _notificationSubscription;
  Timer? _heartbeatTimer;

  HomeBloc(
    this._setAvailabilityUseCase,
    this._getAvailabilityUseCase,
    this._getOffersUseCase,
    this._getOrdersUseCase,
    this._acceptOfferUseCase,
    this._declineOfferUseCase,
    this._updateLocationUseCase,
    this._arriveOrderUseCase,
    this._withdrawOrderUseCase,
    this._sendQuoteUseCase,
    this._sendAddonQuoteUseCase,
    this._getQuotesUseCase,
    this._requestWaitingForPartsUseCase,
    this._resumeOrderUseCase,
    this._requestClosureUseCase,
    this._verifyClosureUseCase,
    this._locationService,
    this._notificationHandler,
  ) : super(const HomeState()) {
    // Listen to real-time incoming FCM / Platform notifications
    _notificationSubscription =
        _notificationHandler.onNotificationReceived.listen((payload) {
      if (payload.type == AppNotificationType.newDispatchOffer ||
          payload.offerId != null ||
          payload.orderId != null ||
          payload.type?.category == NotificationCategory.orders) {
        add(const HomeEvent.fetchOffers());
      }
    });

    on<HomeEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        toggleAvailability: (isAvailable) => _onToggleAvailability(isAvailable, emit),
        locationChanged: (lat, lng) => _onLocationChanged(lat, lng, emit),
        heartbeatTick: () => _onHeartbeatTick(emit),
        fetchOffers: () => _onFetchOffers(emit),
        acceptOffer: (offerId) => _onAcceptOffer(offerId, emit),
        declineOffer: (offerId, reason) => _onDeclineOffer(offerId, reason, emit),
        changeTab: (index) async => _onChangeTab(index, emit),
        dismissOffer: () async => _onDismissOffer(emit),
        simulateOffer: () async => _onSimulateOffer(emit),
        arriveOrder: (orderId) => _onArriveOrder(orderId, emit),
        withdrawOrder: (orderId, reason) => _onWithdrawOrder(orderId, reason, emit),
        sendQuote: (orderId, laborCost, warrantyDays, parts) =>
            _onSendQuote(orderId, laborCost, warrantyDays, parts, emit),
        sendAddonQuote: (orderId, laborCost, parts) =>
            _onSendAddonQuote(orderId, laborCost, parts, emit),
        requestWaitingForParts: (orderId, note) =>
            _onRequestWaitingForParts(orderId, note, emit),
        resumeOrder: (orderId) => _onResumeOrder(orderId, emit),
        requestClosure: (orderId, photos) => _onRequestClosure(orderId, photos, emit),
        verifyClosure: (orderId, code) => _onVerifyClosure(orderId, code, emit),
      );
    });
  }

  Future<void> _onInit(Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoadingAvailability: true));

    // 1. Immediately determine current GPS position at startup
    try {
      final initialPos = await _locationService.getCurrentPosition();
      emit(state.copyWith(
        technicianLat: initialPos.latitude,
        technicianLng: initialPos.longitude,
      ));
    } catch (_) {
      // Ignored if permissions are not yet granted
    }

    // 2. Fetch server availability status
    final availResult = await _getAvailabilityUseCase(NoParams());
    
    await availResult.fold(
      (failure) async {
        emit(state.copyWith(
          isLoadingAvailability: false,
          isAvailable: false,
        ));
      },
      (isAvail) async {
        if (isAvail) {
          try {
            final pos = await _locationService.getCurrentPosition();
            emit(state.copyWith(
              isAvailable: true,
              isLoadingAvailability: false,
              technicianLat: pos.latitude,
              technicianLng: pos.longitude,
            ));
            _startTracking();
          } catch (e) {
            emit(state.copyWith(
              isAvailable: false,
              isLoadingAvailability: false,
              errorMessage: e.toString().replaceAll('Exception: ', ''),
            ));
          }
        } else {
          emit(state.copyWith(
            isAvailable: false,
            isLoadingAvailability: false,
          ));
        }
      },
    );

    // 3. Fetch current offers and active accepted orders
    add(const HomeEvent.fetchOffers());
  }

  Future<void> _onToggleAvailability(
      bool newStatus, Emitter<HomeState> emit) async {
    final previousStatus = state.isAvailable;

    // Rule: Cannot switch to offline when an active order is in progress
    if (!newStatus && state.activeOrder != null) {
      emit(state.copyWith(
        isAvailable: true,
        isLoadingAvailability: false,
        errorMessage: 'لا يمكنك تغيير حالتك إلى غير متاح أثناء وجود طلب صيانة نشط قيد التنفيذ ⚠️',
      ));
      return;
    }

    if (newStatus) {
      // 1. Mandatory Location Check
      double currentLat = state.technicianLat;
      double currentLng = state.technicianLng;

      try {
        emit(state.copyWith(isLoadingAvailability: true, errorMessage: null));
        final position = await _locationService.getCurrentPosition();
        currentLat = position.latitude;
        currentLng = position.longitude;
      } catch (e) {
        emit(state.copyWith(
          isAvailable: false,
          isLoadingAvailability: false,
          errorMessage: e.toString().replaceAll('Exception: ', ''),
        ));
        return;
      }

      // 2. Call Availability API with current coordinates
      final result = await _setAvailabilityUseCase(
        SetAvailabilityParams(
          isAvailable: true,
          currentLat: currentLat,
          currentLng: currentLng,
        ),
      );

      result.fold(
        (failure) {
          emit(state.copyWith(
            isAvailable: previousStatus,
            isLoadingAvailability: false,
            errorMessage: failure.message,
          ));
        },
        (success) {
          emit(state.copyWith(
            isAvailable: true,
            isLoadingAvailability: false,
            technicianLat: currentLat,
            technicianLng: currentLng,
            successMessage: 'أنت الآن متصل وجاهز لاستلام الطلبات 🟢',
          ));
          _startTracking();
          add(const HomeEvent.fetchOffers());
        },
      );
    } else {
      // Going Offline
      emit(state.copyWith(isLoadingAvailability: true, errorMessage: null));
      _stopTracking();

      final result = await _setAvailabilityUseCase(
        SetAvailabilityParams(
          isAvailable: false,
          currentLat: state.technicianLat,
          currentLng: state.technicianLng,
        ),
      );

      result.fold(
        (failure) {
          emit(state.copyWith(
            isAvailable: previousStatus,
            isLoadingAvailability: false,
            errorMessage: failure.message,
          ));
        },
        (success) {
          emit(state.copyWith(
            isAvailable: false,
            isLoadingAvailability: false,
            successMessage: 'تم تغيير الحالة إلى غير متصل ⚪',
          ));
        },
      );
    }
  }

  void _startTracking() {
    _stopTracking();

    // 1. Distance filter stream: triggers immediately when technician moves >= 300m
    _positionSubscription = _locationService
        .getPositionStream(distanceFilter: 300)
        .listen((position) {
      add(HomeEvent.locationChanged(
        lat: position.latitude,
        lng: position.longitude,
      ));
    });

    // 2. 5-Minute Heartbeat Timer: pushes fresh coordinates periodically
    _heartbeatTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      add(const HomeEvent.heartbeatTick());
    });
  }

  void _stopTracking() {
    _positionSubscription?.cancel();
    _positionSubscription = null;
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
  }

  Future<void> _onLocationChanged(
      double lat, double lng, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      technicianLat: lat,
      technicianLng: lng,
      successMessage: null,
      errorMessage: null,
    ));
    await _updateLocationUseCase(UpdateLocationParams(currentLat: lat, currentLng: lng));
  }

  Future<void> _onHeartbeatTick(Emitter<HomeState> emit) async {
    if (!state.isAvailable) return;
    try {
      final pos = await _locationService.getCurrentPosition();
      emit(state.copyWith(
        technicianLat: pos.latitude,
        technicianLng: pos.longitude,
        successMessage: null,
        errorMessage: null,
      ));
      await _updateLocationUseCase(
        UpdateLocationParams(currentLat: pos.latitude, currentLng: pos.longitude),
      );
    } catch (_) {}
  }

  Future<void> _onFetchOffers(Emitter<HomeState> emit) async {
    // 1. Fetch available offers
    final offersResult = await _getOffersUseCase(NoParams());
    
    // 2. Fetch assigned / in-progress orders
    final ordersResult = await _getOrdersUseCase(NoParams());

    DispatchOffer? activeOrderFound;

    ordersResult.fold(
      (_) {},
      (orders) {
        // Look for any active accepted, arrived, in_progress, parts_waiting, closure_pending or disputed order
        final activeList = orders.where((o) {
          final s = o.status?.toLowerCase();
          return s == 'accepted' ||
              s == 'arrived' ||
              s == 'quote_pending' ||
              s == 'in_progress' ||
              s == 'repairing' ||
              s == 'parts_waiting' ||
              s == 'closure_pending' ||
              s == 'disputed';
        }).toList();

        if (activeList.isNotEmpty) {
          activeOrderFound = activeList.first;
        }
      },
    );

    if (activeOrderFound != null &&
        (activeOrderFound!.arrivedAt != null ||
            activeOrderFound!.status?.toLowerCase() == 'arrived' ||
            activeOrderFound!.status?.toLowerCase() == 'accepted')) {
      try {
        final quotesResult = await _getQuotesUseCase(activeOrderFound!.orderId);
        quotesResult.fold((_) {}, (quotes) {
          if (quotes.isNotEmpty) {
            final hasPending = quotes.any((q) => q.status.toLowerCase() == 'pending');
            final hasApproved = quotes.any((q) =>
                q.status.toLowerCase() == 'accepted' || q.status.toLowerCase() == 'approved');
            final hasRejected = quotes.any((q) => q.status.toLowerCase() == 'rejected');
            if (hasPending) {
              activeOrderFound = activeOrderFound!.copyWith(status: 'quote_pending');
            } else if (hasApproved) {
              activeOrderFound = activeOrderFound!.copyWith(status: 'in_progress');
            } else if (hasRejected) {
              activeOrderFound = activeOrderFound!.copyWith(status: 'quote_rejected');
            }
          }
        });
      } catch (_) {}
    }

    offersResult.fold(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
          successMessage: null,
          activeOrder: activeOrderFound ?? state.activeOrder,
        ));
      },
      (offersList) {
        final updatedOffers = offersList.map((offer) {
          if (offer.clientLat != 0 && offer.clientLng != 0) {
            final distanceMeters = Geolocator.distanceBetween(
              state.technicianLat,
              state.technicianLng,
              offer.clientLat,
              offer.clientLng,
            );
            final km = distanceMeters / 1000;
            final formattedDistance = km < 1
                ? '${distanceMeters.toStringAsFixed(0)} م'
                : '${km.toStringAsFixed(1)} كم';
            return offer.copyWith(distanceKm: formattedDistance);
          }
          return offer;
        }).toList();

        final current = updatedOffers.isNotEmpty ? updatedOffers.first : null;
        emit(state.copyWith(
          offers: updatedOffers,
          currentOffer: current ?? state.currentOffer,
          activeOrder: activeOrderFound,
          successMessage: null,
        ));
      },
    );
  }

  Future<void> _onAcceptOffer(int offerId, Emitter<HomeState> emit) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));
    
    // Find the offer being accepted
    final accepted = state.offers.cast<DispatchOffer?>().firstWhere(
          (o) => o?.id == offerId,
          orElse: () => state.currentOffer?.id == offerId ? state.currentOffer : null,
        );

    final result = await _acceptOfferUseCase(offerId);
    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          isProcessingOffer: false,
          currentOffer: null,
          activeOrder: accepted ?? state.currentOffer,
          successMessage: 'تم قبول طلب الصيانة بنجاح!',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onDeclineOffer(
      int offerId, String? reason, Emitter<HomeState> emit) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));
    final result = await _declineOfferUseCase(
      DeclineOfferParams(offerId: offerId, reason: reason),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          isProcessingOffer: false,
          currentOffer: null,
          successMessage: 'تم رفض الطلب',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onArriveOrder(int orderId, Emitter<HomeState> emit) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    double lat = state.technicianLat;
    double lng = state.technicianLng;

    try {
      final pos = await _locationService.getCurrentPosition();
      lat = pos.latitude;
      lng = pos.longitude;
    } catch (_) {}

    // When running in debug mode on an emulator with default US location (e.g. lat 37.42, lng -122.08),
    // use the client's order coordinates so the backend geofence check passes smoothly during testing.
    if (kDebugMode && lat > 35.0 && lng < -100.0) {
      if (state.activeOrder != null && state.activeOrder!.clientLat != 0) {
        lat = state.activeOrder!.clientLat;
        lng = state.activeOrder!.clientLng;
      } else {
        lat = 33.5138;
        lng = 36.2765;
      }
    }

    final result = await _arriveOrderUseCase(
      ArriveOrderParams(orderId: orderId, lat: lat, lng: lng),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        final updated = state.activeOrder?.copyWith(status: 'arrived');
        emit(state.copyWith(
          isProcessingOffer: false,
          activeOrder: updated,
          successMessage: 'تم تسجيل وصولك إلى موقع العميل بنجاح 📍',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onWithdrawOrder(
      int orderId, String? reason, Emitter<HomeState> emit) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    final result = await _withdrawOrderUseCase(
      WithdrawOrderParams(orderId: orderId, reason: reason),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          isProcessingOffer: false,
          activeOrder: null,
          successMessage: 'تم الانسحاب من الطلب بنجاح',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onSendQuote(
    int orderId,
    String laborCost,
    int warrantyDays,
    List<QuotePart> parts,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    final result = await _sendQuoteUseCase(
      SendQuoteParams(
        orderId: orderId,
        laborCost: laborCost,
        warrantyDays: warrantyDays,
        parts: parts,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (quote) {
        final updated = state.activeOrder?.copyWith(status: 'quote_pending');
        emit(state.copyWith(
          isProcessingOffer: false,
          activeOrder: updated,
          successMessage: 'تم إرسال عرض السعر للعميل بنجاح، بانتظار موافقته ⏳',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onSendAddonQuote(
    int orderId,
    String laborCost,
    List<QuotePart> parts,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    final result = await _sendAddonQuoteUseCase(
      SendAddonQuoteParams(
        orderId: orderId,
        laborCost: laborCost,
        parts: parts,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (quote) {
        emit(state.copyWith(
          isProcessingOffer: false,
          successMessage: 'تم إرسال العرض الإضافي للعميل بنجاح 📋',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onRequestWaitingForParts(
    int orderId,
    String note,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    final result = await _requestWaitingForPartsUseCase(
      WaitingForPartsParams(orderId: orderId, note: note),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        final updated = state.activeOrder?.copyWith(status: 'parts_waiting');
        emit(state.copyWith(
          isProcessingOffer: false,
          activeOrder: updated,
          successMessage: 'تم تفعيل حالة الانتظار (مهلة 72 ساعة). يمكنك استقبال طلبات أخرى الآن 🕒',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onResumeOrder(int orderId, Emitter<HomeState> emit) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    final result = await _resumeOrderUseCase(orderId);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        final updated = state.activeOrder?.copyWith(status: 'in_progress');
        emit(state.copyWith(
          isProcessingOffer: false,
          activeOrder: updated,
          successMessage: 'تم استئناف العمل على طلب الصيانة بنجاح 🛠️',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onRequestClosure(
    int orderId,
    List<File> photos,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    final result = await _requestClosureUseCase(
      RequestClosureParams(orderId: orderId, photos: photos),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (msg) {
        final updated = state.activeOrder?.copyWith(status: 'closure_pending');
        emit(state.copyWith(
          isProcessingOffer: false,
          activeOrder: updated,
          successMessage: 'تم إرسال كود الإغلاق لهاتف العميل بنجاح 🔐',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  Future<void> _onVerifyClosure(
    int orderId,
    String code,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isProcessingOffer: true, errorMessage: null));

    final result = await _verifyClosureUseCase(
      VerifyClosureParams(orderId: orderId, code: code),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isProcessingOffer: false,
          errorMessage: failure.message,
        ));
      },
      (_) {
        emit(state.copyWith(
          isProcessingOffer: false,
          activeOrder: null,
          successMessage: 'مبروك! تم إكمال الطلب بنجاح وإيداع المستحقات في محفظتك 💼🎉',
        ));
        add(const HomeEvent.fetchOffers());
      },
    );
  }

  void _onChangeTab(int index, Emitter<HomeState> emit) {
    emit(state.copyWith(currentTab: index));
  }

  void _onDismissOffer(Emitter<HomeState> emit) {
    emit(state.copyWith(currentOffer: null));
  }

  void _onSimulateOffer(Emitter<HomeState> emit) {
    emit(state.copyWith(
      currentOffer: DispatchOffer(
        id: 2,
        orderId: 2,
        serviceName: 'صيانة سباكة وسيفونات',
        clientName: 'أحمد محمود',
        clientPhone: '0944123456',
        clientAddress: 'دمشق، بناء 12، طابق 3 (بجانب الصيدلية)',
        clientLat: 33.5138,
        clientLng: 36.2765,
        price: '50.00 ل.س (كشف)',
        inspectionFee: '50.00',
        commissionRate: '0.1000',
        orderType: 'urgent',
        orderKind: 'normal',
        description: 'تسريب مياه أسفل حوض الجلي بالمطبخ بشكل مستمر',
        distanceKm: '1.2 كم',
        addressLabel: 'المنزل',
        buildingNo: '12',
        floor: '3',
        addressNotes: 'بجانب الصيدلية',
        photos: [
          'https://home-maintenance.me/api/order-photos/2',
        ],
        expiresAt: DateTime.now().add(const Duration(seconds: 90)),
      ),
    ));
  }

  @override
  Future<void> close() {
    _stopTracking();
    _notificationSubscription?.cancel();
    return super.close();
  }
}
