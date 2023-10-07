// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithGoogleHash() => r'750a6bda262219365ad418401eda2dd344758c6e';

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
String _$signOutHash() => r'4df7ab38c681d51e0f11afe52cdc180df37c5cfa';

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
String _$currentUserIdHash() => r'0b7081a6fc48f45c88192f9ddff20e82e5f99093';

/// 사용자 식별자를 가져와요.
///
/// Copied from [currentUserId].
@ProviderFor(currentUserId)
final currentUserIdProvider = AutoDisposeProvider<String?>.internal(
  currentUserId,
  name: r'currentUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserIdRef = AutoDisposeProviderRef<String?>;
String _$requireUserIdHash() => r'c672917c56e02a82140e2eddc92c47ad22bafcb5';

/// 사용자 식별자를 엄격히 가져와요.
///
/// Copied from [requireUserId].
@ProviderFor(requireUserId)
final requireUserIdProvider = AutoDisposeProvider<String>.internal(
  requireUserId,
  name: r'requireUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requireUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RequireUserIdRef = AutoDisposeProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
