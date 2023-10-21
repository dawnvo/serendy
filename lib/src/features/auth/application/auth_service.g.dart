// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInWithGoogleHash() => r'7c267a6641da1c4f07da9839aec70e5072e806ce';

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
String _$currentUserIdHash() => r'396497a03206c19e60d3f5d281078b3020d0fcbc';

/// 회원탈퇴
/// 사용자 식별자를 가져와요.
///
/// Copied from [currentUserId].
@ProviderFor(currentUserId)
final currentUserIdProvider = Provider<String?>.internal(
  currentUserId,
  name: r'currentUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserIdRef = ProviderRef<String?>;
String _$requireUserIdHash() => r'474d4cb71cd6126a14442f647264f90428f04d89';

/// 사용자 식별자를 엄격히 가져와요.
///
/// Copied from [requireUserId].
@ProviderFor(requireUserId)
final requireUserIdProvider = Provider<String>.internal(
  requireUserId,
  name: r'requireUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requireUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RequireUserIdRef = ProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
