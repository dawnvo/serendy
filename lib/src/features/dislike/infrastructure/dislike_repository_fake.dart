import 'dart:developer';

import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/user/user.dart';

final class DislikeRepositoryFake extends DislikeRepository {
  DislikeRepositoryFake();

  @override
  Future<void> addDislike(
    Dislike dislike,
  ) async {
    log(name: 'Repository', 'addDislike');
  }

  @override
  Future<void> clearDislikes(
    UserID userId,
  ) async {
    log(name: 'Repository', 'clearDislikes');
  }
}
