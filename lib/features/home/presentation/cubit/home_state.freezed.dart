// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _GetTicketsLoading value)?  getTicketsLoading,TResult Function( _GetTicketsSuccess value)?  getTicketsSuccess,TResult Function( _GetTicketsFailure value)?  getTicketsFailure,TResult Function( _GetTicketByIdLoading value)?  getTicketByIdLoading,TResult Function( _GetTicketByIdSuccess value)?  getTicketByIdSuccess,TResult Function( _GetTicketByIdFailure value)?  getTicketByIdFailure,TResult Function( _CreateTicketLoading value)?  createTicketLoading,TResult Function( _CreateTicketSuccess value)?  createTicketSuccess,TResult Function( _CreateTicketFailure value)?  createTicketFailure,TResult Function( _UpdateTicketStatusLoading value)?  updateTicketStatusLoading,TResult Function( _UpdateTicketStatusSuccess value)?  updateTicketStatusSuccess,TResult Function( _UpdateTicketStatusFailure value)?  updateTicketStatusFailure,TResult Function( _GetTicketCommentsLoading value)?  getTicketCommentsLoading,TResult Function( _GetTicketCommentsSuccess value)?  getTicketCommentsSuccess,TResult Function( _GetTicketCommentsFailure value)?  getTicketCommentsFailure,TResult Function( _AddCommentLoading value)?  addCommentLoading,TResult Function( _AddCommentSuccess value)?  addCommentSuccess,TResult Function( _AddCommentFailure value)?  addCommentFailure,TResult Function( _GetTicketActivitiesLoading value)?  getTicketActivitiesLoading,TResult Function( _GetTicketActivitiesSuccess value)?  getTicketActivitiesSuccess,TResult Function( _GetTicketActivitiesFailure value)?  getTicketActivitiesFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _GetTicketsLoading() when getTicketsLoading != null:
return getTicketsLoading(_that);case _GetTicketsSuccess() when getTicketsSuccess != null:
return getTicketsSuccess(_that);case _GetTicketsFailure() when getTicketsFailure != null:
return getTicketsFailure(_that);case _GetTicketByIdLoading() when getTicketByIdLoading != null:
return getTicketByIdLoading(_that);case _GetTicketByIdSuccess() when getTicketByIdSuccess != null:
return getTicketByIdSuccess(_that);case _GetTicketByIdFailure() when getTicketByIdFailure != null:
return getTicketByIdFailure(_that);case _CreateTicketLoading() when createTicketLoading != null:
return createTicketLoading(_that);case _CreateTicketSuccess() when createTicketSuccess != null:
return createTicketSuccess(_that);case _CreateTicketFailure() when createTicketFailure != null:
return createTicketFailure(_that);case _UpdateTicketStatusLoading() when updateTicketStatusLoading != null:
return updateTicketStatusLoading(_that);case _UpdateTicketStatusSuccess() when updateTicketStatusSuccess != null:
return updateTicketStatusSuccess(_that);case _UpdateTicketStatusFailure() when updateTicketStatusFailure != null:
return updateTicketStatusFailure(_that);case _GetTicketCommentsLoading() when getTicketCommentsLoading != null:
return getTicketCommentsLoading(_that);case _GetTicketCommentsSuccess() when getTicketCommentsSuccess != null:
return getTicketCommentsSuccess(_that);case _GetTicketCommentsFailure() when getTicketCommentsFailure != null:
return getTicketCommentsFailure(_that);case _AddCommentLoading() when addCommentLoading != null:
return addCommentLoading(_that);case _AddCommentSuccess() when addCommentSuccess != null:
return addCommentSuccess(_that);case _AddCommentFailure() when addCommentFailure != null:
return addCommentFailure(_that);case _GetTicketActivitiesLoading() when getTicketActivitiesLoading != null:
return getTicketActivitiesLoading(_that);case _GetTicketActivitiesSuccess() when getTicketActivitiesSuccess != null:
return getTicketActivitiesSuccess(_that);case _GetTicketActivitiesFailure() when getTicketActivitiesFailure != null:
return getTicketActivitiesFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _GetTicketsLoading value)  getTicketsLoading,required TResult Function( _GetTicketsSuccess value)  getTicketsSuccess,required TResult Function( _GetTicketsFailure value)  getTicketsFailure,required TResult Function( _GetTicketByIdLoading value)  getTicketByIdLoading,required TResult Function( _GetTicketByIdSuccess value)  getTicketByIdSuccess,required TResult Function( _GetTicketByIdFailure value)  getTicketByIdFailure,required TResult Function( _CreateTicketLoading value)  createTicketLoading,required TResult Function( _CreateTicketSuccess value)  createTicketSuccess,required TResult Function( _CreateTicketFailure value)  createTicketFailure,required TResult Function( _UpdateTicketStatusLoading value)  updateTicketStatusLoading,required TResult Function( _UpdateTicketStatusSuccess value)  updateTicketStatusSuccess,required TResult Function( _UpdateTicketStatusFailure value)  updateTicketStatusFailure,required TResult Function( _GetTicketCommentsLoading value)  getTicketCommentsLoading,required TResult Function( _GetTicketCommentsSuccess value)  getTicketCommentsSuccess,required TResult Function( _GetTicketCommentsFailure value)  getTicketCommentsFailure,required TResult Function( _AddCommentLoading value)  addCommentLoading,required TResult Function( _AddCommentSuccess value)  addCommentSuccess,required TResult Function( _AddCommentFailure value)  addCommentFailure,required TResult Function( _GetTicketActivitiesLoading value)  getTicketActivitiesLoading,required TResult Function( _GetTicketActivitiesSuccess value)  getTicketActivitiesSuccess,required TResult Function( _GetTicketActivitiesFailure value)  getTicketActivitiesFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _GetTicketsLoading():
return getTicketsLoading(_that);case _GetTicketsSuccess():
return getTicketsSuccess(_that);case _GetTicketsFailure():
return getTicketsFailure(_that);case _GetTicketByIdLoading():
return getTicketByIdLoading(_that);case _GetTicketByIdSuccess():
return getTicketByIdSuccess(_that);case _GetTicketByIdFailure():
return getTicketByIdFailure(_that);case _CreateTicketLoading():
return createTicketLoading(_that);case _CreateTicketSuccess():
return createTicketSuccess(_that);case _CreateTicketFailure():
return createTicketFailure(_that);case _UpdateTicketStatusLoading():
return updateTicketStatusLoading(_that);case _UpdateTicketStatusSuccess():
return updateTicketStatusSuccess(_that);case _UpdateTicketStatusFailure():
return updateTicketStatusFailure(_that);case _GetTicketCommentsLoading():
return getTicketCommentsLoading(_that);case _GetTicketCommentsSuccess():
return getTicketCommentsSuccess(_that);case _GetTicketCommentsFailure():
return getTicketCommentsFailure(_that);case _AddCommentLoading():
return addCommentLoading(_that);case _AddCommentSuccess():
return addCommentSuccess(_that);case _AddCommentFailure():
return addCommentFailure(_that);case _GetTicketActivitiesLoading():
return getTicketActivitiesLoading(_that);case _GetTicketActivitiesSuccess():
return getTicketActivitiesSuccess(_that);case _GetTicketActivitiesFailure():
return getTicketActivitiesFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _GetTicketsLoading value)?  getTicketsLoading,TResult? Function( _GetTicketsSuccess value)?  getTicketsSuccess,TResult? Function( _GetTicketsFailure value)?  getTicketsFailure,TResult? Function( _GetTicketByIdLoading value)?  getTicketByIdLoading,TResult? Function( _GetTicketByIdSuccess value)?  getTicketByIdSuccess,TResult? Function( _GetTicketByIdFailure value)?  getTicketByIdFailure,TResult? Function( _CreateTicketLoading value)?  createTicketLoading,TResult? Function( _CreateTicketSuccess value)?  createTicketSuccess,TResult? Function( _CreateTicketFailure value)?  createTicketFailure,TResult? Function( _UpdateTicketStatusLoading value)?  updateTicketStatusLoading,TResult? Function( _UpdateTicketStatusSuccess value)?  updateTicketStatusSuccess,TResult? Function( _UpdateTicketStatusFailure value)?  updateTicketStatusFailure,TResult? Function( _GetTicketCommentsLoading value)?  getTicketCommentsLoading,TResult? Function( _GetTicketCommentsSuccess value)?  getTicketCommentsSuccess,TResult? Function( _GetTicketCommentsFailure value)?  getTicketCommentsFailure,TResult? Function( _AddCommentLoading value)?  addCommentLoading,TResult? Function( _AddCommentSuccess value)?  addCommentSuccess,TResult? Function( _AddCommentFailure value)?  addCommentFailure,TResult? Function( _GetTicketActivitiesLoading value)?  getTicketActivitiesLoading,TResult? Function( _GetTicketActivitiesSuccess value)?  getTicketActivitiesSuccess,TResult? Function( _GetTicketActivitiesFailure value)?  getTicketActivitiesFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _GetTicketsLoading() when getTicketsLoading != null:
return getTicketsLoading(_that);case _GetTicketsSuccess() when getTicketsSuccess != null:
return getTicketsSuccess(_that);case _GetTicketsFailure() when getTicketsFailure != null:
return getTicketsFailure(_that);case _GetTicketByIdLoading() when getTicketByIdLoading != null:
return getTicketByIdLoading(_that);case _GetTicketByIdSuccess() when getTicketByIdSuccess != null:
return getTicketByIdSuccess(_that);case _GetTicketByIdFailure() when getTicketByIdFailure != null:
return getTicketByIdFailure(_that);case _CreateTicketLoading() when createTicketLoading != null:
return createTicketLoading(_that);case _CreateTicketSuccess() when createTicketSuccess != null:
return createTicketSuccess(_that);case _CreateTicketFailure() when createTicketFailure != null:
return createTicketFailure(_that);case _UpdateTicketStatusLoading() when updateTicketStatusLoading != null:
return updateTicketStatusLoading(_that);case _UpdateTicketStatusSuccess() when updateTicketStatusSuccess != null:
return updateTicketStatusSuccess(_that);case _UpdateTicketStatusFailure() when updateTicketStatusFailure != null:
return updateTicketStatusFailure(_that);case _GetTicketCommentsLoading() when getTicketCommentsLoading != null:
return getTicketCommentsLoading(_that);case _GetTicketCommentsSuccess() when getTicketCommentsSuccess != null:
return getTicketCommentsSuccess(_that);case _GetTicketCommentsFailure() when getTicketCommentsFailure != null:
return getTicketCommentsFailure(_that);case _AddCommentLoading() when addCommentLoading != null:
return addCommentLoading(_that);case _AddCommentSuccess() when addCommentSuccess != null:
return addCommentSuccess(_that);case _AddCommentFailure() when addCommentFailure != null:
return addCommentFailure(_that);case _GetTicketActivitiesLoading() when getTicketActivitiesLoading != null:
return getTicketActivitiesLoading(_that);case _GetTicketActivitiesSuccess() when getTicketActivitiesSuccess != null:
return getTicketActivitiesSuccess(_that);case _GetTicketActivitiesFailure() when getTicketActivitiesFailure != null:
return getTicketActivitiesFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getTicketsLoading,TResult Function( TicketsPaginationResponseModel tickets)?  getTicketsSuccess,TResult Function( ApiErrorModel error)?  getTicketsFailure,TResult Function()?  getTicketByIdLoading,TResult Function( TicketResponseModel ticket)?  getTicketByIdSuccess,TResult Function( ApiErrorModel error)?  getTicketByIdFailure,TResult Function()?  createTicketLoading,TResult Function( TicketResponseModel ticket)?  createTicketSuccess,TResult Function( ApiErrorModel error)?  createTicketFailure,TResult Function()?  updateTicketStatusLoading,TResult Function( ApiResponseModel response)?  updateTicketStatusSuccess,TResult Function( ApiErrorModel error)?  updateTicketStatusFailure,TResult Function()?  getTicketCommentsLoading,TResult Function( List<TicketCommentResponseModel> comments)?  getTicketCommentsSuccess,TResult Function( ApiErrorModel error)?  getTicketCommentsFailure,TResult Function()?  addCommentLoading,TResult Function( ApiResponseModel response)?  addCommentSuccess,TResult Function( ApiErrorModel apiErrorModel)?  addCommentFailure,TResult Function()?  getTicketActivitiesLoading,TResult Function( List<TicketActivityResponseModel> activities)?  getTicketActivitiesSuccess,TResult Function( ApiErrorModel error)?  getTicketActivitiesFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _GetTicketsLoading() when getTicketsLoading != null:
return getTicketsLoading();case _GetTicketsSuccess() when getTicketsSuccess != null:
return getTicketsSuccess(_that.tickets);case _GetTicketsFailure() when getTicketsFailure != null:
return getTicketsFailure(_that.error);case _GetTicketByIdLoading() when getTicketByIdLoading != null:
return getTicketByIdLoading();case _GetTicketByIdSuccess() when getTicketByIdSuccess != null:
return getTicketByIdSuccess(_that.ticket);case _GetTicketByIdFailure() when getTicketByIdFailure != null:
return getTicketByIdFailure(_that.error);case _CreateTicketLoading() when createTicketLoading != null:
return createTicketLoading();case _CreateTicketSuccess() when createTicketSuccess != null:
return createTicketSuccess(_that.ticket);case _CreateTicketFailure() when createTicketFailure != null:
return createTicketFailure(_that.error);case _UpdateTicketStatusLoading() when updateTicketStatusLoading != null:
return updateTicketStatusLoading();case _UpdateTicketStatusSuccess() when updateTicketStatusSuccess != null:
return updateTicketStatusSuccess(_that.response);case _UpdateTicketStatusFailure() when updateTicketStatusFailure != null:
return updateTicketStatusFailure(_that.error);case _GetTicketCommentsLoading() when getTicketCommentsLoading != null:
return getTicketCommentsLoading();case _GetTicketCommentsSuccess() when getTicketCommentsSuccess != null:
return getTicketCommentsSuccess(_that.comments);case _GetTicketCommentsFailure() when getTicketCommentsFailure != null:
return getTicketCommentsFailure(_that.error);case _AddCommentLoading() when addCommentLoading != null:
return addCommentLoading();case _AddCommentSuccess() when addCommentSuccess != null:
return addCommentSuccess(_that.response);case _AddCommentFailure() when addCommentFailure != null:
return addCommentFailure(_that.apiErrorModel);case _GetTicketActivitiesLoading() when getTicketActivitiesLoading != null:
return getTicketActivitiesLoading();case _GetTicketActivitiesSuccess() when getTicketActivitiesSuccess != null:
return getTicketActivitiesSuccess(_that.activities);case _GetTicketActivitiesFailure() when getTicketActivitiesFailure != null:
return getTicketActivitiesFailure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getTicketsLoading,required TResult Function( TicketsPaginationResponseModel tickets)  getTicketsSuccess,required TResult Function( ApiErrorModel error)  getTicketsFailure,required TResult Function()  getTicketByIdLoading,required TResult Function( TicketResponseModel ticket)  getTicketByIdSuccess,required TResult Function( ApiErrorModel error)  getTicketByIdFailure,required TResult Function()  createTicketLoading,required TResult Function( TicketResponseModel ticket)  createTicketSuccess,required TResult Function( ApiErrorModel error)  createTicketFailure,required TResult Function()  updateTicketStatusLoading,required TResult Function( ApiResponseModel response)  updateTicketStatusSuccess,required TResult Function( ApiErrorModel error)  updateTicketStatusFailure,required TResult Function()  getTicketCommentsLoading,required TResult Function( List<TicketCommentResponseModel> comments)  getTicketCommentsSuccess,required TResult Function( ApiErrorModel error)  getTicketCommentsFailure,required TResult Function()  addCommentLoading,required TResult Function( ApiResponseModel response)  addCommentSuccess,required TResult Function( ApiErrorModel apiErrorModel)  addCommentFailure,required TResult Function()  getTicketActivitiesLoading,required TResult Function( List<TicketActivityResponseModel> activities)  getTicketActivitiesSuccess,required TResult Function( ApiErrorModel error)  getTicketActivitiesFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _GetTicketsLoading():
return getTicketsLoading();case _GetTicketsSuccess():
return getTicketsSuccess(_that.tickets);case _GetTicketsFailure():
return getTicketsFailure(_that.error);case _GetTicketByIdLoading():
return getTicketByIdLoading();case _GetTicketByIdSuccess():
return getTicketByIdSuccess(_that.ticket);case _GetTicketByIdFailure():
return getTicketByIdFailure(_that.error);case _CreateTicketLoading():
return createTicketLoading();case _CreateTicketSuccess():
return createTicketSuccess(_that.ticket);case _CreateTicketFailure():
return createTicketFailure(_that.error);case _UpdateTicketStatusLoading():
return updateTicketStatusLoading();case _UpdateTicketStatusSuccess():
return updateTicketStatusSuccess(_that.response);case _UpdateTicketStatusFailure():
return updateTicketStatusFailure(_that.error);case _GetTicketCommentsLoading():
return getTicketCommentsLoading();case _GetTicketCommentsSuccess():
return getTicketCommentsSuccess(_that.comments);case _GetTicketCommentsFailure():
return getTicketCommentsFailure(_that.error);case _AddCommentLoading():
return addCommentLoading();case _AddCommentSuccess():
return addCommentSuccess(_that.response);case _AddCommentFailure():
return addCommentFailure(_that.apiErrorModel);case _GetTicketActivitiesLoading():
return getTicketActivitiesLoading();case _GetTicketActivitiesSuccess():
return getTicketActivitiesSuccess(_that.activities);case _GetTicketActivitiesFailure():
return getTicketActivitiesFailure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getTicketsLoading,TResult? Function( TicketsPaginationResponseModel tickets)?  getTicketsSuccess,TResult? Function( ApiErrorModel error)?  getTicketsFailure,TResult? Function()?  getTicketByIdLoading,TResult? Function( TicketResponseModel ticket)?  getTicketByIdSuccess,TResult? Function( ApiErrorModel error)?  getTicketByIdFailure,TResult? Function()?  createTicketLoading,TResult? Function( TicketResponseModel ticket)?  createTicketSuccess,TResult? Function( ApiErrorModel error)?  createTicketFailure,TResult? Function()?  updateTicketStatusLoading,TResult? Function( ApiResponseModel response)?  updateTicketStatusSuccess,TResult? Function( ApiErrorModel error)?  updateTicketStatusFailure,TResult? Function()?  getTicketCommentsLoading,TResult? Function( List<TicketCommentResponseModel> comments)?  getTicketCommentsSuccess,TResult? Function( ApiErrorModel error)?  getTicketCommentsFailure,TResult? Function()?  addCommentLoading,TResult? Function( ApiResponseModel response)?  addCommentSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  addCommentFailure,TResult? Function()?  getTicketActivitiesLoading,TResult? Function( List<TicketActivityResponseModel> activities)?  getTicketActivitiesSuccess,TResult? Function( ApiErrorModel error)?  getTicketActivitiesFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _GetTicketsLoading() when getTicketsLoading != null:
return getTicketsLoading();case _GetTicketsSuccess() when getTicketsSuccess != null:
return getTicketsSuccess(_that.tickets);case _GetTicketsFailure() when getTicketsFailure != null:
return getTicketsFailure(_that.error);case _GetTicketByIdLoading() when getTicketByIdLoading != null:
return getTicketByIdLoading();case _GetTicketByIdSuccess() when getTicketByIdSuccess != null:
return getTicketByIdSuccess(_that.ticket);case _GetTicketByIdFailure() when getTicketByIdFailure != null:
return getTicketByIdFailure(_that.error);case _CreateTicketLoading() when createTicketLoading != null:
return createTicketLoading();case _CreateTicketSuccess() when createTicketSuccess != null:
return createTicketSuccess(_that.ticket);case _CreateTicketFailure() when createTicketFailure != null:
return createTicketFailure(_that.error);case _UpdateTicketStatusLoading() when updateTicketStatusLoading != null:
return updateTicketStatusLoading();case _UpdateTicketStatusSuccess() when updateTicketStatusSuccess != null:
return updateTicketStatusSuccess(_that.response);case _UpdateTicketStatusFailure() when updateTicketStatusFailure != null:
return updateTicketStatusFailure(_that.error);case _GetTicketCommentsLoading() when getTicketCommentsLoading != null:
return getTicketCommentsLoading();case _GetTicketCommentsSuccess() when getTicketCommentsSuccess != null:
return getTicketCommentsSuccess(_that.comments);case _GetTicketCommentsFailure() when getTicketCommentsFailure != null:
return getTicketCommentsFailure(_that.error);case _AddCommentLoading() when addCommentLoading != null:
return addCommentLoading();case _AddCommentSuccess() when addCommentSuccess != null:
return addCommentSuccess(_that.response);case _AddCommentFailure() when addCommentFailure != null:
return addCommentFailure(_that.apiErrorModel);case _GetTicketActivitiesLoading() when getTicketActivitiesLoading != null:
return getTicketActivitiesLoading();case _GetTicketActivitiesSuccess() when getTicketActivitiesSuccess != null:
return getTicketActivitiesSuccess(_that.activities);case _GetTicketActivitiesFailure() when getTicketActivitiesFailure != null:
return getTicketActivitiesFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.initial()';
}


}




