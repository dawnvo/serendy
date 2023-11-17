import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/configs/configs.dart';

extension AppBootstrapFirebase on AppBootstrap {
  Future<ProviderContainer> createProdProviderContainer() async {
    return ProviderContainer(observers: [
      ErrorObserver(),
      RankObserver(),
    ]);
  }
}
