// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithGoogleHash() => r'20e702f245408bd607738d09f1bc02a0cd5b8533';

/// 구글 로그인을 진행해요.
///
/// Copied from [signInWithGoogle].
@ProviderFor(signInWithGoogle)
final signInWithGoogleProvider =
    AutoDisposeFutureProvider<AuthResponse>.internal(
  signInWithGoogle,
  name: r'signInWithGoogleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInWithGoogleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInWithGoogleRef = AutoDisposeFutureProviderRef<AuthResponse>;
String _$signOutHash() => r'a05e64e1bcb4638b1bbb504f3e9ee656721a4c99';

/// 로그아웃해요.
///
/// Copied from [signOut].
@ProviderFor(signOut)
final signOutProvider = AutoDisposeFutureProvider<void>.internal(
  signOut,
  name: r'signOutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignOutRef = AutoDisposeFutureProviderRef<void>;
String _$signOutWithGoogleHash() => r'6ab9c3ad85afd7d0a5cd6d1bb887b32fadb82cae';

/// 구글 로그아웃해요.
///
/// Copied from [signOutWithGoogle].
@ProviderFor(signOutWithGoogle)
final signOutWithGoogleProvider = AutoDisposeFutureProvider<void>.internal(
  signOutWithGoogle,
  name: r'signOutWithGoogleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutWithGoogleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignOutWithGoogleRef = AutoDisposeFutureProviderRef<void>;
String _$deleteAuthUserHash() => r'8339cc66131f56c7b7481d2b0388ebd071365d01';

/// 계정을 삭제해요.
///
/// Copied from [deleteAuthUser].
@ProviderFor(deleteAuthUser)
final deleteAuthUserProvider = AutoDisposeFutureProvider<void>.internal(
  deleteAuthUser,
  name: r'deleteAuthUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteAuthUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeleteAuthUserRef = AutoDisposeFutureProviderRef<void>;
String _$currentUserIdHash() => r'cfd42f0b539d0f4e1719bcdcd9c4ed0f1cf7aa9c';

/// 사용자 식별자를 가져와요.
///
/// Copied from [currentUserId].
@ProviderFor(currentUserId)
final currentUserIdProvider = Provider<UserID?>.internal(
  currentUserId,
  name: r'currentUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserIdRef = ProviderRef<UserID?>;
String _$requireUserIdHash() => r'474d4cb71cd6126a14442f647264f90428f04d89';

/// 사용자 식별자를 엄격히 가져와요.
///
/// Copied from [requireUserId].
@ProviderFor(requireUserId)
final requireUserIdProvider = Provider<UserID>.internal(
  requireUserId,
  name: r'requireUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requireUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RequireUserIdRef = ProviderRef<UserID>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
