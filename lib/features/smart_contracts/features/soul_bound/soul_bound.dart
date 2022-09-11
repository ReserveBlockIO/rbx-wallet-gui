import 'package:freezed_annotation/freezed_annotation.dart';

part 'soul_bound.freezed.dart';
part 'soul_bound.g.dart';

@freezed
class SoulBound with _$SoulBound {
  const SoulBound._();

  static const int compilerEnum = 1;

  const factory SoulBound({
    @Default("") String id,
    @Default(0) double amount,
    @Default("") String ownerAddress,
    String? beneficiaryAddress,
  }) = _SoulBound;

  factory SoulBound.fromJson(Map<String, dynamic> json) => _$SoulBoundFromJson(json);

  // factory Royalty.fromCompiler(dynamic json) {
  //   return Royalty(
  //     amount: json['RoyaltyAmount'],
  //     address: json['RoyaltyPayToAddress'],
  //     type: intToType(json['RoyaltyType']),
  //   );
  // }

  // Map<String, dynamic> serializeForCompiler() {
  //   return {
  //     'RoyaltyAmount': amount,
  //     'RoyaltyPayToAddress': address,
  //     'RoyaltyType': typeToInt(type),
  //   };
  // }
}
