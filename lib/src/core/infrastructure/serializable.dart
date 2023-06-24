import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:json_annotation/json_annotation.dart';

const jsonSerializable = JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
);

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
