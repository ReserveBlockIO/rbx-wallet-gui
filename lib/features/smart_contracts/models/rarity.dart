import 'package:freezed_annotation/freezed_annotation.dart';

part 'rarity.freezed.dart';

@freezed
class Rarity with _$Rarity {
  const Rarity._();

  factory Rarity({
    @Default("") String name,
    @Default(1) double weight,
    @Default("") String description,
  }) = _Rarity;

  String get percentLabel {
    return "${(weight * 100)}%".replaceAll(".0%", "%");
  }
}
