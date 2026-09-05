// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 bool get isAvailable; bool get isLoadingAvailability; int get currentTab; DispatchOffer? get currentOffer; DispatchOffer? get activeOrder; List<DispatchOffer> get offers; double get technicianLat; double get technicianLng; bool get isProcessingOffer; String? get errorMessage; String? get successMessage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isLoadingAvailability, isLoadingAvailability) || other.isLoadingAvailability == isLoadingAvailability)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.currentOffer, currentOffer) || other.currentOffer == currentOffer)&&(identical(other.activeOrder, activeOrder) || other.activeOrder == activeOrder)&&const DeepCollectionEquality().equals(other.offers, offers)&&(identical(other.technicianLat, technicianLat) || other.technicianLat == technicianLat)&&(identical(other.technicianLng, technicianLng) || other.technicianLng == technicianLng)&&(identical(other.isProcessingOffer, isProcessingOffer) || other.isProcessingOffer == isProcessingOffer)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isAvailable,isLoadingAvailability,currentTab,currentOffer,activeOrder,const DeepCollectionEquality().hash(offers),technicianLat,technicianLng,isProcessingOffer,errorMessage,successMessage);

@override
String toString() {
  return 'HomeState(isAvailable: $isAvailable, isLoadingAvailability: $isLoadingAvailability, currentTab: $currentTab, currentOffer: $currentOffer, activeOrder: $activeOrder, offers: $offers, technicianLat: $technicianLat, technicianLng: $technicianLng, isProcessingOffer: $isProcessingOffer, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool isAvailable, bool isLoadingAvailability, int currentTab, DispatchOffer? currentOffer, DispatchOffer? activeOrder, List<DispatchOffer> offers, double technicianLat, double technicianLng, bool isProcessingOffer, String? errorMessage, String? successMessage
});


