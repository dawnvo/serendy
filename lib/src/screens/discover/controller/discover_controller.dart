import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/collection/collection.dart';

part 'discover_controller.g.dart';
part 'discover_state.dart';

@riverpod
class DiscoverController extends _$DiscoverController {
  @override
  FutureOr<DiscoverState> build() async {
    final collections = await ref.watch(fetchCollectionsListProvider.future);
    return DiscoverState(collections: collections);
  }
}
