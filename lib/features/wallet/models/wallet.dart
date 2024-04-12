import 'package:freezed_annotation/freezed_annotation.dart';

import '../../keygen/models/keypair.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  const Wallet._();

  factory Wallet({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'PublicKey') required String publicKey,
    @JsonKey(name: 'GetKey') String? privateKey,
    @JsonKey(name: 'Address') required String address,
    String? friendlyName,
    @JsonKey(name: 'Balance') required double balance,
    @JsonKey(name: 'IsValidating') required bool isValidating,
    // @JsonKey(name: 'IsEncrypted') required bool isEncrypted,
    @JsonKey(name: "ADNR") String? adnr,
    @JsonKey(name: "RecoveryAddress") String? recoveryAddress,
    @JsonKey(name: "RecoveryPrivateKey") String? recoveryPrivateKey,
    @JsonKey(name: "RecoveryEncryptedDecryptKey")
        String? recoveryEncryptedDecryptKey,
    @JsonKey(name: "EncryptedDecryptKey") String? encryptedDecryptKey,
    @JsonKey(name: "AvailableBalance") @Default(0.0) double availableBalance,
    @JsonKey(name: "LockedBalance") @Default(0.0) double lockedBalance,
    @JsonKey(name: "TotalBalance") @Default(0.0) double totalBalance,
    @JsonKey(name: "IsNetworkProtected")
    @Default(false)
        bool isNetworkProtected,
    String? btcWif,

    // @Default(false) bool adnrPending,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  factory Wallet.fromWebWallet({
    required Keypair keypair,
    required double balance,
  }) {
    return Wallet(
      address: keypair.address,
      balance: balance,
      id: 0,
      publicKey: keypair.public,
      privateKey: keypair.private,
      // isEncrypted: false,
      isValidating: false,
    );
  }

  bool get isReserved {
    return recoveryAddress != null;
  }

  String get balanceLabel {
    if (isReserved) {
      return "Available: $availableBalance VFX";
    }

    return "$balance VFX";
  }

  String get label {
    if (friendlyName != null) {
      return friendlyName!;
    }

    final start = address.substring(0, 5);
    final end = address.substring(address.length - 5, address.length);

    return "${adnr != null ? '@$adnr | ' : ''}$start.....$end";
  }

  String get labelWithoutTruncation {
    if (friendlyName != null) {
      return friendlyName!;
    }

    return address;
  }

  String get fullLabel {
    String value = address;
    if (friendlyName != null) {
      value = "$value [$friendlyName]";
    }

    return value;
  }
}
