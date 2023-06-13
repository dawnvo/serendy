// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_reaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MediaReactionState {
  Evaluation? get reaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaReactionStateCopyWith<MediaReactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaReactionStateCopyWith<$Res> {
  factory $MediaReactionStateCopyWith(
          MediaReactionState value, $Res Function(MediaReactionState) then) =
      _$MediaReactionStateCopyWithImpl<$Res, MediaReactionState>;
  @useResult
  $Res call({Evaluation? reaction});
}

/// @nodoc
class _$MediaReactionStateCopyWithImpl<$Res, $Val extends MediaReactionState>
    implements $MediaReactionStateCopyWith<$Res> {
  _$MediaReactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reaction = freezed,
  }) {
    return _then(_value.copyWith(
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as Evaluation?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaReactionStateCopyWith<$Res>
    implements $MediaReactionStateCopyWith<$Res> {
  factory _$$_MediaReactionStateCopyWith(_$_MediaReactionState value,
          $Res Function(_$_MediaReactionState) then) =
      __$$_MediaReactionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Evaluation? reaction});
}

/// @nodoc
class __$$_MediaReactionStateCopyWithImpl<$Res>
    extends _$MediaReactionStateCopyWithImpl<$Res, _$_MediaReactionState>
    implements _$$_MediaReactionStateCopyWith<$Res> {
  __$$_MediaReactionStateCopyWithImpl(
      _$_MediaReactionState _value, $Res Function(_$_MediaReactionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reaction = freezed,
  }) {
    return _then(_$_MediaReactionState(
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as Evaluation?,
    ));
  }
}

/// @nodoc

class _$_MediaReactionState implements _MediaReactionState {
  const _$_MediaReactionState({required this.reaction});

  @override
  final Evaluation? reaction;

  @override
  String toString() {
    return 'MediaReactionState(reaction: $reaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaReactionState &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaReactionStateCopyWith<_$_MediaReactionState> get copyWith =>
      __$$_MediaReactionStateCopyWithImpl<_$_MediaReactionState>(
          this, _$identity);
}

abstract class _MediaReactionState implements MediaReactionState {
  const factory _MediaReactionState({required final Evaluation? reaction}) =
      _$_MediaReactionState;

  @override
  Evaluation? get reaction;
  @override
  @JsonKey(ignore: true)
  _$$_MediaReactionStateCopyWith<_$_MediaReactionState> get copyWith =>
      throw _privateConstructorUsedError;
}
