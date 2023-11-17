import 'dart:developer';

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

final class UserRepositoryFake implements UserRepository {
  UserRepositoryFake();

  final _userStore = InMemoryStore(mockUsers);

  @override
  Future<User?> fetchUser({
    UserID? id,
    String? username,
  }) async {
    log(name: 'Repository', 'fetchUser');
    var users = _userStore.value;
    if (id != null) users = users.where((_) => _.id == id).toList();
    if (username != null) users = users.where((_) => _.username == username).toList();
    return users.firstOrNull;
  }

  @override
  Future<void> createUser(
    User user,
  ) async {
    log(name: 'Repository', 'createUser');
    final users = _userStore.value;
    users.add(user);
  }

  @override
  Future<void> updateUser(
    User user,
  ) async {
    log(name: 'Repository', 'updateUser');
    final users = _userStore.value;
    final index = users.indexWhere((_) => _.id == user.id);
    if (index != -1) users[index] = user;
  }

  @override
  Future<void> deleteUser({
    required UserID userId,
    required ExitReason reason,
    String? comment,
  }) async {
    log(name: 'Repository', 'deleteUser');
    final users = _userStore.value;
    users.removeWhere((_) => _.id == userId);
  }
}

final mockUsers = [
  User(
    id: 'test-id',
    email: 'serendy@email.com',
    username: "serendy",
  )
];
