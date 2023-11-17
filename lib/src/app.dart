import 'package:serendy/src/configs/configs.dart';

class SerendyApp extends ConsumerWidget {
  const SerendyApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeData = AppThemeData.fillWith();

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
