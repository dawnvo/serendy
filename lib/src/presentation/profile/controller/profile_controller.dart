import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

part 'profile_controller.g.dart';
part 'profile_state.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    final count = await ref.watch(countMyEvaluationsProvider.future);
    final collections = await ref.watch(watchMyCollectionsListProvider.future);

    return ProfileState(
      evaluationsCount: count,
      myCollections: collections,
    );
  }
}
