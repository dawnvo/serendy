part of 'media_detail_provider.dart';

@freezed
class MediaDetailState with _$MediaDetailState {
  const factory MediaDetailState({
    required Media? media,
    required List<Evaluation?> reactions,
  }) = _MediaDetailState;
}
