import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/configs/exceptions/async_error_logger.dart';

/// [] offset 때문인지 orderby 때문인지 데이터가 중복되는 문제
/// [] 테마 항목이 이미 존재하면 힌트 표시
/// [] 홈, 발견 화면에 새로고침 지원하기
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * 환경 설정
  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
    debug: kDebugMode,
  );

  final bootstrap = AppBootstrap();
  final container = ProviderContainer(observers: [
    ProviderObserverLogger(),
    AsyncErrorLogger(),
  ]);

  // * 앱을 시작해요.
  final root = bootstrap.createRootWidget(container: container);
  runApp(root);
}
