import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:serendy/env.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/app_bootstrap_prod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * 환경 설정
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseKey,
    debug: kDebugMode,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // * 앱 설정
  final appBootstrap = AppBootstrap();
  final container = await appBootstrap.createProdProviderContainer();

  // * 앱 시작
  final root = appBootstrap.createRootWidget(container);
  runApp(root);
}
