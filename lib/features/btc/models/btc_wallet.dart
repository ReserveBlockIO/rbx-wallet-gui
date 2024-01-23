import 'package:freezed_annotation/freezed_annotation.dart';

part 'btc_wallet.freezed.dart';
part 'btc_wallet.g.dart';

@freezed
class BtcWallet with _$BtcWallet {
  const BtcWallet._();

  factory BtcWallet({
    required String privateKey,
    required String publicKey,
    required String address,
  }) = _BtcWallet;

  factory BtcWallet.fromJson(Map<String, dynamic> json) => _$BtcWalletFromJson(json);

  String get label {
    final start = address.substring(0, 5);
    final end = address.substring(address.length - 5, address.length);
    return "$start.....$end";
  }
}
