// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
//       id: json['id'] as int?,
//       url: json['url'] as String?,
//       name: json['name'] as String?,
//       season: json['season'] as int?,
//       number: json['number'] as int?,
//       summary: json['summary'] as String?,
//       image: json['image'] == null
//           ? null
//           : MediaImage.fromJson(json['image'] as Map<String, dynamic>),
//     );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'summary': instance.summary,
      'image': instance.image,
    };

_$_Episode _$$_EpisodeFromJson(Map<String, dynamic> json) => _$_Episode(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      season: json['season'] as int?,
      number: json['number'] as int?,
      summary: json['summary'] as String?,
      image: json['image'] == null
          ? null
          : MediaImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EpisodeToJson(_$_Episode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'summary': instance.summary,
      'image': instance.image,
    };
