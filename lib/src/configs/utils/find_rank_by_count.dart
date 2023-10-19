import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

Rank findRankByCount(int count) {
  return Rank.values.firstWhere((_) {
    if (count >= _.range.min && // * 사잇값에 충족하는 경우
        count <= _.range.max - 1) return true;

    return _.range.max == 0; // * 최대 레벨일 경우
  });
}
