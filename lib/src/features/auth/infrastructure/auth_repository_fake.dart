import 'dart:developer';

import 'package:serendy/src/configs/configs.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:serendy/src/features/auth/infrastructure/auth_repository_impl.dart';

class AuthRepositoryFake implements AuthRepositoryImpl {
  AuthRepositoryFake();

  final _authStore = InMemoryStore<sb.User?>(null);

  @override
  Stream<sb.User?> authStateChange() {
    log(name: 'Repository', 'authStateChange');
    return _authStore.stream;
  }

  @override
  sb.User? get currentUser => _authStore.value;

  @override
  Future<void> signOutWithGoogle() async {
    log(name: 'Repository', 'signOutWithGoogle');
    _authStore.value = null;
  }

  @override
  Future<sb.User?> signInWithGoogle() async {
    log(name: 'Repository', 'signInWithGoogle');
    _authStore.value = _createUser();
    return _authStore.value;
  }

  sb.User _createUser() {
    return const sb.User(
      id: 'test-id',
      aud: 'test-aud',
      email: 'test@gmail.com',
      appMetadata: {},
      userMetadata: {},
      createdAt: '',
    );
  }
}
