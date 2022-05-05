import 'package:freezed_annotation/freezed_annotation.dart';

part 'royalty.freezed.dart';
part 'royalty.g.dart';

enum RoyaltyType {
  percent,
  fixed,
}

@freezed
class Royalty with _$Royalty {
  const Royalty._();

  const factory Royalty({
    @Default("") String id,
    @Default(RoyaltyType.fixed) RoyaltyType type,
    @Default(0) double amount,
    @Default("") String address,
  }) = _Royalty;

  String get typeLabel {
    return typeToString(type);
  }

  String get amountWithSuffix {
    switch (type) {
      case RoyaltyType.percent:
        return "${amount * 100}%";
      case RoyaltyType.fixed:
        return "$amount RBX";
    }
  }

  static List<RoyaltyType> allTypes() {
    return [RoyaltyType.percent, RoyaltyType.fixed];
  }

  static typeToString(RoyaltyType type) {
    switch (type) {
      case RoyaltyType.fixed:
        return "Fixed";
      case RoyaltyType.percent:
        return "Percent";
    }
  }

  factory Royalty.fromJson(Map<String, dynamic> json) =>
      _$RoyaltyFromJson(json);
}
