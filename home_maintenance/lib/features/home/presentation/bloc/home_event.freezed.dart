// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ToggleAvailability value)?  toggleAvailability,TResult Function( _LocationChanged value)?  locationChanged,TResult Function( _HeartbeatTick value)?  heartbeatTick,TResult Function( _FetchOffers value)?  fetchOffers,TResult Function( _AcceptOffer value)?  acceptOffer,TResult Function( _DeclineOffer value)?  declineOffer,TResult Function( _ChangeTab value)?  changeTab,TResult Function( _DismissOffer value)?  dismissOffer,TResult Function( _SimulateOffer value)?  simulateOffer,TResult Function( _ArriveOrder value)?  arriveOrder,TResult Function( _WithdrawOrder value)?  withdrawOrder,TResult Function( _SendQuote value)?  sendQuote,TResult Function( _SendAddonQuote value)?  sendAddonQuote,TResult Function( _RequestWaitingForParts value)?  requestWaitingForParts,TResult Function( _ResumeOrder value)?  resumeOrder,TResult Function( _RequestClosure value)?  requestClosure,TResult Function( _VerifyClosure value)?  verifyClosure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ToggleAvailability() when toggleAvailability != null:
return toggleAvailability(_that);case _LocationChanged() when locationChanged != null:
return locationChanged(_that);case _HeartbeatTick() when heartbeatTick != null:
return heartbeatTick(_that);case _FetchOffers() when fetchOffers != null:
return fetchOffers(_that);case _AcceptOffer() when acceptOffer != null:
return acceptOffer(_that);case _DeclineOffer() when declineOffer != null:
return declineOffer(_that);case _ChangeTab() when changeTab != null:
return changeTab(_that);case _DismissOffer() when dismissOffer != null:
return dismissOffer(_that);case _SimulateOffer() when simulateOffer != null:
return simulateOffer(_that);case _ArriveOrder() when arriveOrder != null:
return arriveOrder(_that);case _WithdrawOrder() when withdrawOrder != null:
return withdrawOrder(_that);case _SendQuote() when sendQuote != null:
return sendQuote(_that);case _SendAddonQuote() when sendAddonQuote != null:
return sendAddonQuote(_that);case _RequestWaitingForParts() when requestWaitingForParts != null:
return requestWaitingForParts(_that);case _ResumeOrder() when resumeOrder != null:
return resumeOrder(_that);case _RequestClosure() when requestClosure != null:
return requestClosure(_that);case _VerifyClosure() when verifyClosure != null:
return verifyClosure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ToggleAvailability value)  toggleAvailability,required TResult Function( _LocationChanged value)  locationChanged,required TResult Function( _HeartbeatTick value)  heartbeatTick,required TResult Function( _FetchOffers value)  fetchOffers,required TResult Function( _AcceptOffer value)  acceptOffer,required TResult Function( _DeclineOffer value)  declineOffer,required TResult Function( _ChangeTab value)  changeTab,required TResult Function( _DismissOffer value)  dismissOffer,required TResult Function( _SimulateOffer value)  simulateOffer,required TResult Function( _ArriveOrder value)  arriveOrder,required TResult Function( _WithdrawOrder value)  withdrawOrder,required TResult Function( _SendQuote value)  sendQuote,required TResult Function( _SendAddonQuote value)  sendAddonQuote,required TResult Function( _RequestWaitingForParts value)  requestWaitingForParts,required TResult Function( _ResumeOrder value)  resumeOrder,required TResult Function( _RequestClosure value)  requestClosure,required TResult Function( _VerifyClosure value)  verifyClosure,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ToggleAvailability():
return toggleAvailability(_that);case _LocationChanged():
return locationChanged(_that);case _HeartbeatTick():
return heartbeatTick(_that);case _FetchOffers():
return fetchOffers(_that);case _AcceptOffer():
return acceptOffer(_that);case _DeclineOffer():
return declineOffer(_that);case _ChangeTab():
return changeTab(_that);case _DismissOffer():
return dismissOffer(_that);case _SimulateOffer():
return simulateOffer(_that);case _ArriveOrder():
return arriveOrder(_that);case _WithdrawOrder():
return withdrawOrder(_that);case _SendQuote():
return sendQuote(_that);case _SendAddonQuote():
return sendAddonQuote(_that);case _RequestWaitingForParts():
return requestWaitingForParts(_that);case _ResumeOrder():
return resumeOrder(_that);case _RequestClosure():
return requestClosure(_that);case _VerifyClosure():
return verifyClosure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ToggleAvailability value)?  toggleAvailability,TResult? Function( _LocationChanged value)?  locationChanged,TResult? Function( _HeartbeatTick value)?  heartbeatTick,TResult? Function( _FetchOffers value)?  fetchOffers,TResult? Function( _AcceptOffer value)?  acceptOffer,TResult? Function( _DeclineOffer value)?  declineOffer,TResult? Function( _ChangeTab value)?  changeTab,TResult? Function( _DismissOffer value)?  dismissOffer,TResult? Function( _SimulateOffer value)?  simulateOffer,TResult? Function( _ArriveOrder value)?  arriveOrder,TResult? Function( _WithdrawOrder value)?  withdrawOrder,TResult? Function( _SendQuote value)?  sendQuote,TResult? Function( _SendAddonQuote value)?  sendAddonQuote,TResult? Function( _RequestWaitingForParts value)?  requestWaitingForParts,TResult? Function( _ResumeOrder value)?  resumeOrder,TResult? Function( _RequestClosure value)?  requestClosure,TResult? Function( _VerifyClosure value)?  verifyClosure,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ToggleAvailability() when toggleAvailability != null:
return toggleAvailability(_that);case _LocationChanged() when locationChanged != null:
return locationChanged(_that);case _HeartbeatTick() when heartbeatTick != null:
return heartbeatTick(_that);case _FetchOffers() when fetchOffers != null:
return fetchOffers(_that);case _AcceptOffer() when acceptOffer != null:
return acceptOffer(_that);case _DeclineOffer() when declineOffer != null:
return declineOffer(_that);case _ChangeTab() when changeTab != null:
return changeTab(_that);case _DismissOffer() when dismissOffer != null:
return dismissOffer(_that);case _SimulateOffer() when simulateOffer != null:
return simulateOffer(_that);case _ArriveOrder() when arriveOrder != null:
return arriveOrder(_that);case _WithdrawOrder() when withdrawOrder != null:
return withdrawOrder(_that);case _SendQuote() when sendQuote != null:
return sendQuote(_that);case _SendAddonQuote() when sendAddonQuote != null:
return sendAddonQuote(_that);case _RequestWaitingForParts() when requestWaitingForParts != null:
return requestWaitingForParts(_that);case _ResumeOrder() when resumeOrder != null:
return resumeOrder(_that);case _RequestClosure() when requestClosure != null:
return requestClosure(_that);case _VerifyClosure() when verifyClosure != null:
return verifyClosure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( bool isAvailable)?  toggleAvailability,TResult Function( double lat,  double lng)?  locationChanged,TResult Function()?  heartbeatTick,TResult Function()?  fetchOffers,TResult Function( int offerId)?  acceptOffer,TResult Function( int offerId,  String? reason)?  declineOffer,TResult Function( int index)?  changeTab,TResult Function()?  dismissOffer,TResult Function()?  simulateOffer,TResult Function( int orderId)?  arriveOrder,TResult Function( int orderId,  String? reason)?  withdrawOrder,TResult Function( int orderId,  String laborCost,  int warrantyDays,  List<QuotePart> parts)?  sendQuote,TResult Function( int orderId,  String laborCost,  List<QuotePart> parts)?  sendAddonQuote,TResult Function( int orderId,  String note)?  requestWaitingForParts,TResult Function( int orderId)?  resumeOrder,TResult Function( int orderId,  List<File> photos)?  requestClosure,TResult Function( int orderId,  String code)?  verifyClosure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ToggleAvailability() when toggleAvailability != null:
return toggleAvailability(_that.isAvailable);case _LocationChanged() when locationChanged != null:
return locationChanged(_that.lat,_that.lng);case _HeartbeatTick() when heartbeatTick != null:
return heartbeatTick();case _FetchOffers() when fetchOffers != null:
return fetchOffers();case _AcceptOffer() when acceptOffer != null:
return acceptOffer(_that.offerId);case _DeclineOffer() when declineOffer != null:
return declineOffer(_that.offerId,_that.reason);case _ChangeTab() when changeTab != null:
return changeTab(_that.index);case _DismissOffer() when dismissOffer != null:
return dismissOffer();case _SimulateOffer() when simulateOffer != null:
return simulateOffer();case _ArriveOrder() when arriveOrder != null:
return arriveOrder(_that.orderId);case _WithdrawOrder() when withdrawOrder != null:
return withdrawOrder(_that.orderId,_that.reason);case _SendQuote() when sendQuote != null:
return sendQuote(_that.orderId,_that.laborCost,_that.warrantyDays,_that.parts);case _SendAddonQuote() when sendAddonQuote != null:
return sendAddonQuote(_that.orderId,_that.laborCost,_that.parts);case _RequestWaitingForParts() when requestWaitingForParts != null:
return requestWaitingForParts(_that.orderId,_that.note);case _ResumeOrder() when resumeOrder != null:
return resumeOrder(_that.orderId);case _RequestClosure() when requestClosure != null:
return requestClosure(_that.orderId,_that.photos);case _VerifyClosure() when verifyClosure != null:
return verifyClosure(_that.orderId,_that.code);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( bool isAvailable)  toggleAvailability,required TResult Function( double lat,  double lng)  locationChanged,required TResult Function()  heartbeatTick,required TResult Function()  fetchOffers,required TResult Function( int offerId)  acceptOffer,required TResult Function( int offerId,  String? reason)  declineOffer,required TResult Function( int index)  changeTab,required TResult Function()  dismissOffer,required TResult Function()  simulateOffer,required TResult Function( int orderId)  arriveOrder,required TResult Function( int orderId,  String? reason)  withdrawOrder,required TResult Function( int orderId,  String laborCost,  int warrantyDays,  List<QuotePart> parts)  sendQuote,required TResult Function( int orderId,  String laborCost,  List<QuotePart> parts)  sendAddonQuote,required TResult Function( int orderId,  String note)  requestWaitingForParts,required TResult Function( int orderId)  resumeOrder,required TResult Function( int orderId,  List<File> photos)  requestClosure,required TResult Function( int orderId,  String code)  verifyClosure,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _ToggleAvailability():
return toggleAvailability(_that.isAvailable);case _LocationChanged():
return locationChanged(_that.lat,_that.lng);case _HeartbeatTick():
return heartbeatTick();case _FetchOffers():
return fetchOffers();case _AcceptOffer():
return acceptOffer(_that.offerId);case _DeclineOffer():
return declineOffer(_that.offerId,_that.reason);case _ChangeTab():
return changeTab(_that.index);case _DismissOffer():
return dismissOffer();case _SimulateOffer():
return simulateOffer();case _ArriveOrder():
return arriveOrder(_that.orderId);case _WithdrawOrder():
return withdrawOrder(_that.orderId,_that.reason);case _SendQuote():
return sendQuote(_that.orderId,_that.laborCost,_that.warrantyDays,_that.parts);case _SendAddonQuote():
return sendAddonQuote(_that.orderId,_that.laborCost,_that.parts);case _RequestWaitingForParts():
return requestWaitingForParts(_that.orderId,_that.note);case _ResumeOrder():
return resumeOrder(_that.orderId);case _RequestClosure():
return requestClosure(_that.orderId,_that.photos);case _VerifyClosure():
return verifyClosure(_that.orderId,_that.code);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( bool isAvailable)?  toggleAvailability,TResult? Function( double lat,  double lng)?  locationChanged,TResult? Function()?  heartbeatTick,TResult? Function()?  fetchOffers,TResult? Function( int offerId)?  acceptOffer,TResult? Function( int offerId,  String? reason)?  declineOffer,TResult? Function( int index)?  changeTab,TResult? Function()?  dismissOffer,TResult? Function()?  simulateOffer,TResult? Function( int orderId)?  arriveOrder,TResult? Function( int orderId,  String? reason)?  withdrawOrder,TResult? Function( int orderId,  String laborCost,  int warrantyDays,  List<QuotePart> parts)?  sendQuote,TResult? Function( int orderId,  String laborCost,  List<QuotePart> parts)?  sendAddonQuote,TResult? Function( int orderId,  String note)?  requestWaitingForParts,TResult? Function( int orderId)?  resumeOrder,TResult? Function( int orderId,  List<File> photos)?  requestClosure,TResult? Function( int orderId,  String code)?  verifyClosure,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ToggleAvailability() when toggleAvailability != null:
return toggleAvailability(_that.isAvailable);case _LocationChanged() when locationChanged != null:
return locationChanged(_that.lat,_that.lng);case _HeartbeatTick() when heartbeatTick != null:
return heartbeatTick();case _FetchOffers() when fetchOffers != null:
return fetchOffers();case _AcceptOffer() when acceptOffer != null:
return acceptOffer(_that.offerId);case _DeclineOffer() when declineOffer != null:
return declineOffer(_that.offerId,_that.reason);case _ChangeTab() when changeTab != null:
return changeTab(_that.index);case _DismissOffer() when dismissOffer != null:
return dismissOffer();case _SimulateOffer() when simulateOffer != null:
return simulateOffer();case _ArriveOrder() when arriveOrder != null:
return arriveOrder(_that.orderId);case _WithdrawOrder() when withdrawOrder != null:
return withdrawOrder(_that.orderId,_that.reason);case _SendQuote() when sendQuote != null:
return sendQuote(_that.orderId,_that.laborCost,_that.warrantyDays,_that.parts);case _SendAddonQuote() when sendAddonQuote != null:
return sendAddonQuote(_that.orderId,_that.laborCost,_that.parts);case _RequestWaitingForParts() when requestWaitingForParts != null:
return requestWaitingForParts(_that.orderId,_that.note);case _ResumeOrder() when resumeOrder != null:
return resumeOrder(_that.orderId);case _RequestClosure() when requestClosure != null:
return requestClosure(_that.orderId,_that.photos);case _VerifyClosure() when verifyClosure != null:
return verifyClosure(_that.orderId,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements HomeEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.init()';
}


}




