import 'package:serendy/core/locator.dart';
import 'package:serendy/features/auth/application/auth_service.dart';

abstract final class AuthModule {
  static void dependencies() {
    sl.registerSingleton(AuthService(sl(), sl()));
  }
}
