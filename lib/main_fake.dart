import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:serendy/env.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/app_bootstrap_fake.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * 환경 설정
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseKey,
    debug: kDebugMode,
  );

  // * 앱 설정
  final appBootstrap = AppBootstrap();
  final container = await appBootstrap.createFakeProviderContainer();

  // * 앱 시작
  final root = appBootstrap.createRootWidget(container);
  runApp(root);
}
