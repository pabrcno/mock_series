import 'package:freezed_annotation/freezed_annotation.dart';
part 'show_schedule.freezed.dart';
part 'show_schedule.g.dart';

@freezed
@JsonSerializable()
abstract class ShowSchedule with _$ShowSchedule {
  const factory ShowSchedule(
      {required String time, required List<String> days}) = _ShowSchedule;
  factory ShowSchedule.fromJson(Map<String, dynamic> json) =>
      _$ShowScheduleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ShowScheduleToJson(this);
}
