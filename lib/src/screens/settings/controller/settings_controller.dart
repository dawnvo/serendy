import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

part 'settings_controller.g.dart';
part 'settings_state.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  SettingsState build() {
    // * lazy Loading
    _fetch();
    return const SettingsState();
  }

  /// 세렌디 주요 URL을 불러와요.
  Future<void> _fetch() async {
    // * 내 정보를 불러와요.
    final user = await ref.watch(getMeProvider.future);
    final queryParam = '?email=${user.email}';

    // * 원격 불러오기를 설정해요.
    final remoteConfig = ref.watch(firebaseRemoteConfigProvider);
    await remoteConfig.fetchAndActivate();

    // * URL을 불러와요.
    final privacyPolicy = remoteConfig.getString('privacy_policy');
    final termsOfService = remoteConfig.getString('terms_of_service');
    final customerSupport = remoteConfig.getString('customer_support');
    final databaseRequest = remoteConfig.getString('database_request');

    state = SettingsState(
      privacyPolicyUrl: privacyPolicy,
      termsOfServiceUrl: termsOfService,
      reportProblemUrl: '$customerSupport$queryParam',
      requestUpdateUrl: '$databaseRequest$queryParam',
    );
  }
}
