import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/user/infrastructure/user_entity.dart';
import 'package:serendy/src/features/user/infrastructure/user_mapper.dart';
import 'package:serendy/src/features/user/user.dart';

final class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.firestore)
      : _ref = firestore.collection(FirestorePath.user);

  final FirebaseFirestore firestore;
  final CollectionReference<Map<String, dynamic>> _ref;

  @override
  Future<User?> findOne(UserID userId) async {
    final snapshot = await _ref.doc(userId).get();

    final data = snapshot.data();
    if (data == null) return null;

    final userEntity = UserEntity.fromJson(data);
    return UserMapper.toDomain(userEntity);
  }

  @override
  Future<void> create(User user) async {
    final userEntity = UserMapper.toEntity(user);
    await _ref.doc(user.id).set(userEntity.toJson());
  }

  @override
  Future<void> update(User user) async {
    final userEntity = UserMapper.toEntity(user);
    await _ref.doc(user.id).update(userEntity.toJson());
  }

  @override
  Future<void> delete(User user) async {
    await _ref.doc(user.id).delete();
  }
}