$DispatchOfferCopyWith<$Res>? get currentOffer;$DispatchOfferCopyWith<$Res>? get activeOrder;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAvailable = null,Object? isLoadingAvailability = null,Object? currentTab = null,Object? currentOffer = freezed,Object? activeOrder = freezed,Object? offers = null,Object? technicianLat = null,Object? technicianLng = null,Object? isProcessingOffer = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isLoadingAvailability: null == isLoadingAvailability ? _self.isLoadingAvailability : isLoadingAvailability // ignore: cast_nullable_to_non_nullable
as bool,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,currentOffer: freezed == currentOffer ? _self.currentOffer : currentOffer // ignore: cast_nullable_to_non_nullable
as DispatchOffer?,activeOrder: freezed == activeOrder ? _self.activeOrder : activeOrder // ignore: cast_nullable_to_non_nullable
as DispatchOffer?,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<DispatchOffer>,technicianLat: null == technicianLat ? _self.technicianLat : technicianLat // ignore: cast_nullable_to_non_nullable
as double,technicianLng: null == technicianLng ? _self.technicianLng : technicianLng // ignore: cast_nullable_to_non_nullable
as double,isProcessingOffer: null == isProcessingOffer ? _self.isProcessingOffer : isProcessingOffer // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DispatchOfferCopyWith<$Res>? get currentOffer {
    if (_self.currentOffer == null) {
    return null;
  }

  return $DispatchOfferCopyWith<$Res>(_self.currentOffer!, (value) {
    return _then(_self.copyWith(currentOffer: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DispatchOfferCopyWith<$Res>? get activeOrder {
    if (_self.activeOrder == null) {
    return null;
  }

  return $DispatchOfferCopyWith<$Res>(_self.activeOrder!, (value) {
    return _then(_self.copyWith(activeOrder: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAvailable,  bool isLoadingAvailability,  int currentTab,  DispatchOffer? currentOffer,  DispatchOffer? activeOrder,  List<DispatchOffer> offers,  double technicianLat,  double technicianLng,  bool isProcessingOffer,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isAvailable,_that.isLoadingAvailability,_that.currentTab,_that.currentOffer,_that.activeOrder,_that.offers,_that.technicianLat,_that.technicianLng,_that.isProcessingOffer,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAvailable,  bool isLoadingAvailability,  int currentTab,  DispatchOffer? currentOffer,  DispatchOffer? activeOrder,  List<DispatchOffer> offers,  double technicianLat,  double technicianLng,  bool isProcessingOffer,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.isAvailable,_that.isLoadingAvailability,_that.currentTab,_that.currentOffer,_that.activeOrder,_that.offers,_that.technicianLat,_that.technicianLng,_that.isProcessingOffer,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAvailable,  bool isLoadingAvailability,  int currentTab,  DispatchOffer? currentOffer,  DispatchOffer? activeOrder,  List<DispatchOffer> offers,  double technicianLat,  double technicianLng,  bool isProcessingOffer,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isAvailable,_that.isLoadingAvailability,_that.currentTab,_that.currentOffer,_that.activeOrder,_that.offers,_that.technicianLat,_that.technicianLng,_that.isProcessingOffer,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.isAvailable = true, this.isLoadingAvailability = false, this.currentTab = 0, this.currentOffer, this.activeOrder, final  List<DispatchOffer> offers = const [], this.technicianLat = 33.5138, this.technicianLng = 36.2765, this.isProcessingOffer = false, this.errorMessage, this.successMessage}): _offers = offers;
  

@override@JsonKey() final  bool isAvailable;
@override@JsonKey() final  bool isLoadingAvailability;
@override@JsonKey() final  int currentTab;
@override final  DispatchOffer? currentOffer;
@override final  DispatchOffer? activeOrder;
 final  List<DispatchOffer> _offers;
@override@JsonKey() List<DispatchOffer> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

@override@JsonKey() final  double technicianLat;
@override@JsonKey() final  double technicianLng;
@override@JsonKey() final  bool isProcessingOffer;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isLoadingAvailability, isLoadingAvailability) || other.isLoadingAvailability == isLoadingAvailability)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.currentOffer, currentOffer) || other.currentOffer == currentOffer)&&(identical(other.activeOrder, activeOrder) || other.activeOrder == activeOrder)&&const DeepCollectionEquality().equals(other._offers, _offers)&&(identical(other.technicianLat, technicianLat) || other.technicianLat == technicianLat)&&(identical(other.technicianLng, technicianLng) || other.technicianLng == technicianLng)&&(identical(other.isProcessingOffer, isProcessingOffer) || other.isProcessingOffer == isProcessingOffer)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isAvailable,isLoadingAvailability,currentTab,currentOffer,activeOrder,const DeepCollectionEquality().hash(_offers),technicianLat,technicianLng,isProcessingOffer,errorMessage,successMessage);

@override
String toString() {
  return 'HomeState(isAvailable: $isAvailable, isLoadingAvailability: $isLoadingAvailability, currentTab: $currentTab, currentOffer: $currentOffer, activeOrder: $activeOrder, offers: $offers, technicianLat: $technicianLat, technicianLng: $technicianLng, isProcessingOffer: $isProcessingOffer, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAvailable, bool isLoadingAvailability, int currentTab, DispatchOffer? currentOffer, DispatchOffer? activeOrder, List<DispatchOffer> offers, double technicianLat, double technicianLng, bool isProcessingOffer, String? errorMessage, String? successMessage
});


@override $DispatchOfferCopyWith<$Res>? get currentOffer;@override $DispatchOfferCopyWith<$Res>? get activeOrder;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAvailable = null,Object? isLoadingAvailability = null,Object? currentTab = null,Object? currentOffer = freezed,Object? activeOrder = freezed,Object? offers = null,Object? technicianLat = null,Object? technicianLng = null,Object? isProcessingOffer = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_HomeState(
isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isLoadingAvailability: null == isLoadingAvailability ? _self.isLoadingAvailability : isLoadingAvailability // ignore: cast_nullable_to_non_nullable
as bool,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as int,currentOffer: freezed == currentOffer ? _self.currentOffer : currentOffer // ignore: cast_nullable_to_non_nullable
as DispatchOffer?,activeOrder: freezed == activeOrder ? _self.activeOrder : activeOrder // ignore: cast_nullable_to_non_nullable
as DispatchOffer?,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<DispatchOffer>,technicianLat: null == technicianLat ? _self.technicianLat : technicianLat // ignore: cast_nullable_to_non_nullable
as double,technicianLng: null == technicianLng ? _self.technicianLng : technicianLng // ignore: cast_nullable_to_non_nullable
as double,isProcessingOffer: null == isProcessingOffer ? _self.isProcessingOffer : isProcessingOffer // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DispatchOfferCopyWith<$Res>? get currentOffer {
    if (_self.currentOffer == null) {
    return null;
  }

  return $DispatchOfferCopyWith<$Res>(_self.currentOffer!, (value) {
    return _then(_self.copyWith(currentOffer: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DispatchOfferCopyWith<$Res>? get activeOrder {
    if (_self.activeOrder == null) {
    return null;
  }

  return $DispatchOfferCopyWith<$Res>(_self.activeOrder!, (value) {
    return _then(_self.copyWith(activeOrder: value));
  });
}
}

// dart format on
