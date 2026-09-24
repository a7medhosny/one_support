// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _NavigateHome value)?  navigateHome,TResult Function( _NavigateLogin value)?  navigateLogin,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NavigateHome() when navigateHome != null:
return navigateHome(_that);case _NavigateLogin() when navigateLogin != null:
return navigateLogin(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _NavigateHome value)  navigateHome,required TResult Function( _NavigateLogin value)  navigateLogin,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _NavigateHome():
return navigateHome(_that);case _NavigateLogin():
return navigateLogin(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _NavigateHome value)?  navigateHome,TResult? Function( _NavigateLogin value)?  navigateLogin,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _NavigateHome() when navigateHome != null:
return navigateHome(_that);case _NavigateLogin() when navigateLogin != null:
return navigateLogin(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String token)?  navigateHome,TResult Function()?  navigateLogin,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NavigateHome() when navigateHome != null:
return navigateHome(_that.token);case _NavigateLogin() when navigateLogin != null:
return navigateLogin();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String token)  navigateHome,required TResult Function()  navigateLogin,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _NavigateHome():
return navigateHome(_that.token);case _NavigateLogin():
return navigateLogin();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String token)?  navigateHome,TResult? Function()?  navigateLogin,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _NavigateHome() when navigateHome != null:
return navigateHome(_that.token);case _NavigateLogin() when navigateLogin != null:
return navigateLogin();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SplashState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SplashState.initial()';
}


}




/// @nodoc


class _NavigateHome implements SplashState {
  const _NavigateHome(this.token);
  

 final  String token;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigateHomeCopyWith<_NavigateHome> get copyWith => __$NavigateHomeCopyWithImpl<_NavigateHome>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateHome&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode {
    return Object.hash(runtimeType,token);
}

@override
String toString() {
    return 'SplashState.navigateHome(token: $token)';
}


}

/// @nodoc
abstract mixin class _$NavigateHomeCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory _$NavigateHomeCopyWith(_NavigateHome value, $Res Function(_NavigateHome) _then) = __$NavigateHomeCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class __$NavigateHomeCopyWithImpl<$Res>
    implements _$NavigateHomeCopyWith<$Res> {
  __$NavigateHomeCopyWithImpl(this._self, this._then);

  final _NavigateHome _self;
  final $Res Function(_NavigateHome) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_NavigateHome(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NavigateLogin implements SplashState {
  const _NavigateLogin();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SplashState.navigateLogin()';
}


}




// dart format on
