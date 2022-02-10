// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  UserStateLoaded call(
      {required Map<int, User> users, required Set<int> expandedIds}) {
    return UserStateLoaded(
      users: users,
      expandedIds: expandedIds,
    );
  }

  UserStateLoading loading(
      {required Map<int, User> users, required Set<int> expandedIds}) {
    return UserStateLoading(
      users: users,
      expandedIds: expandedIds,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  Map<int, User> get users => throw _privateConstructorUsedError;
  Set<int> get expandedIds => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds) $default, {
    required TResult Function(Map<int, User> users, Set<int> expandedIds)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds)? $default, {
    TResult Function(Map<int, User> users, Set<int> expandedIds)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds)? $default, {
    TResult Function(Map<int, User> users, Set<int> expandedIds)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UserStateLoaded value) $default, {
    required TResult Function(UserStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(UserStateLoaded value)? $default, {
    TResult Function(UserStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UserStateLoaded value)? $default, {
    TResult Function(UserStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call({Map<int, User> users, Set<int> expandedIds});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? users = freezed,
    Object? expandedIds = freezed,
  }) {
    return _then(_value.copyWith(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<int, User>,
      expandedIds: expandedIds == freezed
          ? _value.expandedIds
          : expandedIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc
abstract class $UserStateLoadedCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory $UserStateLoadedCopyWith(
          UserStateLoaded value, $Res Function(UserStateLoaded) then) =
      _$UserStateLoadedCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, User> users, Set<int> expandedIds});
}

/// @nodoc
class _$UserStateLoadedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadedCopyWith<$Res> {
  _$UserStateLoadedCopyWithImpl(
      UserStateLoaded _value, $Res Function(UserStateLoaded) _then)
      : super(_value, (v) => _then(v as UserStateLoaded));

  @override
  UserStateLoaded get _value => super._value as UserStateLoaded;

  @override
  $Res call({
    Object? users = freezed,
    Object? expandedIds = freezed,
  }) {
    return _then(UserStateLoaded(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<int, User>,
      expandedIds: expandedIds == freezed
          ? _value.expandedIds
          : expandedIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$UserStateLoaded implements UserStateLoaded {
  _$UserStateLoaded({required this.users, required this.expandedIds});

  @override
  final Map<int, User> users;
  @override
  final Set<int> expandedIds;

  @override
  String toString() {
    return 'UserState(users: $users, expandedIds: $expandedIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoaded &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality()
                .equals(other.expandedIds, expandedIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(expandedIds));

  @JsonKey(ignore: true)
  @override
  $UserStateLoadedCopyWith<UserStateLoaded> get copyWith =>
      _$UserStateLoadedCopyWithImpl<UserStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds) $default, {
    required TResult Function(Map<int, User> users, Set<int> expandedIds)
        loading,
  }) {
    return $default(users, expandedIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds)? $default, {
    TResult Function(Map<int, User> users, Set<int> expandedIds)? loading,
  }) {
    return $default?.call(users, expandedIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds)? $default, {
    TResult Function(Map<int, User> users, Set<int> expandedIds)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(users, expandedIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UserStateLoaded value) $default, {
    required TResult Function(UserStateLoading value) loading,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(UserStateLoaded value)? $default, {
    TResult Function(UserStateLoading value)? loading,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UserStateLoaded value)? $default, {
    TResult Function(UserStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class UserStateLoaded implements UserState {
  factory UserStateLoaded(
      {required Map<int, User> users,
      required Set<int> expandedIds}) = _$UserStateLoaded;

  @override
  Map<int, User> get users;
  @override
  Set<int> get expandedIds;
  @override
  @JsonKey(ignore: true)
  $UserStateLoadedCopyWith<UserStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateLoadingCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory $UserStateLoadingCopyWith(
          UserStateLoading value, $Res Function(UserStateLoading) then) =
      _$UserStateLoadingCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, User> users, Set<int> expandedIds});
}

/// @nodoc
class _$UserStateLoadingCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadingCopyWith<$Res> {
  _$UserStateLoadingCopyWithImpl(
      UserStateLoading _value, $Res Function(UserStateLoading) _then)
      : super(_value, (v) => _then(v as UserStateLoading));

  @override
  UserStateLoading get _value => super._value as UserStateLoading;

  @override
  $Res call({
    Object? users = freezed,
    Object? expandedIds = freezed,
  }) {
    return _then(UserStateLoading(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<int, User>,
      expandedIds: expandedIds == freezed
          ? _value.expandedIds
          : expandedIds // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$UserStateLoading implements UserStateLoading {
  _$UserStateLoading({required this.users, required this.expandedIds});

  @override
  final Map<int, User> users;
  @override
  final Set<int> expandedIds;

  @override
  String toString() {
    return 'UserState.loading(users: $users, expandedIds: $expandedIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoading &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality()
                .equals(other.expandedIds, expandedIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(expandedIds));

  @JsonKey(ignore: true)
  @override
  $UserStateLoadingCopyWith<UserStateLoading> get copyWith =>
      _$UserStateLoadingCopyWithImpl<UserStateLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds) $default, {
    required TResult Function(Map<int, User> users, Set<int> expandedIds)
        loading,
  }) {
    return loading(users, expandedIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds)? $default, {
    TResult Function(Map<int, User> users, Set<int> expandedIds)? loading,
  }) {
    return loading?.call(users, expandedIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<int, User> users, Set<int> expandedIds)? $default, {
    TResult Function(Map<int, User> users, Set<int> expandedIds)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(users, expandedIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UserStateLoaded value) $default, {
    required TResult Function(UserStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(UserStateLoaded value)? $default, {
    TResult Function(UserStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UserStateLoaded value)? $default, {
    TResult Function(UserStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserStateLoading implements UserState {
  factory UserStateLoading(
      {required Map<int, User> users,
      required Set<int> expandedIds}) = _$UserStateLoading;

  @override
  Map<int, User> get users;
  @override
  Set<int> get expandedIds;
  @override
  @JsonKey(ignore: true)
  $UserStateLoadingCopyWith<UserStateLoading> get copyWith =>
      throw _privateConstructorUsedError;
}
