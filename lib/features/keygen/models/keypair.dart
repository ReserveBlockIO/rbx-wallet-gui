import 'package:freezed_annotation/freezed_annotation.dart';

part 'keypair.freezed.dart';
part 'keypair.g.dart';

@freezed
abstract class Keypair with _$Keypair {
  const Keypair._();

  factory Keypair({
    required String private,
    required String public,
    required String publicInflated,
    String? email,
    // @JsonKey(toJson: null) ECPrivateKey? ecPrivateKey,
    String? mneumonic,
  }) = _Keypair;

  factory Keypair.fromJson(Map<String, dynamic> json) => _$KeypairFromJson(json);

  String get privateCorrected {
    return private;

    // return private;

    // return private;

    // return "00$private";

    // final b = BigInt.parse(private, radix: 16).toSigned(1);
    // if (b.isNegative) {
    //   return "00$private";
    // }

    // final start = private.substring(0, 1);
    // if (start.contains(RegExp(r'[a-z]'))) {
    //   return "00$private";
    // }
    // return private;
  }
}