/// @nodoc


class _GetTicketsLoading implements HomeState {
  const _GetTicketsLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.getTicketsLoading()';
}


}




/// @nodoc


class _GetTicketsSuccess implements HomeState {
  const _GetTicketsSuccess(this.tickets);
  

 final  TicketsPaginationResponseModel tickets;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketsSuccessCopyWith<_GetTicketsSuccess> get copyWith => __$GetTicketsSuccessCopyWithImpl<_GetTicketsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketsSuccess&&(identical(other.tickets, tickets) || other.tickets == tickets));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tickets);
}

@override
String toString() {
    return 'HomeState.getTicketsSuccess(tickets: $tickets)';
}


}

/// @nodoc
abstract mixin class _$GetTicketsSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketsSuccessCopyWith(_GetTicketsSuccess value, $Res Function(_GetTicketsSuccess) _then) = __$GetTicketsSuccessCopyWithImpl;
@useResult
$Res call({
 TicketsPaginationResponseModel tickets
});




}
/// @nodoc
class __$GetTicketsSuccessCopyWithImpl<$Res>
    implements _$GetTicketsSuccessCopyWith<$Res> {
  __$GetTicketsSuccessCopyWithImpl(this._self, this._then);

  final _GetTicketsSuccess _self;
  final $Res Function(_GetTicketsSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tickets = null,}) {
  return _then(_GetTicketsSuccess(
null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as TicketsPaginationResponseModel,
  ));
}


}

