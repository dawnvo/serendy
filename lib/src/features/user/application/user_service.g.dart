// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
    required this.id,
  }) : super.internal(
          (ref) => fetchUser(
            ref,
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
        );

  final String id;

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

String _$createUserHash() => r'37aeba42ee09d742f685b3ec27983a7e6c03325f';
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
    required this.uid,
    required this.username,
    required this.email,
    this.avatar,
  }) : super.internal(
          (ref) => createUser(
            ref,
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
        );

  final String uid;
  final String username;
  final String email;
  final String? avatar;

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

String _$editProfileHash() => r'3a09b0f5c1ce6740855553de60d69dcfcc8e216a';
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
    this.username,
    this.avatar,
  }) : super.internal(
          (ref) => editProfile(
            ref,
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
        );

  final String? username;
  final String? avatar;

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
