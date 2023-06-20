import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

abstract class MediaFileStoragePort {
  Future<String?> upload(String key, String filePath);

  Future<void> delete(String key);
}

final class MediaFileStorage implements MediaFileStoragePort {
  final String _bucket;

  final FirebaseStorage _storage;

  MediaFileStorage(this._bucket, this._storage);

  @override
  Future<String?> upload(String key, String filePath) async {
    final file = File(filePath);

    // 제대로 된 이미지 경로가 아니라면 요청을 무시합니다.
    if (!await file.exists()) return null;

    final storageRef = _storage.ref('$_bucket/$key');
    final uploadTask = await storageRef.putFile(file);

    final downloadUrl = await uploadTask.ref.getDownloadURL();

    return downloadUrl;
  }

  @override
  Future<void> delete(String key) async {
    final storageRef = _storage.ref('$_bucket/$key');
    await storageRef.delete();
  }
}

/// TODO: 나중에 저장소를 교체할 때 이미지 중복 검사(이미지 해싱) 및 이미지 최적화하기.
/// 아니면, media_file 도메인을 만들어서 DB에 파일 이력을 기록해 체크해도 괜찮을 듯.
///  
/// 스토리지 서비스
/// 1. [backblaze-b2](https://www.backblaze.com/)
/// 2. [minio](https://min.io/)