/// @nodoc


class _ToggleAvailability implements HomeEvent {
  const _ToggleAvailability(this.isAvailable);
  

 final  bool isAvailable;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleAvailabilityCopyWith<_ToggleAvailability> get copyWith => __$ToggleAvailabilityCopyWithImpl<_ToggleAvailability>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleAvailability&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,isAvailable);

@override
String toString() {
  return 'HomeEvent.toggleAvailability(isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$ToggleAvailabilityCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ToggleAvailabilityCopyWith(_ToggleAvailability value, $Res Function(_ToggleAvailability) _then) = __$ToggleAvailabilityCopyWithImpl;
@useResult
$Res call({
 bool isAvailable
});




}
/// @nodoc
class __$ToggleAvailabilityCopyWithImpl<$Res>
    implements _$ToggleAvailabilityCopyWith<$Res> {
  __$ToggleAvailabilityCopyWithImpl(this._self, this._then);

  final _ToggleAvailability _self;
  final $Res Function(_ToggleAvailability) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isAvailable = null,}) {
  return _then(_ToggleAvailability(
null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _LocationChanged implements HomeEvent {
  const _LocationChanged({required this.lat, required this.lng});
  

 final  double lat;
 final  double lng;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationChangedCopyWith<_LocationChanged> get copyWith => __$LocationChangedCopyWithImpl<_LocationChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationChanged&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}


@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'HomeEvent.locationChanged(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$LocationChangedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$LocationChangedCopyWith(_LocationChanged value, $Res Function(_LocationChanged) _then) = __$LocationChangedCopyWithImpl;
@useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class __$LocationChangedCopyWithImpl<$Res>
    implements _$LocationChangedCopyWith<$Res> {
  __$LocationChangedCopyWithImpl(this._self, this._then);

  final _LocationChanged _self;
  final $Res Function(_LocationChanged) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_LocationChanged(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _HeartbeatTick implements HomeEvent {
  const _HeartbeatTick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeartbeatTick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.heartbeatTick()';
}


}




/// @nodoc


class _FetchOffers implements HomeEvent {
  const _FetchOffers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchOffers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.fetchOffers()';
}


}




/// @nodoc


class _AcceptOffer implements HomeEvent {
  const _AcceptOffer(this.offerId);
  

 final  int offerId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptOfferCopyWith<_AcceptOffer> get copyWith => __$AcceptOfferCopyWithImpl<_AcceptOffer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptOffer&&(identical(other.offerId, offerId) || other.offerId == offerId));
}


@override
int get hashCode => Object.hash(runtimeType,offerId);

@override
String toString() {
  return 'HomeEvent.acceptOffer(offerId: $offerId)';
}


}

/// @nodoc
abstract mixin class _$AcceptOfferCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$AcceptOfferCopyWith(_AcceptOffer value, $Res Function(_AcceptOffer) _then) = __$AcceptOfferCopyWithImpl;
@useResult
$Res call({
 int offerId
});




}
/// @nodoc
class __$AcceptOfferCopyWithImpl<$Res>
    implements _$AcceptOfferCopyWith<$Res> {
  __$AcceptOfferCopyWithImpl(this._self, this._then);

  final _AcceptOffer _self;
  final $Res Function(_AcceptOffer) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offerId = null,}) {
  return _then(_AcceptOffer(
null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DeclineOffer implements HomeEvent {
  const _DeclineOffer(this.offerId, [this.reason]);
  

 final  int offerId;
 final  String? reason;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeclineOfferCopyWith<_DeclineOffer> get copyWith => __$DeclineOfferCopyWithImpl<_DeclineOffer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeclineOffer&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,offerId,reason);

@override
String toString() {
  return 'HomeEvent.declineOffer(offerId: $offerId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$DeclineOfferCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$DeclineOfferCopyWith(_DeclineOffer value, $Res Function(_DeclineOffer) _then) = __$DeclineOfferCopyWithImpl;
@useResult
$Res call({
 int offerId, String? reason
});




}
/// @nodoc
class __$DeclineOfferCopyWithImpl<$Res>
    implements _$DeclineOfferCopyWith<$Res> {
  __$DeclineOfferCopyWithImpl(this._self, this._then);

  final _DeclineOffer _self;
  final $Res Function(_DeclineOffer) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offerId = null,Object? reason = freezed,}) {
  return _then(_DeclineOffer(
null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as int,freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ChangeTab implements HomeEvent {
  const _ChangeTab(this.index);
  

 final  int index;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTabCopyWith<_ChangeTab> get copyWith => __$ChangeTabCopyWithImpl<_ChangeTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTab&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'HomeEvent.changeTab(index: $index)';
}


}

/// @nodoc
abstract mixin class _$ChangeTabCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ChangeTabCopyWith(_ChangeTab value, $Res Function(_ChangeTab) _then) = __$ChangeTabCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$ChangeTabCopyWithImpl<$Res>
    implements _$ChangeTabCopyWith<$Res> {
  __$ChangeTabCopyWithImpl(this._self, this._then);

  final _ChangeTab _self;
  final $Res Function(_ChangeTab) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_ChangeTab(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _DismissOffer implements HomeEvent {
  const _DismissOffer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DismissOffer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.dismissOffer()';
}


}




/// @nodoc


class _SimulateOffer implements HomeEvent {
  const _SimulateOffer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimulateOffer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.simulateOffer()';
}


}




/// @nodoc


class _ArriveOrder implements HomeEvent {
  const _ArriveOrder(this.orderId);
  

 final  int orderId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArriveOrderCopyWith<_ArriveOrder> get copyWith => __$ArriveOrderCopyWithImpl<_ArriveOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArriveOrder&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'HomeEvent.arriveOrder(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$ArriveOrderCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ArriveOrderCopyWith(_ArriveOrder value, $Res Function(_ArriveOrder) _then) = __$ArriveOrderCopyWithImpl;
@useResult
$Res call({
 int orderId
});




}
/// @nodoc
class __$ArriveOrderCopyWithImpl<$Res>
    implements _$ArriveOrderCopyWith<$Res> {
  __$ArriveOrderCopyWithImpl(this._self, this._then);

  final _ArriveOrder _self;
  final $Res Function(_ArriveOrder) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_ArriveOrder(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _WithdrawOrder implements HomeEvent {
  const _WithdrawOrder(this.orderId, [this.reason]);
  

 final  int orderId;
 final  String? reason;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawOrderCopyWith<_WithdrawOrder> get copyWith => __$WithdrawOrderCopyWithImpl<_WithdrawOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawOrder&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,reason);

@override
String toString() {
  return 'HomeEvent.withdrawOrder(orderId: $orderId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$WithdrawOrderCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$WithdrawOrderCopyWith(_WithdrawOrder value, $Res Function(_WithdrawOrder) _then) = __$WithdrawOrderCopyWithImpl;
@useResult
$Res call({
 int orderId, String? reason
});




}
/// @nodoc
class __$WithdrawOrderCopyWithImpl<$Res>
    implements _$WithdrawOrderCopyWith<$Res> {
  __$WithdrawOrderCopyWithImpl(this._self, this._then);

  final _WithdrawOrder _self;
  final $Res Function(_WithdrawOrder) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? reason = freezed,}) {
  return _then(_WithdrawOrder(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SendQuote implements HomeEvent {
  const _SendQuote({required this.orderId, required this.laborCost, required this.warrantyDays, required final  List<QuotePart> parts}): _parts = parts;
  

 final  int orderId;
 final  String laborCost;
 final  int warrantyDays;
 final  List<QuotePart> _parts;
 List<QuotePart> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendQuoteCopyWith<_SendQuote> get copyWith => __$SendQuoteCopyWithImpl<_SendQuote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendQuote&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.laborCost, laborCost) || other.laborCost == laborCost)&&(identical(other.warrantyDays, warrantyDays) || other.warrantyDays == warrantyDays)&&const DeepCollectionEquality().equals(other._parts, _parts));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,laborCost,warrantyDays,const DeepCollectionEquality().hash(_parts));

@override
String toString() {
  return 'HomeEvent.sendQuote(orderId: $orderId, laborCost: $laborCost, warrantyDays: $warrantyDays, parts: $parts)';
}


}

/// @nodoc
abstract mixin class _$SendQuoteCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SendQuoteCopyWith(_SendQuote value, $Res Function(_SendQuote) _then) = __$SendQuoteCopyWithImpl;
@useResult
$Res call({
 int orderId, String laborCost, int warrantyDays, List<QuotePart> parts
});




}
/// @nodoc
class __$SendQuoteCopyWithImpl<$Res>
    implements _$SendQuoteCopyWith<$Res> {
  __$SendQuoteCopyWithImpl(this._self, this._then);

  final _SendQuote _self;
  final $Res Function(_SendQuote) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? laborCost = null,Object? warrantyDays = null,Object? parts = null,}) {
  return _then(_SendQuote(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,laborCost: null == laborCost ? _self.laborCost : laborCost // ignore: cast_nullable_to_non_nullable
as String,warrantyDays: null == warrantyDays ? _self.warrantyDays : warrantyDays // ignore: cast_nullable_to_non_nullable
as int,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<QuotePart>,
  ));
}


}

/// @nodoc


class _SendAddonQuote implements HomeEvent {
  const _SendAddonQuote({required this.orderId, required this.laborCost, required final  List<QuotePart> parts}): _parts = parts;
  

 final  int orderId;
 final  String laborCost;
 final  List<QuotePart> _parts;
 List<QuotePart> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendAddonQuoteCopyWith<_SendAddonQuote> get copyWith => __$SendAddonQuoteCopyWithImpl<_SendAddonQuote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendAddonQuote&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.laborCost, laborCost) || other.laborCost == laborCost)&&const DeepCollectionEquality().equals(other._parts, _parts));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,laborCost,const DeepCollectionEquality().hash(_parts));

