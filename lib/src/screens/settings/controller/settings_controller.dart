import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/application/user_service.dart';

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
    // * URL을 불러와요.
    final supabase = ref.watch(supabaseProvider);
    final data = await supabase //
        .from(TablePath.rootUrl)
        .select<PostgrestList>('url');

    // * 내 정보를 불러와요.
    final user = await ref.watch(getMeProvider.future);
    final queryParam = '?email=${user.email}';

    // * DB 순서대로 값을 전달해요.
    final urls = data.map((_) => _['url']).toList();
    state = SettingsState(
      privacyPolicyUrl: urls[0],
      termsOfServiceUrl: urls[1],
      reportProblemUrl: '${urls[2]}$queryParam',
      requestUpdateUrl: '${urls[3]}$queryParam',
    );
  }
}
