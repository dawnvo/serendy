import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/media/domain/ports/persistence/media_repository_port.dart';
import 'package:serendy/features/media/domain/ports/usecases/add_media_port.dart';
import 'package:serendy/features/media/media.dart';

final class AddMediaUsecase implements UseCase<AddMediaPort, void> {
  const AddMediaUsecase(this._mediaRepository);

  final MediaRepositoryPort _mediaRepository;

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

    await _mediaRepository.addMedia(media);
  }
}
