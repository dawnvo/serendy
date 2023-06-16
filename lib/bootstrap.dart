import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:serendy/bloc_observer.dart';
import 'package:serendy/core/core.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    logger.e(details.exceptionAsString(), details.exception, details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await setupServiceLocator();
  runApp(await builder());
}
