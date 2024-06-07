import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@freezed
@HiveType(typeId: 1)
abstract class Media with _$Media {
  const factory Media({
    @HiveField(0)
    required String mediaUrl,
    @HiveField(1)
    required String mediaType,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
