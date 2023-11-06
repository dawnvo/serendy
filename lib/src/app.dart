import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

class SerendyApp extends ConsumerWidget {
  const SerendyApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeData = AppThemeData.fillWith();

    // * 핵심 기능이에요.
    // * 조건에 충족할 경우 RankUp 화면을 보여줘요.
    ref.listen(countEvaluationsProvider, (prev, next) {
      if (prev == null || !prev.hasValue || !next.hasValue) return;
      final prevCount = prev.value!;
      final nextCount = next.value!;

      final rank = findRankByCount(nextCount);
      if (prevCount < rank.range.min && nextCount == rank.range.min) {
        ref.read(goRouterProvider).pushNamed(AppRoutes.rank, extra: rank);
      }
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Serendy",
      routerConfig: goRouter,

      //themes
      themeMode: ThemeMode.dark,
      theme: themeData.day,
      darkTheme: themeData.night,

      // * 글자 크기 설정을 제한해요.
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
    );
  }
}
