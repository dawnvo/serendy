part of 'add_media_cubit.dart';

enum AddMediaStatus { initial, loading, success, failure }

extension AddMediaStatusX on AddMediaStatus {
  bool get isInitial => this == AddMediaStatus.initial;
  bool get isLoading => this == AddMediaStatus.loading;
  bool get isSuccess => this == AddMediaStatus.success;
  bool get isFailure => this == AddMediaStatus.failure;
}

final class AddMediaState extends Equatable {
  const AddMediaState({
    this.status = AddMediaStatus.initial,
    this.image = '',
    this.title = '',
    this.keywords = const [],
    this.startDate,
    this.endDate,
    this.isAdult = false,
    this.mediaType = MediaType.anime,
    this.mediaStatus = MediaStatus.finished,
    this.errorMessage,
  });

  final AddMediaStatus status;
  final String image;
  final String title;
  final List<String> keywords;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isAdult;
  final MediaType mediaType;
  final MediaStatus mediaStatus;
  final String? errorMessage;

  AddMediaState copyWith({
    final AddMediaStatus? status,
    final String? image,
    final String? title,
    final List<String>? keywords,
    final DateTime? startDate,
    final DateTime? endDate,
    final bool? isAdult,
    final MediaType? mediaType,
    final MediaStatus? mediaStatus,
    final String? errorMessage,
  }) {
    return AddMediaState(
      status: status ?? this.status,
      image: image ?? this.image,
      title: title ?? this.title,
      keywords: keywords ?? this.keywords,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAdult: isAdult ?? this.isAdult,
      mediaType: mediaType ?? this.mediaType,
      mediaStatus: mediaStatus ?? this.mediaStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        image,
        title,
        keywords,
        startDate,
        endDate,
        isAdult,
        mediaType,
        mediaStatus,
        errorMessage,
      ];
}
