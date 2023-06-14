// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MediaDetailState {
  Media? get media => throw _privateConstructorUsedError;
  List<Evaluation?> get reactions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaDetailStateCopyWith<MediaDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaDetailStateCopyWith<$Res> {
  factory $MediaDetailStateCopyWith(
          MediaDetailState value, $Res Function(MediaDetailState) then) =
      _$MediaDetailStateCopyWithImpl<$Res, MediaDetailState>;
  @useResult
  $Res call({Media? media, List<Evaluation?> reactions});
}

/// @nodoc
class _$MediaDetailStateCopyWithImpl<$Res, $Val extends MediaDetailState>
    implements $MediaDetailStateCopyWith<$Res> {
  _$MediaDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = freezed,
    Object? reactions = null,
  }) {
    return _then(_value.copyWith(
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Evaluation?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaDetailStateCopyWith<$Res>
    implements $MediaDetailStateCopyWith<$Res> {
  factory _$$_MediaDetailStateCopyWith(
          _$_MediaDetailState value, $Res Function(_$_MediaDetailState) then) =
      __$$_MediaDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Media? media, List<Evaluation?> reactions});
}

/// @nodoc
class __$$_MediaDetailStateCopyWithImpl<$Res>
    extends _$MediaDetailStateCopyWithImpl<$Res, _$_MediaDetailState>
    implements _$$_MediaDetailStateCopyWith<$Res> {
  __$$_MediaDetailStateCopyWithImpl(
      _$_MediaDetailState _value, $Res Function(_$_MediaDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = freezed,
    Object? reactions = null,
  }) {
    return _then(_$_MediaDetailState(
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media?,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<Evaluation?>,
    ));
  }
}

/// @nodoc

class _$_MediaDetailState implements _MediaDetailState {
  const _$_MediaDetailState(
      {required this.media, required final List<Evaluation?> reactions})
      : _reactions = reactions;

  @override
  final Media? media;
  final List<Evaluation?> _reactions;
  @override
  List<Evaluation?> get reactions {
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reactions);
  }

  @override
  String toString() {
    return 'MediaDetailState(media: $media, reactions: $reactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaDetailState &&
            (identical(other.media, media) || other.media == media) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, media, const DeepCollectionEquality().hash(_reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaDetailStateCopyWith<_$_MediaDetailState> get copyWith =>
      __$$_MediaDetailStateCopyWithImpl<_$_MediaDetailState>(this, _$identity);
}

abstract class _MediaDetailState implements MediaDetailState {
  const factory _MediaDetailState(
      {required final Media? media,
      required final List<Evaluation?> reactions}) = _$_MediaDetailState;

  @override
  Media? get media;
  @override
  List<Evaluation?> get reactions;
  @override
  @JsonKey(ignore: true)
  _$$_MediaDetailStateCopyWith<_$_MediaDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