@override
String toString() {
  return 'HomeEvent.sendAddonQuote(orderId: $orderId, laborCost: $laborCost, parts: $parts)';
}


}

/// @nodoc
abstract mixin class _$SendAddonQuoteCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SendAddonQuoteCopyWith(_SendAddonQuote value, $Res Function(_SendAddonQuote) _then) = __$SendAddonQuoteCopyWithImpl;
@useResult
$Res call({
 int orderId, String laborCost, List<QuotePart> parts
});




}
/// @nodoc
class __$SendAddonQuoteCopyWithImpl<$Res>
    implements _$SendAddonQuoteCopyWith<$Res> {
  __$SendAddonQuoteCopyWithImpl(this._self, this._then);

  final _SendAddonQuote _self;
  final $Res Function(_SendAddonQuote) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? laborCost = null,Object? parts = null,}) {
  return _then(_SendAddonQuote(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,laborCost: null == laborCost ? _self.laborCost : laborCost // ignore: cast_nullable_to_non_nullable
as String,parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<QuotePart>,
  ));
}


}

/// @nodoc


class _RequestWaitingForParts implements HomeEvent {
  const _RequestWaitingForParts({required this.orderId, required this.note});
  

 final  int orderId;
 final  String note;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestWaitingForPartsCopyWith<_RequestWaitingForParts> get copyWith => __$RequestWaitingForPartsCopyWithImpl<_RequestWaitingForParts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestWaitingForParts&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,note);

