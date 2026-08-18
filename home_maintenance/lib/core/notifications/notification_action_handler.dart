import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'app_notification_payload.dart';
import 'app_notification_type.dart';

@lazySingleton
class NotificationActionHandler {
  final _notificationController = StreamController<AppNotificationPayload>.broadcast();

  /// Stream of all incoming notifications for UI components and Blocs to react to.
  Stream<AppNotificationPayload> get onNotificationReceived =>
      _notificationController.stream;

  void handleIncomingPayload(AppNotificationPayload payload) {
    if (kDebugMode) {
      print('Processing notification action for: ${payload.type?.code ?? "unknown"}');
      print('Title: ${payload.title} | Body: ${payload.body}');
    }

    // Broadcast to listeners
    _notificationController.add(payload);

    // Execute specific system side-effects based on notification type
    switch (payload.type) {
      case AppNotificationType.newDispatchOffer:
        // Trigger dispatch offer refresh / sheet
        break;

      case AppNotificationType.techApproved:
      case AppNotificationType.promotedFromProbation:
        // Account state changed to active
        break;

      case AppNotificationType.techSuspended:
      case AppNotificationType.techBanned:
        // Account restricted
        break;

      case AppNotificationType.escrowFundsReleased:
      case AppNotificationType.warrantyPayout:
      case AppNotificationType.depositApproved:
      case AppNotificationType.withdrawalCompleted:
        // Refresh wallet balance
        break;

      case AppNotificationType.quoteApproved:
      case AppNotificationType.quoteRejected:
      case AppNotificationType.waitingForParts:
      case AppNotificationType.resumeFromParts:
      case AppNotificationType.clientCancels:
      case AppNotificationType.techWithdraws:
      case AppNotificationType.disputeOpened:
      case AppNotificationType.disputeResolvedClient:
      case AppNotificationType.disputeResolvedTech:
      case AppNotificationType.noShowResolved:
      case AppNotificationType.appointmentActivatedClient:
      case AppNotificationType.appointmentActivatedTech:
        // Refresh orders and active job
        break;

      default:
        break;
    }
  }

  void dispose() {
    _notificationController.close();
  }
}
