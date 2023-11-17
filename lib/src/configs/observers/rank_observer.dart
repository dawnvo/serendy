import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

class RankObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // * countEvaluations 공급자가 아닐 경우 작업을 끝내요.
    if (provider != countEvaluationsProvider) return;

    previousValue as AsyncValue<int>?;
    newValue as AsyncValue<int>;

    final prevCount = previousValue?.value ?? 0;
    final nextCount = newValue.value ?? 0;

    // * 평가 개수가 이전과 동일한 경우 작업을 끝내요.
    if (prevCount == 0 || prevCount == nextCount) return;

    // * 평가 개수에 해당하는 등급을 가져와요.
    final rank = findRankByCount(nextCount);

    // * 조건에 충족할 경우 RankUp 화면을 보여줘요.
    if (prevCount < rank.range.min && nextCount == rank.range.min) {
      final router = container.read(goRouterProvider);
      router.pushNamed(AppRoutes.rank, extra: rank);
    }
  }
}
