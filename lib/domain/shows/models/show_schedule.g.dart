// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ShowSchedule _$ShowScheduleFromJson(Map<String, dynamic> json) => ShowSchedule(
//       time: json['time'] as String,
//       days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
//     );

Map<String, dynamic> _$ShowScheduleToJson(ShowSchedule instance) =>
    <String, dynamic>{
      'time': instance.time,
      'days': instance.days,
    };

_$_ShowSchedule _$$_ShowScheduleFromJson(Map<String, dynamic> json) =>
    _$_ShowSchedule(
      time: json['time'] as String,
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ShowScheduleToJson(_$_ShowSchedule instance) =>
    <String, dynamic>{
      'time': instance.time,
      'days': instance.days,
    };
