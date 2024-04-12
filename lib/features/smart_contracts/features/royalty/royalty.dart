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

  static const int compilerEnum = 1;

  const factory Royalty({
    @Default("") String id,
    @Default(RoyaltyType.percent) RoyaltyType type,
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
        return "$amount VFX";
    }
  }

  static List<RoyaltyType> allTypes() {
    return [RoyaltyType.percent, RoyaltyType.fixed];
  }

  static String typeToString(RoyaltyType type) {
    switch (type) {
      case RoyaltyType.fixed:
        return "Flat";
      case RoyaltyType.percent:
        return "Percent";
    }
  }

  static int typeToInt(RoyaltyType type) {
    switch (type) {
      case RoyaltyType.fixed:
        return 0;
      case RoyaltyType.percent:
        return 1;
    }
  }

  static RoyaltyType intToType(int val) {
    switch (val) {
      case 0:
        return RoyaltyType.fixed;
      case 1:
      default:
        return RoyaltyType.percent;
    }
  }

  factory Royalty.fromJson(Map<String, dynamic> json) =>
      _$RoyaltyFromJson(json);

  factory Royalty.fromCompiler(dynamic json) {
    return Royalty(
      amount: json['RoyaltyAmount'],
      address: json['RoyaltyPayToAddress'],
      type: intToType(json['RoyaltyType']),
    );
  }

  Map<String, dynamic> serializeForCompiler() {
    return {
      'RoyaltyAmount': amount,
      'RoyaltyPayToAddress': address,
      'RoyaltyType': typeToInt(type),
    };
  }
}
