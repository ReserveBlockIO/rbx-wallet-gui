import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokenize.freezed.dart';
part 'tokenize.g.dart';

@freezed
class Tokenize with _$Tokenize {
  const Tokenize._();

  static const int compilerEnum = 3;

  @JsonSerializable(explicitToJson: true)
  const factory Tokenize({
    @JsonKey(name: "AssetName") required String assetName,
    @JsonKey(name: "AssetTicker") required String assetTicker,
    @JsonKey(name: "KeyRevealed") @Default(false) bool keyRevealed,
    @JsonKey(name: "KeyRevealedRequestHash") String? keyRevealedRequestHash,
    @JsonKey(name: "ImageBase") String? imageBase,
  }) = _Tokenize;

  factory Tokenize.fromJson(Map<String, dynamic> json) => _$TokenizeFromJson(json);
}
