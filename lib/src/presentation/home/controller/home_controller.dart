import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'home_controller.g.dart';
part 'home_state.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() async {
    final medias = await ref.watch(fetchMediaListProvider.future);
    return HomeState(medias: medias);
  }
}
