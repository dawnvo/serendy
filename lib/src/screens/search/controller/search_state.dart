part of 'search_controller.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.medias = const [],
  });

  final List<Media?> medias;

  SearchState copyWith({final List<Media?>? medias}) {
    return SearchState(medias: medias ?? this.medias);
  }

  @override
  List<Object?> get props => [medias];
}
