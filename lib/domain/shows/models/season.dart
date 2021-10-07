import 'package:freezed_annotation/freezed_annotation.dart';
part 'season.freezed.dart';
part 'season.g.dart';

@freezed
@JsonSerializable()
abstract class Season with _$Season {
  const factory Season({
    required int? id,
    required String? url,
    required String? name,
    required int? number,
  }) = _Season;
  @override
  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
