import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';

@freezed
class Lang with _$Lang {
  const factory Lang({
    required String title,
    required String lang,
    required String code,
    required String avatar,
    @Default(false) bool available,
  }) = _Lang;
}
