import 'package:freezed_annotation/freezed_annotation.dart';

part 'ra_keypair.freezed.dart';
part 'ra_keypair.g.dart';

@freezed
abstract class RaKeypair with _$RaKeypair {
  const RaKeypair._();

  factory RaKeypair({
    required String private,
    required String address,
    required String public,
    required String recoveryPrivate,
    required String recoveryAddress,
    required String recoveryPublic,
    required String restoreCode,
  }) = _RaKeypair;

  factory RaKeypair.fromJson(Map<String, dynamic> json) => _$RaKeypairFromJson(json);

  String get privateCorrected {
    return "00$private";
  }

  String get recoveryPrivateCorrected {
    return "00$recoveryPrivate";
  }
}
