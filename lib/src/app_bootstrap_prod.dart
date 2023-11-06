import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/configs/exceptions/async_error_logger.dart';

extension AppBootstrapFirebase on AppBootstrap {
  Future<ProviderContainer> createProdProviderContainer() async {
    return ProviderContainer(observers: [
      AsyncErrorLogger(),
    ]);
  }
}