/// @nodoc


class _GetTicketsFailure implements HomeState {
  const _GetTicketsFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketsFailureCopyWith<_GetTicketsFailure> get copyWith => __$GetTicketsFailureCopyWithImpl<_GetTicketsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketsFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'HomeState.getTicketsFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetTicketsFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketsFailureCopyWith(_GetTicketsFailure value, $Res Function(_GetTicketsFailure) _then) = __$GetTicketsFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$GetTicketsFailureCopyWithImpl<$Res>
    implements _$GetTicketsFailureCopyWith<$Res> {
  __$GetTicketsFailureCopyWithImpl(this._self, this._then);

  final _GetTicketsFailure _self;
  final $Res Function(_GetTicketsFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetTicketsFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _GetTicketByIdLoading implements HomeState {
  const _GetTicketByIdLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketByIdLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.getTicketByIdLoading()';
}


}




/// @nodoc


class _GetTicketByIdSuccess implements HomeState {
  const _GetTicketByIdSuccess(this.ticket);
  

 final  TicketResponseModel ticket;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketByIdSuccessCopyWith<_GetTicketByIdSuccess> get copyWith => __$GetTicketByIdSuccessCopyWithImpl<_GetTicketByIdSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketByIdSuccess&&(identical(other.ticket, ticket) || other.ticket == ticket));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ticket);
}

