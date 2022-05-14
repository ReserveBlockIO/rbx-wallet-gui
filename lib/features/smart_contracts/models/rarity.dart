import 'package:freezed_annotation/freezed_annotation.dart';

part 'rarity.freezed.dart';
part 'rarity.g.dart';

@freezed
class Rarity with _$Rarity {
  const Rarity._();

  factory Rarity({
    @Default("") String name,
    @Default(1) double weight,
    @Default("") String description,
  }) = _Rarity;

  factory Rarity.fromJson(Map<String, dynamic> json) => _$RarityFromJson(json);

  String get percentLabel {
    return "${(weight * 100)}%".replaceAll(".0%", "%");
  }
}
