import 'package:freezed_annotation/freezed_annotation.dart';

import '../../asset/asset.dart';
import 'property.dart';

part 'pair.freezed.dart';
part 'pair.g.dart';

@freezed
class Pair with _$Pair {
  const Pair._();

  static const int compilerEnum = 113; //TODO

  @JsonSerializable(explicitToJson: true)
  const factory Pair({
    @Default("") String id,
    @Default("VFX") String network,
    @Default("") String nftAddress,
    @Default("") String description,
    @Default("") String reason,
    @Default("") String metadataUrl,
    Asset? provenance,
    @Default([]) List<Property> properties,
  }) = _Pair;

  factory Pair.fromJson(Map<String, dynamic> json) => _$PairFromJson(json);

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
