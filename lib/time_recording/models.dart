import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:smallbusiness/reusable/converter.dart';
import 'package:smallbusiness/reusable/user_actions/models.dart';

part 'models.g.dart';

@JsonSerializable(explicitToJson: true)
class Pause {
  @JsonKey(toJson: toTimeStamp, fromJson: fromTimeStamp)
  DateTime from;
  @JsonKey(toJson: toTimeStamp, fromJson: fromTimeStamp)
  DateTime to;
  Pause({
    required this.from,
    required this.to,
  });

  factory Pause.fromJson(DynamicMap data) {
    return _$PauseFromJson(data);
  }

  DynamicMap toJson() {
    return _$PauseToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class TimeRecording {
  @JsonKey(toJson: refConverter, fromJson: refConverter)
  final DocumentReference<DynamicMap> employeeRef;
  @JsonKey(toJson: refConverter, fromJson: refConverter)
  final DocumentReference<DynamicMap> companyRef;
  @JsonKey(toJson: toTimeStamp, fromJson: fromTimeStamp)
  DateTime from;
  @JsonKey(toJson: toTimeStamp, fromJson: fromTimeStamp)
  DateTime? to;
  List<Pause> pauses;
  String? message;
  bool finalized;
  TimeRecording({
    required this.employeeRef,
    required this.companyRef,
    required this.from,
    required this.to,
    required this.pauses,
    required this.message,
    required this.finalized,
  });

  factory TimeRecording.fromJson(DynamicMap data) {
    return _$TimeRecordingFromJson(data);
  }

  DynamicMap toJson() {
    return _$TimeRecordingToJson(this);
  }
}
