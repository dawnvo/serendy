import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:serendy/env.dart';
import 'package:serendy/firebase_options.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/app_bootstrap_fake.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * 환경 설정
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseKey,
    debug: kDebugMode,
  );

  // FIXME: 개발 환경일 경우 Firebase 삭제
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);

  // * 앱 설정
  final appBootstrap = AppBootstrap();
  final container = await appBootstrap.createFakeProviderContainer();

  // * 앱 시작
  final root = appBootstrap.createRootWidget(container);
  runApp(root);
}
