// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Show _$ShowFromJson(Map<String, dynamic> json) => Show(
//       id: json['id'] as int,
//       url: json['url'] as String,
//       name: json['name'] as String,
//       language: json['language'] as String,
//       genres:
//           (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
//       premiered: json['premiered'] as String?,
//       schedule: ShowSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
//       summary: json['summary'] as String,
//       image: Map<String, String>.from(json['image'] as Map),
//     );

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'language': instance.language,
      'genres': instance.genres,
      'premiered': instance.premiered,
      'schedule': instance.schedule,
      'summary': instance.summary,
      'image': instance.image,
    };

_$_Show _$$_ShowFromJson(Map<String, dynamic> json) => _$_Show(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      language: json['language'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      premiered: json['premiered'] as String?,
      schedule: ShowSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      image: Map<String, String>.from(json['image'] as Map),
    );

Map<String, dynamic> _$$_ShowToJson(_$_Show instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'language': instance.language,
      'genres': instance.genres,
      'premiered': instance.premiered,
      'schedule': instance.schedule,
      'summary': instance.summary,
      'image': instance.image,
    };
