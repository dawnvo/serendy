import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/user/user.dart';

part 'profile_controller.g.dart';
part 'profile_state.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    final me = await ref.watch(fetchMeProvider.future);
    final count = await ref.watch(countMyEvaluationsProvider.future);
    final collections = await ref.watch(watchMyCollectionsListProvider.future);

    return ProfileState(
      user: me,
      evaluationsCount: count,
      myCollections: collections,
    );
  }

  Future<void> userProfileUpdated(User user) async {
    state = AsyncData(state.requireValue.copyWith(user: user));
  }

  Future<void> evaluationsCountUpdated() async {
    final count = await ref.refresh(countMyEvaluationsProvider.future);
    state = AsyncData(state.requireValue.copyWith(evaluationsCount: count));
  }
}
