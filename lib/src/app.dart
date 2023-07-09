import 'package:dynamic_color/dynamic_color.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/screens/profile/controller/profile_controller.dart';

class SerendyApp extends ConsumerWidget {
  const SerendyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    // TODO: 유지보수 필요
    // * RankUp 화면을 띄우기 위해 필요해요.
    ref.watch(profileControllerProvider);

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
