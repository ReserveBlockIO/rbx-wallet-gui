import 'package:freezed_annotation/freezed_annotation.dart';

part 'compiler_payload.freezed.dart';
part 'compiler_payload.g.dart';

@freezed
abstract class CompilerPayload with _$CompilerPayload {
  const CompilerPayload._();

  factory CompilerPayload({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Features", defaultValue: [])
        required List<Map<String, dynamic>> features,
  }) = _CompilerPayload;

  factory CompilerPayload.fromJson(Map<String, dynamic> json) =>
      _$CompilerPayloadFromJson(json);
}
