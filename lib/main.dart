import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/core/exceptions/async_error_logger.dart';
import 'package:serendy/src/core/persistence/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final bootstrap = AppBootstrap();
  final container = ProviderContainer(observers: [AsyncErrorLogger()]);

  final root = bootstrap.createRootWidget(container: container);

  runApp(root);
}
