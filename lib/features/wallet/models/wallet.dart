import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  const Wallet._();

  factory Wallet({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'PublicKey') required String publicKey,
    @JsonKey(name: 'PrivateKey') required String privateKey,
    @JsonKey(name: 'Address') required String address,
    String? friendlyName,
    @JsonKey(name: 'Balance') required double balance,
    @JsonKey(name: 'IsValidating') required bool isValidating,
    @JsonKey(name: 'IsEncrypted') required bool isEncrypted,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  String get label {
    if (friendlyName != null) {
      return friendlyName!;
    }

    final start = address.substring(0, 5);
    final end = address.substring(address.length - 5, address.length);

    return "$start.....$end";
  }

  String get labelWithoutTruncation {
    if (friendlyName != null) {
      return friendlyName!;
    }

    return address;
  }
}
