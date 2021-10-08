import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_image.freezed.dart';
part 'media_image.g.dart';

@freezed
@JsonSerializable()
abstract class MediaImage with _$MediaImage {
  const factory MediaImage({
    required String? original,
    required String? medium,
  }) = _MediaImage;
  @override
  factory MediaImage.fromJson(Map<String, dynamic> json) =>
      _$MediaImageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MediaImageToJson(this);
}
