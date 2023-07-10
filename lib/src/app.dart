import 'package:dynamic_color/dynamic_color.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

class SerendyApp extends ConsumerWidget {
  const SerendyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    // * 핵심 기능이에요. 지속적으로 상태를 감시해
    // * 승급 조건에 충족한 경우 RankUp 화면을 보여줘요.
    ref.listen(countMyEvaluationsProvider, (prev, next) {
      if (prev == null || !prev.hasValue || !next.hasValue) return;
      final prevCount = prev.value!;
      final nextCount = next.value!;

      final rank = findRankByCount(nextCount);
      if (prevCount < rank.range.min && nextCount == rank.range.min) {
        ref.read(goRouterProvider).pushNamed(AppRoutes.rankUp, extra: rank);
      }
    });

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final themeData = AppThemeData.fillWith(
          light: lightDynamic,
          dark: darkDynamic,
        );

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Serendy",
          routerConfig: goRouter,

          // Themes
          themeMode: ThemeMode.dark,
          theme: themeData.day,
          darkTheme: themeData.night,

          // 글자 크기 설정을 제한해요.
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        );
      },
    );
  }
}
