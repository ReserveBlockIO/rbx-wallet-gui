import 'package:freezed_annotation/freezed_annotation.dart';

import '../../asset/asset.dart';

part 'compiler_payload.freezed.dart';
part 'compiler_payload.g.dart';

@freezed
abstract class CompilerPayload with _$CompilerPayload {
  const CompilerPayload._();

  @JsonSerializable(explicitToJson: true)
  factory CompilerPayload({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "MinterName") required String minterName,
    @JsonKey(name: "Description") required String description,
    @JsonKey(name: "SmartContractAsset") required Asset asset,
    @JsonKey(name: "IsPublic", defaultValue: true) required bool isPublic,
    @JsonKey(name: "SmartContractUID", includeToJson: false) String? uuid,
    @JsonKey(name: "Features") List<Map<String, dynamic>>? features,
    @JsonKey(name: "MinterAddress") required String minterAddress,
    @JsonKey(name: "IsMinter") required bool isMinter,
    @JsonKey(name: "Properties") Map<String, String>? properties,
    @JsonKey(includeToJson: false) required String hash,
  }) = _CompilerPayload;

  factory CompilerPayload.fromJson(Map<String, dynamic> json) => _$CompilerPayloadFromJson(json);
}
