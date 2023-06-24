import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

part 'profile_controller.g.dart';

class _ProfileState extends Equatable {
  const _ProfileState({
    required this.evaluationsCount,
    required this.myCollections,
  });

  final int evaluationsCount;
  final List<Collection?> myCollections;

  @override
  List<Object?> get props => [
        evaluationsCount,
        myCollections,
      ];
}

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<_ProfileState> build() async {
    final count = await ref.watch(countMyEvaluationsProvider.future);
    final collections = await ref.watch(watchMyCollectionsListProvider.future);

    return _ProfileState(
      evaluationsCount: count,
      myCollections: collections,
    );
  }
}
