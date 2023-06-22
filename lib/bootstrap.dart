import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/core/persistence/firebase_options.dart';
import 'package:serendy/core/utils/bloc_observer.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  // BlocObserver
  Bloc.observer = const AppBlocObserver();

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // GetIt dependecies
  AppBinding.dependencies();

  runApp(await builder());
}
