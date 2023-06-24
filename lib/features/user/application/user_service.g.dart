// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserHash() => r'e2544c825e48947e3dca6fa1fc2e7aa5910ff199';

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

typedef FetchUserRef = AutoDisposeFutureProviderRef<User>;

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
    required String userId,
  }) {
    return FetchUserProvider(
      userId: userId,
    );
  }

  @override
  FetchUserProvider getProviderOverride(
    covariant FetchUserProvider provider,
  ) {
    return call(
      userId: provider.userId,
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
    required this.userId,
  }) : super.internal(
          (ref) => fetchUser(
            ref,
            userId: userId,
          ),
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserHash,
          dependencies: FetchUserFamily._dependencies,
          allTransitiveDependencies: FetchUserFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$createUserHash() => r'9221840d9751505fe6cb9148f7c8039b46306262';
typedef CreateUserRef = AutoDisposeFutureProviderRef<User>;

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
    required String authId,
    required String name,
    String? email,
    String? avatar,
  }) {
    return CreateUserProvider(
      authId: authId,
      name: name,
      email: email,
      avatar: avatar,
    );
  }

  @override
  CreateUserProvider getProviderOverride(
    covariant CreateUserProvider provider,
  ) {
    return call(
      authId: provider.authId,
      name: provider.name,
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
    required this.authId,
    required this.name,
    this.email,
    this.avatar,
  }) : super.internal(
          (ref) => createUser(
            ref,
            authId: authId,
            name: name,
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
        );

  final String authId;
  final String name;
  final String? email;
  final String? avatar;

  @override
  bool operator ==(Object other) {
    return other is CreateUserProvider &&
        other.authId == authId &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authId.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, avatar.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$editProfileHash() => r'2e7dbff85dd000f1daf5fcb0415cc762a108a92c';
typedef EditProfileRef = AutoDisposeFutureProviderRef<User>;

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
    String? name,
    String? avatar,
  }) {
    return EditProfileProvider(
      name: name,
      avatar: avatar,
    );
  }

  @override
  EditProfileProvider getProviderOverride(
    covariant EditProfileProvider provider,
  ) {
    return call(
      name: provider.name,
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
    this.name,
    this.avatar,
  }) : super.internal(
          (ref) => editProfile(
            ref,
            name: name,
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
        );

  final String? name;
  final String? avatar;

  @override
  bool operator ==(Object other) {
    return other is EditProfileProvider &&
        other.name == name &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, name.hashCode);
    hash = _SystemHash.combine(hash, avatar.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$removeUserHash() => r'a944e951f63493b5db323195328875095f7a177d';
typedef RemoveUserRef = AutoDisposeFutureProviderRef<void>;

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
    required this.id,
    this.reason,
  }) : super.internal(
          (ref) => removeUser(
            ref,
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
        );

  final String id;
  final String? reason;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
