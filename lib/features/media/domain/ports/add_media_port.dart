import 'package:serendy/core/enums.dart';

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
