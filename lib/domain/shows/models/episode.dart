import 'package:freezed_annotation/freezed_annotation.dart';

import 'media_image.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
@JsonSerializable()
abstract class Episode with _$Episode {
  const factory Episode(
      {required int? id,
      required String? url,
      required String? name,
      required int? season,
      required int? number,
      //HTML format
      required String? summary,
      required MediaImage? image}) = _Episode;
  @override
  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
