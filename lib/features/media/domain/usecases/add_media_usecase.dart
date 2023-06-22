import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/enums.dart';
import 'package:serendy/features/media/media.dart';

typedef AddMediaPort = ({
  String executorId,
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

final class AddMediaUsecase implements UseCase<AddMediaPort, void> {
  const AddMediaUsecase(this._mediaRepository);
  final MediaRepository _mediaRepository;

  @override
  Future<void> execute(AddMediaPort payload) async {
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

    await _mediaRepository.create(media);
  }
}