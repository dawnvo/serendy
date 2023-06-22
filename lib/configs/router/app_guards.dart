import 'package:auto_route/auto_route.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/auth/auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authService = sl<AuthService>();

    /// 인증된 사용자일 경우
    if (authService.currentUserId != null) {
      resolver.next();
    }

    /// 인증되지 않은 사용자일 경우
    else {
      resolver.redirect(SignInRoute(onResult: (success) {
        resolver.next(success);
      }));
    }
  }
}
