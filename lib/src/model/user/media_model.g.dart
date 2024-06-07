// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaAdapter extends TypeAdapter<Media> {
  @override
  final int typeId = 1;

  @override
  Media read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Media(
      mediaUrl: fields[0] as String,
      mediaType: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Media obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mediaUrl)
      ..writeByte(1)
      ..write(obj.mediaType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      mediaUrl: json['mediaUrl'] as String,
      mediaType: json['mediaType'] as String,
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'mediaUrl': instance.mediaUrl,
      'mediaType': instance.mediaType,
    };
