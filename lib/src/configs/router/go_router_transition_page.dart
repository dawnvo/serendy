import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class GoRouterTransitionPage extends CustomTransitionPage {
  const GoRouterTransitionPage({
    required super.child,
    required super.transitionsBuilder,
    super.transitionDuration,
    super.maintainState,
    super.fullscreenDialog,
    super.key,
  });

  /// * Vertical Axis
  factory GoRouterTransitionPage.verticalAxis({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return GoRouterTransitionPage(
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      transitionsBuilder: _verticalAxisTransitionBuilder,
      child: child,
    );
  }

  /// * Horizontal Axis
  factory GoRouterTransitionPage.horizontalAxis({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return GoRouterTransitionPage(
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      transitionsBuilder: _horizontalAxisTransitionBuilder,
      child: child,
    );
  }

  /// * None
  factory GoRouterTransitionPage.none({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return GoRouterTransitionPage(
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      transitionsBuilder: _noneTransitionsBuilder,
      child: child,
    );
  }

  static Widget _verticalAxisTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SharedAxisTransition(
        transitionType: SharedAxisTransitionType.vertical,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );

  static Widget _horizontalAxisTransitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SharedAxisTransition(
        transitionType: SharedAxisTransitionType.horizontal,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );

  static Widget _noneTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}
