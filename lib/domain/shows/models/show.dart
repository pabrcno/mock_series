import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mock_series/domain/shows/models/show_schedule.dart';

part 'show.freezed.dart';
part 'show.g.dart';

@freezed
@JsonSerializable()
abstract class Show with _$Show {
  const factory Show(
      {required int id,
      required String url,
      required String name,
      required String language,
      required List<String> genres,
      String? premiered,
      required ShowSchedule schedule,
      //HTML format
      required String summary,
      required Map<String, String> image}) = _Show;

  @override
  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ShowToJson(this);
}
