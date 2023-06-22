import 'package:serendy/core/locator.dart';
import 'package:serendy/features/auth/auth.dart';

abstract final class AuthModule {
  static void dependencies() {
    sl.registerSingleton(AuthService(sl(), sl()));
  }
}
