part of 'media.dart';

//Entity
final class MediaExternal extends Equatable {
  /// 이름
  final String name;

  /// 주소
  final String url;

  const MediaExternal({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
