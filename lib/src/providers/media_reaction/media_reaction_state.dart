import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serendy/src/models/models.dart';

part 'media_reaction_state.freezed.dart';

@freezed
class MediaReactionState with _$MediaReactionState {
  const factory MediaReactionState({
    required Evaluation? reaction,
  }) = _MediaReactionState;
}
