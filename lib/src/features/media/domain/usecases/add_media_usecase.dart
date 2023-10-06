import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef AddMediaPayload = ({
  UserID executorId,
  MediaType type,
  MediaStatus status,
  String title,
  String image,
  List<String> keywords,
  bool? isAdult,
  DateTime? startDate,
  DateTime? endDate,
  String? synopsis,
});

final class AddMediaUsecase implements UseCase<AddMediaPayload, void> {
  const AddMediaUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<void> execute(AddMediaPayload payload) async {
    final media = Media(
      type: payload.type,
      status: payload.status,
      title: payload.title,
      image: payload.image,
      synopsis: payload.synopsis,
      keywords: payload.keywords,
      isAdult: payload.isAdult,
      startDate: payload.startDate,
      endDate: payload.endDate,
    );

    await _mediaRepository.insertMedia(media);
  }
}
