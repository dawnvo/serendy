import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:serendy/configs/configs.dart';

class SerendyApp extends StatelessWidget {
  const SerendyApp({super.key});

  @override
  Widget build(BuildContext context) {
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

          // themes
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
