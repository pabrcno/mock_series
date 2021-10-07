// GENERATED CODE - DO NOT MODIFY BY HAND

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
//       images: (json['images'] as Map<String, dynamic>?)?.map(
//         (k, e) => MapEntry(k, e as String),
//       ),
//     );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'summary': instance.summary,
      'images': instance.images,
    };

_$_Episode _$$_EpisodeFromJson(Map<String, dynamic> json) => _$_Episode(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      season: json['season'] as int?,
      number: json['number'] as int?,
      summary: json['summary'] as String?,
      images: (json['images'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$_EpisodeToJson(_$_Episode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'season': instance.season,
      'number': instance.number,
      'summary': instance.summary,
      'images': instance.images,
    };