@override
String toString() {
    return 'HomeState.getTicketByIdSuccess(ticket: $ticket)';
}


}

/// @nodoc
abstract mixin class _$GetTicketByIdSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketByIdSuccessCopyWith(_GetTicketByIdSuccess value, $Res Function(_GetTicketByIdSuccess) _then) = __$GetTicketByIdSuccessCopyWithImpl;
@useResult
$Res call({
 TicketResponseModel ticket
});




}
/// @nodoc
class __$GetTicketByIdSuccessCopyWithImpl<$Res>
    implements _$GetTicketByIdSuccessCopyWith<$Res> {
  __$GetTicketByIdSuccessCopyWithImpl(this._self, this._then);

  final _GetTicketByIdSuccess _self;
  final $Res Function(_GetTicketByIdSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticket = null,}) {
  return _then(_GetTicketByIdSuccess(
null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as TicketResponseModel,
  ));
}


}

/// @nodoc


class _GetTicketByIdFailure implements HomeState {
  const _GetTicketByIdFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketByIdFailureCopyWith<_GetTicketByIdFailure> get copyWith => __$GetTicketByIdFailureCopyWithImpl<_GetTicketByIdFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketByIdFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'HomeState.getTicketByIdFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetTicketByIdFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketByIdFailureCopyWith(_GetTicketByIdFailure value, $Res Function(_GetTicketByIdFailure) _then) = __$GetTicketByIdFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$GetTicketByIdFailureCopyWithImpl<$Res>
    implements _$GetTicketByIdFailureCopyWith<$Res> {
  __$GetTicketByIdFailureCopyWithImpl(this._self, this._then);

  final _GetTicketByIdFailure _self;
  final $Res Function(_GetTicketByIdFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetTicketByIdFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _CreateTicketLoading implements HomeState {
  const _CreateTicketLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTicketLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.createTicketLoading()';
}


}




/// @nodoc


class _CreateTicketSuccess implements HomeState {
  const _CreateTicketSuccess(this.ticket);
  

 final  TicketResponseModel ticket;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTicketSuccessCopyWith<_CreateTicketSuccess> get copyWith => __$CreateTicketSuccessCopyWithImpl<_CreateTicketSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTicketSuccess&&(identical(other.ticket, ticket) || other.ticket == ticket));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ticket);
}

