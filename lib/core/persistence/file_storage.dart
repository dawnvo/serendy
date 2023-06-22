import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FileStorage {
  Future<String?> upload(String key, String filePath);
  Future<void> delete(String key);
}

final class FileStorageImpl implements FileStorage {
  FileStorageImpl(this.bucketName, this.storage);

  final String bucketName;
  final FirebaseStorage storage;

  @override
  Future<String?> upload(String key, String filePath) async {
    final file = File(filePath);

    // 파일이 존재하는지 확인해요.
    if (!await file.exists()) return null;

    final storageRef = storage.ref('$bucketName/$key');
    final uploadTask = await storageRef.putFile(file);

    final downloadUrl = await uploadTask.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<void> delete(String key) async {
    final storageRef = storage.ref('$bucketName/$key');
    await storageRef.delete();
  }
}

/// TODO: 나중에 저장소를 교체할 때 이미지 중복 검사(이미지 해싱) 및 이미지 최적화하기.
/// 아니면, media_file 도메인을 만들어서 DB에 파일 이력을 기록해 체크해도 괜찮을 듯.
///  
/// 스토리지 서비스
/// 1. [backblaze-b2](https://www.backblaze.com/)
/// 2. [minio](https://min.io/)