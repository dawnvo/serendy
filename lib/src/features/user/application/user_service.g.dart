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
String _$checkUsernameHash() => r'7258c28ab3600312d38e8c47182d3dd096439105';

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

/// 사용자 이름이 존재하는지 확인해요.
/// 존재하면 True.
///
/// Copied from [checkUsername].
@ProviderFor(checkUsername)
const checkUsernameProvider = CheckUsernameFamily();

/// 사용자 이름이 존재하는지 확인해요.
/// 존재하면 True.
///
/// Copied from [checkUsername].
class CheckUsernameFamily extends Family<AsyncValue<bool>> {
  /// 사용자 이름이 존재하는지 확인해요.
  /// 존재하면 True.
  ///
  /// Copied from [checkUsername].
  const CheckUsernameFamily();

  /// 사용자 이름이 존재하는지 확인해요.
  /// 존재하면 True.
  ///
  /// Copied from [checkUsername].
  CheckUsernameProvider call({
    required String username,
  }) {
    return CheckUsernameProvider(
      username: username,
    );
  }

  @override
  CheckUsernameProvider getProviderOverride(
    covariant CheckUsernameProvider provider,
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
  String? get name => r'checkUsernameProvider';
}

/// 사용자 이름이 존재하는지 확인해요.
/// 존재하면 True.
///
/// Copied from [checkUsername].
class CheckUsernameProvider extends AutoDisposeFutureProvider<bool> {
  /// 사용자 이름이 존재하는지 확인해요.
  /// 존재하면 True.
  ///
  /// Copied from [checkUsername].
  CheckUsernameProvider({
    required String username,
  }) : this._internal(
          (ref) => checkUsername(
            ref as CheckUsernameRef,
            username: username,
          ),
          from: checkUsernameProvider,
          name: r'checkUsernameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkUsernameHash,
          dependencies: CheckUsernameFamily._dependencies,
          allTransitiveDependencies:
              CheckUsernameFamily._allTransitiveDependencies,
          username: username,
        );

  CheckUsernameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
  }) : super.internal();

  final String username;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CheckUsernameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckUsernameProvider._internal(
        (ref) => create(ref as CheckUsernameRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CheckUsernameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckUsernameProvider && other.username == username;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckUsernameRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `username` of this provider.
  String get username;
}

class _CheckUsernameProviderElement
    extends AutoDisposeFutureProviderElement<bool> with CheckUsernameRef {
  _CheckUsernameProviderElement(super.provider);

  @override
  String get username => (origin as CheckUsernameProvider).username;
}

String _$getUserHash() => r'872c4db50d395481490f8d4b8ca2da875da0bb59';

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

String _$deleteUserHash() => r'b259795534a856131814d11de8b948faa2dddbb3';

/// 사용자를 제거해요.
///
/// Copied from [deleteUser].
@ProviderFor(deleteUser)
const deleteUserProvider = DeleteUserFamily();

/// 사용자를 제거해요.
///
/// Copied from [deleteUser].
class DeleteUserFamily extends Family<AsyncValue<void>> {
  /// 사용자를 제거해요.
  ///
  /// Copied from [deleteUser].
  const DeleteUserFamily();

  /// 사용자를 제거해요.
  ///
  /// Copied from [deleteUser].
  DeleteUserProvider call({
    required ExitReason reason,
    String? comment,
  }) {
    return DeleteUserProvider(
      reason: reason,
      comment: comment,
    );
  }

  @override
  DeleteUserProvider getProviderOverride(
    covariant DeleteUserProvider provider,
  ) {
    return call(
      reason: provider.reason,
      comment: provider.comment,
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
  String? get name => r'deleteUserProvider';
}

/// 사용자를 제거해요.
///
/// Copied from [deleteUser].
class DeleteUserProvider extends AutoDisposeFutureProvider<void> {
  /// 사용자를 제거해요.
  ///
  /// Copied from [deleteUser].
  DeleteUserProvider({
    required ExitReason reason,
    String? comment,
  }) : this._internal(
          (ref) => deleteUser(
            ref as DeleteUserRef,
            reason: reason,
            comment: comment,
          ),
          from: deleteUserProvider,
          name: r'deleteUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteUserHash,
          dependencies: DeleteUserFamily._dependencies,
          allTransitiveDependencies:
              DeleteUserFamily._allTransitiveDependencies,
          reason: reason,
          comment: comment,
        );

  DeleteUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.reason,
    required this.comment,
  }) : super.internal();

  final ExitReason reason;
  final String? comment;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteUserProvider._internal(
        (ref) => create(ref as DeleteUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        reason: reason,
        comment: comment,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteUserProvider &&
        other.reason == reason &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reason.hashCode);
    hash = _SystemHash.combine(hash, comment.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `reason` of this provider.
  ExitReason get reason;

  /// The parameter `comment` of this provider.
  String? get comment;
}

class _DeleteUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteUserRef {
  _DeleteUserProviderElement(super.provider);

  @override
  ExitReason get reason => (origin as DeleteUserProvider).reason;
  @override
  String? get comment => (origin as DeleteUserProvider).comment;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
