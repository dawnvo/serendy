// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMeHash() => r'df1d60e2dd8777095bd3aaff9b468b4d9b663a6b';

/// 나의 사용자를 불러와요.
///
/// Copied from [getMe].
@ProviderFor(getMe)
final getMeProvider = FutureProvider<User>.internal(
  getMe,
  name: r'getMeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMeRef = FutureProviderRef<User>;
String _$getUserHash() => r'872c4db50d395481490f8d4b8ca2da875da0bb59';

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

/// 사용자를 불러와요.
///
/// Copied from [getUser].
@ProviderFor(getUser)
const getUserProvider = GetUserFamily();

/// 사용자를 불러와요.
///
/// Copied from [getUser].
class GetUserFamily extends Family<AsyncValue<User>> {
  /// 사용자를 불러와요.
  ///
  /// Copied from [getUser].
  const GetUserFamily();

  /// 사용자를 불러와요.
  ///
  /// Copied from [getUser].
  GetUserProvider call({
    required String id,
  }) {
    return GetUserProvider(
      id: id,
    );
  }

  @override
  GetUserProvider getProviderOverride(
    covariant GetUserProvider provider,
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
  String? get name => r'getUserProvider';
}

/// 사용자를 불러와요.
///
/// Copied from [getUser].
class GetUserProvider extends AutoDisposeFutureProvider<User> {
  /// 사용자를 불러와요.
  ///
  /// Copied from [getUser].
  GetUserProvider({
    required String id,
  }) : this._internal(
          (ref) => getUser(
            ref as GetUserRef,
            id: id,
          ),
          from: getUserProvider,
          name: r'getUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserHash,
          dependencies: GetUserFamily._dependencies,
          allTransitiveDependencies: GetUserFamily._allTransitiveDependencies,
          id: id,
        );

  GetUserProvider._internal(
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
    FutureOr<User> Function(GetUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserProvider._internal(
        (ref) => create(ref as GetUserRef),
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
  AutoDisposeFutureProviderElement<User> createElement() {
    return _GetUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetUserProviderElement extends AutoDisposeFutureProviderElement<User>
    with GetUserRef {
  _GetUserProviderElement(super.provider);

  @override
  String get id => (origin as GetUserProvider).id;
}

String _$createUserHash() => r'0c4d8c15947df60b6ece890b525bd31a5ba9546f';

/// 사용자를 만들어요.
///
/// Copied from [createUser].
@ProviderFor(createUser)
const createUserProvider = CreateUserFamily();

/// 사용자를 만들어요.
///
/// Copied from [createUser].
class CreateUserFamily extends Family<AsyncValue<User>> {
  /// 사용자를 만들어요.
  ///
  /// Copied from [createUser].
  const CreateUserFamily();

  /// 사용자를 만들어요.
  ///
  /// Copied from [createUser].
  CreateUserProvider call({
    required String uid,
    required String email,
    required String username,
  }) {
    return CreateUserProvider(
      uid: uid,
      email: email,
      username: username,
    );
  }

  @override
  CreateUserProvider getProviderOverride(
    covariant CreateUserProvider provider,
  ) {
    return call(
      uid: provider.uid,
      email: provider.email,
      username: provider.username,
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
  String? get name => r'createUserProvider';
}

/// 사용자를 만들어요.
///
/// Copied from [createUser].
class CreateUserProvider extends AutoDisposeFutureProvider<User> {
  /// 사용자를 만들어요.
  ///
  /// Copied from [createUser].
  CreateUserProvider({
    required String uid,
    required String email,
    required String username,
  }) : this._internal(
          (ref) => createUser(
            ref as CreateUserRef,
            uid: uid,
            email: email,
            username: username,
          ),
          from: createUserProvider,
          name: r'createUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createUserHash,
          dependencies: CreateUserFamily._dependencies,
          allTransitiveDependencies:
              CreateUserFamily._allTransitiveDependencies,
          uid: uid,
          email: email,
          username: username,
        );

  CreateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
    required this.email,
    required this.username,
  }) : super.internal();

  final String uid;
  final String email;
  final String username;

  @override
  Override overrideWith(
    FutureOr<User> Function(CreateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateUserProvider._internal(
        (ref) => create(ref as CreateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
        email: email,
        username: username,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _CreateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateUserProvider &&
        other.uid == uid &&
        other.email == email &&
        other.username == username;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateUserRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `username` of this provider.
  String get username;
}

class _CreateUserProviderElement extends AutoDisposeFutureProviderElement<User>
    with CreateUserRef {
  _CreateUserProviderElement(super.provider);

  @override
  String get uid => (origin as CreateUserProvider).uid;
  @override
  String get email => (origin as CreateUserProvider).email;
  @override
  String get username => (origin as CreateUserProvider).username;
}

String _$editProfileHash() => r'25f72e9a660e2f9836e166190fdcd09665759e5e';

/// 프로필을 수정해요.
///
/// Copied from [editProfile].
@ProviderFor(editProfile)
const editProfileProvider = EditProfileFamily();

/// 프로필을 수정해요.
///
/// Copied from [editProfile].
class EditProfileFamily extends Family<AsyncValue<User>> {
  /// 프로필을 수정해요.
  ///
  /// Copied from [editProfile].
  const EditProfileFamily();

  /// 프로필을 수정해요.
  ///
  /// Copied from [editProfile].
  EditProfileProvider call({
    String? username,
  }) {
    return EditProfileProvider(
      username: username,
    );
  }

  @override
  EditProfileProvider getProviderOverride(
    covariant EditProfileProvider provider,
  ) {
    return call(
      username: provider.username,
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
class EditProfileProvider extends AutoDisposeFutureProvider<User> {
  /// 프로필을 수정해요.
  ///
  /// Copied from [editProfile].
  EditProfileProvider({
    String? username,
  }) : this._internal(
          (ref) => editProfile(
            ref as EditProfileRef,
            username: username,
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
        );

  EditProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
  }) : super.internal();

  final String? username;

  @override
  Override overrideWith(
    FutureOr<User> Function(EditProfileRef provider) create,
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
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _EditProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditProfileProvider && other.username == username;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditProfileRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `username` of this provider.
  String? get username;
}

class _EditProfileProviderElement extends AutoDisposeFutureProviderElement<User>
    with EditProfileRef {
  _EditProfileProviderElement(super.provider);

  @override
  String? get username => (origin as EditProfileProvider).username;
}

String _$removeUserHash() => r'8d1d3ff9ae58d2dff2a564c3d29239d203d23eaf';

/// 사용자를 제거해요.
///
/// Copied from [removeUser].
@ProviderFor(removeUser)
const removeUserProvider = RemoveUserFamily();

/// 사용자를 제거해요.
///
/// Copied from [removeUser].
class RemoveUserFamily extends Family<AsyncValue<void>> {
  /// 사용자를 제거해요.
  ///
  /// Copied from [removeUser].
  const RemoveUserFamily();

  /// 사용자를 제거해요.
  ///
  /// Copied from [removeUser].
  RemoveUserProvider call({
    required String id,
    String? reason,
  }) {
    return RemoveUserProvider(
      id: id,
      reason: reason,
    );
  }

  @override
  RemoveUserProvider getProviderOverride(
    covariant RemoveUserProvider provider,
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
  String? get name => r'removeUserProvider';
}

/// 사용자를 제거해요.
///
/// Copied from [removeUser].
class RemoveUserProvider extends AutoDisposeFutureProvider<void> {
  /// 사용자를 제거해요.
  ///
  /// Copied from [removeUser].
  RemoveUserProvider({
    required String id,
    String? reason,
  }) : this._internal(
          (ref) => removeUser(
            ref as RemoveUserRef,
            id: id,
            reason: reason,
          ),
          from: removeUserProvider,
          name: r'removeUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeUserHash,
          dependencies: RemoveUserFamily._dependencies,
          allTransitiveDependencies:
              RemoveUserFamily._allTransitiveDependencies,
          id: id,
          reason: reason,
        );

  RemoveUserProvider._internal(
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
    FutureOr<void> Function(RemoveUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveUserProvider._internal(
        (ref) => create(ref as RemoveUserRef),
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
    return _RemoveUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveUserProvider &&
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

mixin RemoveUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `reason` of this provider.
  String? get reason;
}

class _RemoveUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with RemoveUserRef {
  _RemoveUserProviderElement(super.provider);

  @override
  String get id => (origin as RemoveUserProvider).id;
  @override
  String? get reason => (origin as RemoveUserProvider).reason;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
