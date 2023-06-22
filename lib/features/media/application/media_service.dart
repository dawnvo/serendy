import 'package:serendy/core/enums.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/auth/application/auth_service.dart';
import 'package:serendy/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/features/media/domain/usecases/search_media_usecase.dart';
import 'package:serendy/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/features/media/media.dart';

class MediaService {
  const MediaService(
    this._authService,
    this._getMediaListUsecase,
    this._getMediaUsecase,
    this._addMediaUsecase,
  );

  final AuthService _authService;
  final SearchMediaUsecase _getMediaListUsecase;
  final GetMediaUsecase _getMediaUsecase;
  final AddMediaUsecase _addMediaUsecase;

  /// 내 정보를 불러와요.
  Future<Media> fetchMedia({
    required String mediaId,
  }) async {
    return _getMediaUsecase.execute((mediaId: mediaId,));
  }

  /// 사용자를 제거해요.
  Future<List<Media?>> fetchMediasList({
    String? title,
  }) async {
    return _getMediaListUsecase.execute((title: title,));
  }

  /// 내 정보를 불러와요.
  Future<void> addMedia({
    required MediaStatus status,
    required MediaType type,
    required String title,
    required String image,
    required List<String> keywords,
    String? synopsis,
    DateTime? endDate,
    bool? isAdult,
    DateTime? startDate,
  }) async {
    return _addMediaUsecase.execute((
      executorId: _userId,
      image: image,
      keywords: keywords,
      status: status,
      synopsis: synopsis,
      title: title,
      type: type,
      endDate: endDate,
      isAdult: isAdult,
      startDate: startDate,
    ));
  }

  String get _userId {
    final userId = _authService.currentUserId;
    if (userId == null) throw const UnauthorizedException();
    return userId;
  }
}
