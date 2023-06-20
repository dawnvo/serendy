import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/network/firestore_path.dart';
import 'package:serendy/features/user/data/entities/user_entity.dart';
import 'package:serendy/features/user/data/mappers/user_mapper.dart';
import 'package:serendy/features/user/domain/ports/persistence/user_repository_port.dart';
import 'package:serendy/features/user/user.dart';

final class UserRepository implements UserRepositoryPort {
  const UserRepository(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<User?> findOne(UserID userId) async {
    final docRef = _firestore.collection(FirestorePath.user).doc(userId);
    final userData = await docRef.get().then((user) => user.data());

    if (userData == null) return null;

    final userEntity = UserEntity.fromJson(userData);
    return UserMapper.toDomain(userEntity);
  }

  @override
  Future<void> create(User user) async {
    final userEntity = UserMapper.toEntity(user);

    final ref = _firestore.collection(FirestorePath.user);
    await ref.doc(user.id).set(userEntity.toJson());
  }

  @override
  Future<void> update(User user) async {
    final userEntity = UserMapper.toEntity(user);

    final ref = _firestore.collection(FirestorePath.user);
    await ref.doc(user.id).update(userEntity.toJson());
  }

  @override
  Future<void> delete(User user) async {
    final ref = _firestore.collection(FirestorePath.user);
    await ref.doc(user.id).delete();
  }
}