@override
String toString() {
    return 'HomeState.createTicketSuccess(ticket: $ticket)';
}


}

/// @nodoc
abstract mixin class _$CreateTicketSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$CreateTicketSuccessCopyWith(_CreateTicketSuccess value, $Res Function(_CreateTicketSuccess) _then) = __$CreateTicketSuccessCopyWithImpl;
@useResult
$Res call({
 TicketResponseModel ticket
});




}
/// @nodoc
class __$CreateTicketSuccessCopyWithImpl<$Res>
    implements _$CreateTicketSuccessCopyWith<$Res> {
  __$CreateTicketSuccessCopyWithImpl(this._self, this._then);

  final _CreateTicketSuccess _self;
  final $Res Function(_CreateTicketSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticket = null,}) {
  return _then(_CreateTicketSuccess(
null == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as TicketResponseModel,
  ));
}


}

/// @nodoc


class _CreateTicketFailure implements HomeState {
  const _CreateTicketFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTicketFailureCopyWith<_CreateTicketFailure> get copyWith => __$CreateTicketFailureCopyWithImpl<_CreateTicketFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTicketFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'HomeState.createTicketFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$CreateTicketFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$CreateTicketFailureCopyWith(_CreateTicketFailure value, $Res Function(_CreateTicketFailure) _then) = __$CreateTicketFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$CreateTicketFailureCopyWithImpl<$Res>
    implements _$CreateTicketFailureCopyWith<$Res> {
  __$CreateTicketFailureCopyWithImpl(this._self, this._then);

  final _CreateTicketFailure _self;
  final $Res Function(_CreateTicketFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_CreateTicketFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _UpdateTicketStatusLoading implements HomeState {
  const _UpdateTicketStatusLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTicketStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.updateTicketStatusLoading()';
}


}




/// @nodoc


class _UpdateTicketStatusSuccess implements HomeState {
  const _UpdateTicketStatusSuccess(this.response);
  

 final  ApiResponseModel response;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTicketStatusSuccessCopyWith<_UpdateTicketStatusSuccess> get copyWith => __$UpdateTicketStatusSuccessCopyWithImpl<_UpdateTicketStatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTicketStatusSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode {
    return Object.hash(runtimeType,response);
}

@override
String toString() {
    return 'HomeState.updateTicketStatusSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$UpdateTicketStatusSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$UpdateTicketStatusSuccessCopyWith(_UpdateTicketStatusSuccess value, $Res Function(_UpdateTicketStatusSuccess) _then) = __$UpdateTicketStatusSuccessCopyWithImpl;
@useResult
$Res call({
 ApiResponseModel response
});




}
/// @nodoc
class __$UpdateTicketStatusSuccessCopyWithImpl<$Res>
    implements _$UpdateTicketStatusSuccessCopyWith<$Res> {
  __$UpdateTicketStatusSuccessCopyWithImpl(this._self, this._then);

  final _UpdateTicketStatusSuccess _self;
  final $Res Function(_UpdateTicketStatusSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_UpdateTicketStatusSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ApiResponseModel,
  ));
}


}

/// @nodoc


class _UpdateTicketStatusFailure implements HomeState {
  const _UpdateTicketStatusFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTicketStatusFailureCopyWith<_UpdateTicketStatusFailure> get copyWith => __$UpdateTicketStatusFailureCopyWithImpl<_UpdateTicketStatusFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTicketStatusFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'HomeState.updateTicketStatusFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$UpdateTicketStatusFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$UpdateTicketStatusFailureCopyWith(_UpdateTicketStatusFailure value, $Res Function(_UpdateTicketStatusFailure) _then) = __$UpdateTicketStatusFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$UpdateTicketStatusFailureCopyWithImpl<$Res>
    implements _$UpdateTicketStatusFailureCopyWith<$Res> {
  __$UpdateTicketStatusFailureCopyWithImpl(this._self, this._then);

  final _UpdateTicketStatusFailure _self;
  final $Res Function(_UpdateTicketStatusFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_UpdateTicketStatusFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _GetTicketCommentsLoading implements HomeState {
  const _GetTicketCommentsLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketCommentsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.getTicketCommentsLoading()';
}


}




/// @nodoc


class _GetTicketCommentsSuccess implements HomeState {
  const _GetTicketCommentsSuccess( List<TicketCommentResponseModel> comments): _comments = comments;
  

 final  List<TicketCommentResponseModel> _comments;
 List<TicketCommentResponseModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketCommentsSuccessCopyWith<_GetTicketCommentsSuccess> get copyWith => __$GetTicketCommentsSuccessCopyWithImpl<_GetTicketCommentsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketCommentsSuccess&&const DeepCollectionEquality().equals(other.comments, _comments));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments));
}

