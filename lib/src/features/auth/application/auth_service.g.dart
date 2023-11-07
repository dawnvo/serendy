// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangeHash() => r'37facf512c12e72efc84f29583bb775d38916a17';

/// 인증 상태를 감시해요.
///
/// Copied from [authStateChange].
@ProviderFor(authStateChange)
final authStateChangeProvider = StreamProvider<sb.User?>.internal(
  authStateChange,
  name: r'authStateChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateChangeRef = StreamProviderRef<sb.User?>;
String _$currentUserIdHash() => r'f42aed9c8e6f9f4e78054f9f45b4e8b960c9afee';

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
String _$signInWithGoogleHash() => r'889bc1c887966f6be33c7880cf4a1686bf698eb1';

/// 구글 로그인해요.
///
/// Copied from [signInWithGoogle].
@ProviderFor(signInWithGoogle)
final signInWithGoogleProvider = AutoDisposeFutureProvider<sb.User?>.internal(
  signInWithGoogle,
  name: r'signInWithGoogleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInWithGoogleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInWithGoogleRef = AutoDisposeFutureProviderRef<sb.User?>;
String _$signOutWithGoogleHash() => r'7a07e74e20ebcc71c2e4588180759cf581ce703e';

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
String _$deleteAuthHash() => r'6a2417468448e729ca54a34418193b2768f795ba';

/// 계정을 삭제해요.
///
/// Copied from [deleteAuth].
@ProviderFor(deleteAuth)
final deleteAuthProvider = AutoDisposeFutureProvider<void>.internal(
  deleteAuth,
  name: r'deleteAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deleteAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeleteAuthRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
