import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/smart_contracts/models/property.dart';

part 'fractional.freezed.dart';
part 'fractional.g.dart';

@freezed
class Fractional with _$Fractional {
  const Fractional._();

  static const int compilerEnum = 112; //TODO

  @JsonSerializable(explicitToJson: true)
  const factory Fractional({
    @Default("") String id,
    @Default(0) double creatorRetains,
    @Default(5) double fractionalInterest,
    @Default(false) bool allowVoting,
    @Default("") String votingDescription,
  }) = _Fractional;

  factory Fractional.fromJson(Map<String, dynamic> json) => _$FractionalFromJson(json);

  // factory Fractional.fromCompiler(dynamic json) {
  //   return Fractional(
  //     name: json['Name'],
  //     description: json['Description'],
  //   );
  // }

  // Map<String, dynamic> serializeForCompiler() {
  //   return {
  //     'Name': name,
  //     'Description': description,
  //   };
  // }
}