@override
String toString() {
  return 'HomeEvent.requestWaitingForParts(orderId: $orderId, note: $note)';
}


}

/// @nodoc
abstract mixin class _$RequestWaitingForPartsCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$RequestWaitingForPartsCopyWith(_RequestWaitingForParts value, $Res Function(_RequestWaitingForParts) _then) = __$RequestWaitingForPartsCopyWithImpl;
@useResult
$Res call({
 int orderId, String note
});




}
/// @nodoc
class __$RequestWaitingForPartsCopyWithImpl<$Res>
    implements _$RequestWaitingForPartsCopyWith<$Res> {
  __$RequestWaitingForPartsCopyWithImpl(this._self, this._then);

  final _RequestWaitingForParts _self;
  final $Res Function(_RequestWaitingForParts) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? note = null,}) {
  return _then(_RequestWaitingForParts(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResumeOrder implements HomeEvent {
  const _ResumeOrder(this.orderId);
  

 final  int orderId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeOrderCopyWith<_ResumeOrder> get copyWith => __$ResumeOrderCopyWithImpl<_ResumeOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeOrder&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'HomeEvent.resumeOrder(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$ResumeOrderCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ResumeOrderCopyWith(_ResumeOrder value, $Res Function(_ResumeOrder) _then) = __$ResumeOrderCopyWithImpl;
@useResult
$Res call({
 int orderId
});




}
/// @nodoc
class __$ResumeOrderCopyWithImpl<$Res>
    implements _$ResumeOrderCopyWith<$Res> {
  __$ResumeOrderCopyWithImpl(this._self, this._then);

  final _ResumeOrder _self;
  final $Res Function(_ResumeOrder) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_ResumeOrder(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RequestClosure implements HomeEvent {
  const _RequestClosure({required this.orderId, required final  List<File> photos}): _photos = photos;
  

 final  int orderId;
 final  List<File> _photos;
 List<File> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestClosureCopyWith<_RequestClosure> get copyWith => __$RequestClosureCopyWithImpl<_RequestClosure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestClosure&&(identical(other.orderId, orderId) || other.orderId == orderId)&&const DeepCollectionEquality().equals(other._photos, _photos));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,const DeepCollectionEquality().hash(_photos));

@override
String toString() {
  return 'HomeEvent.requestClosure(orderId: $orderId, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$RequestClosureCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$RequestClosureCopyWith(_RequestClosure value, $Res Function(_RequestClosure) _then) = __$RequestClosureCopyWithImpl;
@useResult
$Res call({
 int orderId, List<File> photos
});




}
/// @nodoc
class __$RequestClosureCopyWithImpl<$Res>
    implements _$RequestClosureCopyWith<$Res> {
  __$RequestClosureCopyWithImpl(this._self, this._then);

  final _RequestClosure _self;
  final $Res Function(_RequestClosure) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? photos = null,}) {
  return _then(_RequestClosure(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}


}

/// @nodoc


class _VerifyClosure implements HomeEvent {
  const _VerifyClosure({required this.orderId, required this.code});
  

 final  int orderId;
 final  String code;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyClosureCopyWith<_VerifyClosure> get copyWith => __$VerifyClosureCopyWithImpl<_VerifyClosure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyClosure&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,code);

@override
String toString() {
  return 'HomeEvent.verifyClosure(orderId: $orderId, code: $code)';
}


}

/// @nodoc
abstract mixin class _$VerifyClosureCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$VerifyClosureCopyWith(_VerifyClosure value, $Res Function(_VerifyClosure) _then) = __$VerifyClosureCopyWithImpl;
@useResult
$Res call({
 int orderId, String code
});




}
/// @nodoc
class __$VerifyClosureCopyWithImpl<$Res>
    implements _$VerifyClosureCopyWith<$Res> {
  __$VerifyClosureCopyWithImpl(this._self, this._then);

  final _VerifyClosure _self;
  final $Res Function(_VerifyClosure) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? code = null,}) {
  return _then(_VerifyClosure(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