@override
String toString() {
    return 'HomeState.getTicketCommentsSuccess(comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$GetTicketCommentsSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketCommentsSuccessCopyWith(_GetTicketCommentsSuccess value, $Res Function(_GetTicketCommentsSuccess) _then) = __$GetTicketCommentsSuccessCopyWithImpl;
@useResult
$Res call({
 List<TicketCommentResponseModel> comments
});




}
/// @nodoc
class __$GetTicketCommentsSuccessCopyWithImpl<$Res>
    implements _$GetTicketCommentsSuccessCopyWith<$Res> {
  __$GetTicketCommentsSuccessCopyWithImpl(this._self, this._then);

  final _GetTicketCommentsSuccess _self;
  final $Res Function(_GetTicketCommentsSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comments = null,}) {
  return _then(_GetTicketCommentsSuccess(
null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<TicketCommentResponseModel>,
  ));
}


}

/// @nodoc


class _GetTicketCommentsFailure implements HomeState {
  const _GetTicketCommentsFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketCommentsFailureCopyWith<_GetTicketCommentsFailure> get copyWith => __$GetTicketCommentsFailureCopyWithImpl<_GetTicketCommentsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketCommentsFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'HomeState.getTicketCommentsFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetTicketCommentsFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketCommentsFailureCopyWith(_GetTicketCommentsFailure value, $Res Function(_GetTicketCommentsFailure) _then) = __$GetTicketCommentsFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$GetTicketCommentsFailureCopyWithImpl<$Res>
    implements _$GetTicketCommentsFailureCopyWith<$Res> {
  __$GetTicketCommentsFailureCopyWithImpl(this._self, this._then);

  final _GetTicketCommentsFailure _self;
  final $Res Function(_GetTicketCommentsFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetTicketCommentsFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _AddCommentLoading implements HomeState {
  const _AddCommentLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCommentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.addCommentLoading()';
}


}




/// @nodoc


class _AddCommentSuccess implements HomeState {
  const _AddCommentSuccess(this.response);
  

 final  ApiResponseModel response;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCommentSuccessCopyWith<_AddCommentSuccess> get copyWith => __$AddCommentSuccessCopyWithImpl<_AddCommentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCommentSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode {
    return Object.hash(runtimeType,response);
}

@override
String toString() {
    return 'HomeState.addCommentSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class _$AddCommentSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$AddCommentSuccessCopyWith(_AddCommentSuccess value, $Res Function(_AddCommentSuccess) _then) = __$AddCommentSuccessCopyWithImpl;
@useResult
$Res call({
 ApiResponseModel response
});




}
/// @nodoc
class __$AddCommentSuccessCopyWithImpl<$Res>
    implements _$AddCommentSuccessCopyWith<$Res> {
  __$AddCommentSuccessCopyWithImpl(this._self, this._then);

  final _AddCommentSuccess _self;
  final $Res Function(_AddCommentSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_AddCommentSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ApiResponseModel,
  ));
}


}

/// @nodoc


class _AddCommentFailure implements HomeState {
  const _AddCommentFailure(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCommentFailureCopyWith<_AddCommentFailure> get copyWith => __$AddCommentFailureCopyWithImpl<_AddCommentFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCommentFailure&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode {
    return Object.hash(runtimeType,apiErrorModel);
}

@override
String toString() {
    return 'HomeState.addCommentFailure(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class _$AddCommentFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$AddCommentFailureCopyWith(_AddCommentFailure value, $Res Function(_AddCommentFailure) _then) = __$AddCommentFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class __$AddCommentFailureCopyWithImpl<$Res>
    implements _$AddCommentFailureCopyWith<$Res> {
  __$AddCommentFailureCopyWithImpl(this._self, this._then);

  final _AddCommentFailure _self;
  final $Res Function(_AddCommentFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(_AddCommentFailure(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _GetTicketActivitiesLoading implements HomeState {
  const _GetTicketActivitiesLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketActivitiesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeState.getTicketActivitiesLoading()';
}


}




/// @nodoc


class _GetTicketActivitiesSuccess implements HomeState {
  const _GetTicketActivitiesSuccess( List<TicketActivityResponseModel> activities): _activities = activities;
  

 final  List<TicketActivityResponseModel> _activities;
 List<TicketActivityResponseModel> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketActivitiesSuccessCopyWith<_GetTicketActivitiesSuccess> get copyWith => __$GetTicketActivitiesSuccessCopyWithImpl<_GetTicketActivitiesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketActivitiesSuccess&&const DeepCollectionEquality().equals(other.activities, _activities));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_activities));
}

@override
String toString() {
    return 'HomeState.getTicketActivitiesSuccess(activities: $activities)';
}


}

/// @nodoc
abstract mixin class _$GetTicketActivitiesSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketActivitiesSuccessCopyWith(_GetTicketActivitiesSuccess value, $Res Function(_GetTicketActivitiesSuccess) _then) = __$GetTicketActivitiesSuccessCopyWithImpl;
@useResult
$Res call({
 List<TicketActivityResponseModel> activities
});




}
/// @nodoc
class __$GetTicketActivitiesSuccessCopyWithImpl<$Res>
    implements _$GetTicketActivitiesSuccessCopyWith<$Res> {
  __$GetTicketActivitiesSuccessCopyWithImpl(this._self, this._then);

  final _GetTicketActivitiesSuccess _self;
  final $Res Function(_GetTicketActivitiesSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? activities = null,}) {
  return _then(_GetTicketActivitiesSuccess(
null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<TicketActivityResponseModel>,
  ));
}


}

/// @nodoc


class _GetTicketActivitiesFailure implements HomeState {
  const _GetTicketActivitiesFailure(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTicketActivitiesFailureCopyWith<_GetTicketActivitiesFailure> get copyWith => __$GetTicketActivitiesFailureCopyWithImpl<_GetTicketActivitiesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTicketActivitiesFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'HomeState.getTicketActivitiesFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetTicketActivitiesFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$GetTicketActivitiesFailureCopyWith(_GetTicketActivitiesFailure value, $Res Function(_GetTicketActivitiesFailure) _then) = __$GetTicketActivitiesFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class __$GetTicketActivitiesFailureCopyWithImpl<$Res>
    implements _$GetTicketActivitiesFailureCopyWith<$Res> {
  __$GetTicketActivitiesFailureCopyWithImpl(this._self, this._then);

  final _GetTicketActivitiesFailure _self;
  final $Res Function(_GetTicketActivitiesFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetTicketActivitiesFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
