import 'package:freezed_annotation/freezed_annotation.dart';

part 'keypair.freezed.dart';
part 'keypair.g.dart';

@freezed
abstract class Keypair with _$Keypair {
  const Keypair._();

  factory Keypair({
    required String private,
    required String public,
    String? mneumonic,
  }) = _Keypair;

  factory Keypair.fromJson(Map<String, dynamic> json) =>
      _$KeypairFromJson(json);
}
