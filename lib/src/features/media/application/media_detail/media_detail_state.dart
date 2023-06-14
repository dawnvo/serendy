import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serendy/src/features/evaluation/domain/evaluation.dart';
import 'package:serendy/src/features/media/domain/media.dart';

part 'media_detail_state.freezed.dart';

@freezed
class MediaDetailState with _$MediaDetailState {
  const factory MediaDetailState({
    required Media? media,
    required List<Evaluation?> reactions,
  }) = _MediaDetailState;
}
