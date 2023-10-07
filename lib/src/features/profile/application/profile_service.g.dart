// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMeHash() => r'1151859edef618d6aea7d8c54045d2f038eba2f9';

/// 나의 프로필을 불러와요.
///
/// Copied from [getMe].
@ProviderFor(getMe)
final getMeProvider = FutureProvider<Profile>.internal(
  getMe,
  name: r'getMeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMeRef = FutureProviderRef<Profile>;
String _$getProfileHash() => r'287213ad4dcadf79de2869d6cbe26b03448c028b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 프로필을 불러와요.
///
/// Copied from [getProfile].
@ProviderFor(getProfile)
const getProfileProvider = GetProfileFamily();

/// 프로필을 불러와요.
///
/// Copied from [getProfile].
class GetProfileFamily extends Family<AsyncValue<Profile>> {
  /// 프로필을 불러와요.
  ///
  /// Copied from [getProfile].
  const GetProfileFamily();

  /// 프로필을 불러와요.
  ///
  /// Copied from [getProfile].
  GetProfileProvider call({
    required String id,
  }) {
    return GetProfileProvider(
      id: id,
    );
  }

  @override
  GetProfileProvider getProviderOverride(
    covariant GetProfileProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProfileProvider';
}

/// 프로필을 불러와요.
///
/// Copied from [getProfile].
class GetProfileProvider extends AutoDisposeFutureProvider<Profile> {
  /// 프로필을 불러와요.
  ///
  /// Copied from [getProfile].
  GetProfileProvider({
    required String id,
  }) : this._internal(
          (ref) => getProfile(
            ref as GetProfileRef,
            id: id,
          ),
          from: getProfileProvider,
          name: r'getProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProfileHash,
          dependencies: GetProfileFamily._dependencies,
          allTransitiveDependencies:
              GetProfileFamily._allTransitiveDependencies,
          id: id,
        );

  GetProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Profile> Function(GetProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProfileProvider._internal(
        (ref) => create(ref as GetProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Profile> createElement() {
    return _GetProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProfileProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProfileRef on AutoDisposeFutureProviderRef<Profile> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetProfileProviderElement
    extends AutoDisposeFutureProviderElement<Profile> with GetProfileRef {
  _GetProfileProviderElement(super.provider);

  @override
  String get id => (origin as GetProfileProvider).id;
}

String _$createProfileHash() => r'3453a3e6f54552afdf8bfa0dd1dd126afd14cbf0';

/// 프로필을 만들어요.
///
/// Copied from [createProfile].
@ProviderFor(createProfile)
const createProfileProvider = CreateProfileFamily();

/// 프로필을 만들어요.
///
/// Copied from [createProfile].
class CreateProfileFamily extends Family<AsyncValue<Profile>> {
  /// 프로필을 만들어요.
  ///
  /// Copied from [createProfile].
  const CreateProfileFamily();

  /// 프로필을 만들어요.
  ///
  /// Copied from [createProfile].
  CreateProfileProvider call({
    required String uid,
    required String username,
    required String email,
    String? avatar,
  }) {
    return CreateProfileProvider(
      uid: uid,
      username: username,
      email: email,
      avatar: avatar,
    );
  }

  @override
  CreateProfileProvider getProviderOverride(
    covariant CreateProfileProvider provider,
  ) {
    return call(
      uid: provider.uid,
      username: provider.username,
      email: provider.email,
      avatar: provider.avatar,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'createProfileProvider';
}

/// 프로필을 만들어요.
///
/// Copied from [createProfile].
class CreateProfileProvider extends AutoDisposeFutureProvider<Profile> {
  /// 프로필을 만들어요.
  ///
  /// Copied from [createProfile].
  CreateProfileProvider({
    required String uid,
    required String username,
    required String email,
    String? avatar,
  }) : this._internal(
          (ref) => createProfile(
            ref as CreateProfileRef,
            uid: uid,
            username: username,
            email: email,
            avatar: avatar,
          ),
          from: createProfileProvider,
          name: r'createProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createProfileHash,
          dependencies: CreateProfileFamily._dependencies,
          allTransitiveDependencies:
              CreateProfileFamily._allTransitiveDependencies,
          uid: uid,
          username: username,
          email: email,
          avatar: avatar,
        );

  CreateProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
    required this.username,
    required this.email,
    required this.avatar,
  }) : super.internal();

  final String uid;
  final String username;
  final String email;
  final String? avatar;

  @override
  Override overrideWith(
    FutureOr<Profile> Function(CreateProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateProfileProvider._internal(
        (ref) => create(ref as CreateProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
        username: username,
        email: email,
        avatar: avatar,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Profile> createElement() {
    return _CreateProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateProfileProvider &&
        other.uid == uid &&
        other.username == username &&
        other.email == email &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, avatar.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateProfileRef on AutoDisposeFutureProviderRef<Profile> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `avatar` of this provider.
  String? get avatar;
}

class _CreateProfileProviderElement
    extends AutoDisposeFutureProviderElement<Profile> with CreateProfileRef {
  _CreateProfileProviderElement(super.provider);

  @override
  String get uid => (origin as CreateProfileProvider).uid;
  @override
  String get username => (origin as CreateProfileProvider).username;
  @override
  String get email => (origin as CreateProfileProvider).email;
  @override
  String? get avatar => (origin as CreateProfileProvider).avatar;
}

String _$editProfileHash() => r'cbfa7704fe13210168b57746f56bbd8254040590';

/// 프로필을 수정해요.
///
/// Copied from [editProfile].
@ProviderFor(editProfile)
const editProfileProvider = EditProfileFamily();

/// 프로필을 수정해요.
///
/// Copied from [editProfile].
class EditProfileFamily extends Family<AsyncValue<Profile>> {
  /// 프로필을 수정해요.
  ///
  /// Copied from [editProfile].
  const EditProfileFamily();

  /// 프로필을 수정해요.
  ///
  /// Copied from [editProfile].
  EditProfileProvider call({
    String? username,
    String? avatar,
  }) {
    return EditProfileProvider(
      username: username,
      avatar: avatar,
    );
  }

  @override
  EditProfileProvider getProviderOverride(
    covariant EditProfileProvider provider,
  ) {
    return call(
      username: provider.username,
      avatar: provider.avatar,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editProfileProvider';
}

/// 프로필을 수정해요.
///
/// Copied from [editProfile].
class EditProfileProvider extends AutoDisposeFutureProvider<Profile> {
  /// 프로필을 수정해요.
  ///
  /// Copied from [editProfile].
  EditProfileProvider({
    String? username,
    String? avatar,
  }) : this._internal(
          (ref) => editProfile(
            ref as EditProfileRef,
            username: username,
            avatar: avatar,
          ),
          from: editProfileProvider,
          name: r'editProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editProfileHash,
          dependencies: EditProfileFamily._dependencies,
          allTransitiveDependencies:
              EditProfileFamily._allTransitiveDependencies,
          username: username,
          avatar: avatar,
        );

  EditProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.avatar,
  }) : super.internal();

  final String? username;
  final String? avatar;

  @override
  Override overrideWith(
    FutureOr<Profile> Function(EditProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EditProfileProvider._internal(
        (ref) => create(ref as EditProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        avatar: avatar,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Profile> createElement() {
    return _EditProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditProfileProvider &&
        other.username == username &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, avatar.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditProfileRef on AutoDisposeFutureProviderRef<Profile> {
  /// The parameter `username` of this provider.
  String? get username;

  /// The parameter `avatar` of this provider.
  String? get avatar;
}

class _EditProfileProviderElement
    extends AutoDisposeFutureProviderElement<Profile> with EditProfileRef {
  _EditProfileProviderElement(super.provider);

  @override
  String? get username => (origin as EditProfileProvider).username;
  @override
  String? get avatar => (origin as EditProfileProvider).avatar;
}

String _$removeProfileHash() => r'8ee8d77c988351366c675c180ffbaa915b206051';

/// 프로필을 제거해요.
///
/// Copied from [removeProfile].
@ProviderFor(removeProfile)
const removeProfileProvider = RemoveProfileFamily();

/// 프로필을 제거해요.
///
/// Copied from [removeProfile].
class RemoveProfileFamily extends Family<AsyncValue<void>> {
  /// 프로필을 제거해요.
  ///
  /// Copied from [removeProfile].
  const RemoveProfileFamily();

  /// 프로필을 제거해요.
  ///
  /// Copied from [removeProfile].
  RemoveProfileProvider call({
    required String id,
    String? reason,
  }) {
    return RemoveProfileProvider(
      id: id,
      reason: reason,
    );
  }

  @override
  RemoveProfileProvider getProviderOverride(
    covariant RemoveProfileProvider provider,
  ) {
    return call(
      id: provider.id,
      reason: provider.reason,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeProfileProvider';
}

/// 프로필을 제거해요.
///
/// Copied from [removeProfile].
class RemoveProfileProvider extends AutoDisposeFutureProvider<void> {
  /// 프로필을 제거해요.
  ///
  /// Copied from [removeProfile].
  RemoveProfileProvider({
    required String id,
    String? reason,
  }) : this._internal(
          (ref) => removeProfile(
            ref as RemoveProfileRef,
            id: id,
            reason: reason,
          ),
          from: removeProfileProvider,
          name: r'removeProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeProfileHash,
          dependencies: RemoveProfileFamily._dependencies,
          allTransitiveDependencies:
              RemoveProfileFamily._allTransitiveDependencies,
          id: id,
          reason: reason,
        );

  RemoveProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.reason,
  }) : super.internal();

  final String id;
  final String? reason;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveProfileProvider._internal(
        (ref) => create(ref as RemoveProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        reason: reason,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveProfileProvider &&
        other.id == id &&
        other.reason == reason;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, reason.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveProfileRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `reason` of this provider.
  String? get reason;
}

class _RemoveProfileProviderElement
    extends AutoDisposeFutureProviderElement<void> with RemoveProfileRef {
  _RemoveProfileProviderElement(super.provider);

  @override
  String get id => (origin as RemoveProfileProvider).id;
  @override
  String? get reason => (origin as RemoveProfileProvider).reason;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
