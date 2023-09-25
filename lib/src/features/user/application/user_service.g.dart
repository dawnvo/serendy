// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchMeHash() => r'1fa90b4320c64f2b7cb2bb079a8c7344a69684c7';

/// 내 정보를 불러와요.
///
/// Copied from [fetchMe].
@ProviderFor(fetchMe)
final fetchMeProvider = FutureProvider<User>.internal(
  fetchMe,
  name: r'fetchMeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchMeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMeRef = FutureProviderRef<User>;
String _$fetchUserHash() => r'24acfc3ae6a4c719c4c3e62e79a3c931f8b8fb16';

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

/// 사용자 정보를 불러와요.
///
/// Copied from [fetchUser].
@ProviderFor(fetchUser)
const fetchUserProvider = FetchUserFamily();

/// 사용자 정보를 불러와요.
///
/// Copied from [fetchUser].
class FetchUserFamily extends Family<AsyncValue<User>> {
  /// 사용자 정보를 불러와요.
  ///
  /// Copied from [fetchUser].
  const FetchUserFamily();

  /// 사용자 정보를 불러와요.
  ///
  /// Copied from [fetchUser].
  FetchUserProvider call({
    required String id,
  }) {
    return FetchUserProvider(
      id: id,
    );
  }

  @override
  FetchUserProvider getProviderOverride(
    covariant FetchUserProvider provider,
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
  String? get name => r'fetchUserProvider';
}

/// 사용자 정보를 불러와요.
///
/// Copied from [fetchUser].
class FetchUserProvider extends AutoDisposeFutureProvider<User> {
  /// 사용자 정보를 불러와요.
  ///
  /// Copied from [fetchUser].
  FetchUserProvider({
    required String id,
  }) : this._internal(
          (ref) => fetchUser(
            ref as FetchUserRef,
            id: id,
          ),
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserHash,
          dependencies: FetchUserFamily._dependencies,
          allTransitiveDependencies: FetchUserFamily._allTransitiveDependencies,
          id: id,
        );

  FetchUserProvider._internal(
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
    FutureOr<User> Function(FetchUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserProvider._internal(
        (ref) => create(ref as FetchUserRef),
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
    return _FetchUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchUserProviderElement extends AutoDisposeFutureProviderElement<User>
    with FetchUserRef {
  _FetchUserProviderElement(super.provider);

  @override
  String get id => (origin as FetchUserProvider).id;
}

String _$createUserHash() => r'37aeba42ee09d742f685b3ec27983a7e6c03325f';

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
    required String username,
    required String email,
    String? avatar,
  }) {
    return CreateUserProvider(
      uid: uid,
      username: username,
      email: email,
      avatar: avatar,
    );
  }

  @override
  CreateUserProvider getProviderOverride(
    covariant CreateUserProvider provider,
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
    required String username,
    required String email,
    String? avatar,
  }) : this._internal(
          (ref) => createUser(
            ref as CreateUserRef,
            uid: uid,
            username: username,
            email: email,
            avatar: avatar,
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
          username: username,
          email: email,
          avatar: avatar,
        );

  CreateUserProvider._internal(
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
        username: username,
        email: email,
        avatar: avatar,
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

mixin CreateUserRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `avatar` of this provider.
  String? get avatar;
}

class _CreateUserProviderElement extends AutoDisposeFutureProviderElement<User>
    with CreateUserRef {
  _CreateUserProviderElement(super.provider);

  @override
  String get uid => (origin as CreateUserProvider).uid;
  @override
  String get username => (origin as CreateUserProvider).username;
  @override
  String get email => (origin as CreateUserProvider).email;
  @override
  String? get avatar => (origin as CreateUserProvider).avatar;
}

String _$editProfileHash() => r'3a09b0f5c1ce6740855553de60d69dcfcc8e216a';

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
class EditProfileProvider extends AutoDisposeFutureProvider<User> {
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
        avatar: avatar,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
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

mixin EditProfileRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `username` of this provider.
  String? get username;

  /// The parameter `avatar` of this provider.
  String? get avatar;
}

class _EditProfileProviderElement extends AutoDisposeFutureProviderElement<User>
    with EditProfileRef {
  _EditProfileProviderElement(super.provider);

  @override
  String? get username => (origin as EditProfileProvider).username;
  @override
  String? get avatar => (origin as EditProfileProvider).avatar;
}

String _$removeUserHash() => r'a944e951f63493b5db323195328875095f7a177d';

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
