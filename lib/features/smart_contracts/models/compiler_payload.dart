import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/asset/asset.dart';

part 'compiler_payload.freezed.dart';
part 'compiler_payload.g.dart';

@freezed
abstract class CompilerPayload with _$CompilerPayload {
  const CompilerPayload._();

  @JsonSerializable(explicitToJson: true)
  factory CompilerPayload({
    @JsonKey(name: "Name")
        required String name,
    @JsonKey(name: "Description")
        required String description,
    @JsonKey(name: "Address")
        required String address,
    @JsonKey(name: "SmartContractAsset")
        required Asset asset,
    @JsonKey(name: "IsPublic", defaultValue: true)
        required bool isPublic,
    @JsonKey(
      name: "SmartContractUID",
    )
        String? uuid,
    @JsonKey(name: "Signature")
        String? signature,
    @JsonKey(name: "Features")
        List<Map<String, dynamic>>? features,
  }) = _CompilerPayload;

  factory CompilerPayload.fromJson(Map<String, dynamic> json) =>
      _$CompilerPayloadFromJson(json);
}
