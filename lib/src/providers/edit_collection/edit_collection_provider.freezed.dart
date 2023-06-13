// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_collection_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditCollectionState {
  Collection get initialCollection => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get privacyStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCollectionStateCopyWith<EditCollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCollectionStateCopyWith<$Res> {
  factory $EditCollectionStateCopyWith(
          EditCollectionState value, $Res Function(EditCollectionState) then) =
      _$EditCollectionStateCopyWithImpl<$Res, EditCollectionState>;
  @useResult
  $Res call(
      {Collection initialCollection,
      String title,
      String? image,
      String? description,
      bool privacyStatus});
}

/// @nodoc
class _$EditCollectionStateCopyWithImpl<$Res, $Val extends EditCollectionState>
    implements $EditCollectionStateCopyWith<$Res> {
  _$EditCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialCollection = null,
    Object? title = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? privacyStatus = null,
  }) {
    return _then(_value.copyWith(
      initialCollection: null == initialCollection
          ? _value.initialCollection
          : initialCollection // ignore: cast_nullable_to_non_nullable
              as Collection,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyStatus: null == privacyStatus
          ? _value.privacyStatus
          : privacyStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditCollectionStateCopyWith<$Res>
    implements $EditCollectionStateCopyWith<$Res> {
  factory _$$_EditCollectionStateCopyWith(_$_EditCollectionState value,
          $Res Function(_$_EditCollectionState) then) =
      __$$_EditCollectionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Collection initialCollection,
      String title,
      String? image,
      String? description,
      bool privacyStatus});
}

/// @nodoc
class __$$_EditCollectionStateCopyWithImpl<$Res>
    extends _$EditCollectionStateCopyWithImpl<$Res, _$_EditCollectionState>
    implements _$$_EditCollectionStateCopyWith<$Res> {
  __$$_EditCollectionStateCopyWithImpl(_$_EditCollectionState _value,
      $Res Function(_$_EditCollectionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialCollection = null,
    Object? title = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? privacyStatus = null,
  }) {
    return _then(_$_EditCollectionState(
      initialCollection: null == initialCollection
          ? _value.initialCollection
          : initialCollection // ignore: cast_nullable_to_non_nullable
              as Collection,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      privacyStatus: null == privacyStatus
          ? _value.privacyStatus
          : privacyStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditCollectionState extends _EditCollectionState {
  const _$_EditCollectionState(
      {required this.initialCollection,
      required this.title,
      required this.image,
      required this.description,
      required this.privacyStatus})
      : super._();

  @override
  final Collection initialCollection;
  @override
  final String title;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final bool privacyStatus;

  @override
  String toString() {
    return 'EditCollectionState(initialCollection: $initialCollection, title: $title, image: $image, description: $description, privacyStatus: $privacyStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditCollectionState &&
            (identical(other.initialCollection, initialCollection) ||
                other.initialCollection == initialCollection) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.privacyStatus, privacyStatus) ||
                other.privacyStatus == privacyStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, initialCollection, title, image, description, privacyStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditCollectionStateCopyWith<_$_EditCollectionState> get copyWith =>
      __$$_EditCollectionStateCopyWithImpl<_$_EditCollectionState>(
          this, _$identity);
}

abstract class _EditCollectionState extends EditCollectionState {
  const factory _EditCollectionState(
      {required final Collection initialCollection,
      required final String title,
      required final String? image,
      required final String? description,
      required final bool privacyStatus}) = _$_EditCollectionState;
  const _EditCollectionState._() : super._();

  @override
  Collection get initialCollection;
  @override
  String get title;
  @override
  String? get image;
  @override
  String? get description;
  @override
  bool get privacyStatus;
  @override
  @JsonKey(ignore: true)
  _$$_EditCollectionStateCopyWith<_$_EditCollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
