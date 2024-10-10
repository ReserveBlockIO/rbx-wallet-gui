import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../../../core/app_constants.dart';

part 'btc_web_transaction.freezed.dart';
part 'btc_web_transaction.g.dart';

@freezed
class BtcWebTransaction with _$BtcWebTransaction {
  const BtcWebTransaction._();

  factory BtcWebTransaction({
    required String txid,
    required int version,
    required int locktime,
    required List<BtcWebVin> vin,
    required List<BtcWebVout> vout,
    required int size,
    required int weight,
    required int fee,
    required BtcWebTxStatus status,
  }) = _BtcWebTransaction;

  factory BtcWebTransaction.fromJson(Map<String, dynamic> json) => _$BtcWebTransactionFromJson(json);

  // double get totalBtc {
  //   return total * BTC_SATOSHI_MULTIPLIER;
  // }

  // double get feesBtc {
  //   return fees * BTC_SATOSHI_MULTIPLIER;
  // }

  // List<String> otherAddresses(String address) {
  //   return addresses.where((a) => a != address).toList();
  // }

  // String get confirmedLabel {
  //   if (confirmed == null) {
  //     return "-";
  //   }
  //   return DateFormat('MM-dd-yyyy hh:mm a').format(confirmed!);
  // }

  // String get receivedLabel {
  //   if (received == null) {
  //     return "-";
  //   }
  //   return DateFormat('MM-dd-yyyy hh:mm a').format(received!);
  // }
}

@freezed
class BtcWebVin with _$BtcWebVin {
  const factory BtcWebVin({
    required String txid,
    required int vout,
    required BtcWebVout prevout,
    required String scriptsig,
    @JsonKey(name: 'scriptsig_asm') required String scriptsigAsm,
    required List<String> witness,
    @JsonKey(name: 'is_coinbase') required bool isCoinbase,
    required int sequence,
  }) = _BtcWebVin;

  factory BtcWebVin.fromJson(Map<String, dynamic> json) => _$BtcWebVinFromJson(json);
}

@freezed
class BtcWebVout with _$BtcWebVout {
  const factory BtcWebVout({
    required String scriptpubkey,
    @JsonKey(name: 'scriptpubkey_asm') required String scriptpubkeyAsm,
    @JsonKey(name: 'scriptpubkey_type') required String scriptpubkeyType,
    @JsonKey(name: 'scriptpubkey_address') required String scriptpubkeyAddress,
    required int value,
  }) = _BtcWebVout;

  factory BtcWebVout.fromJson(Map<String, dynamic> json) => _$BtcWebVoutFromJson(json);
}

@freezed
class BtcWebTxStatus with _$BtcWebTxStatus {
  const factory BtcWebTxStatus({
    required bool confirmed,
    @JsonKey(name: 'block_height') required int blockHeight,
    @JsonKey(name: 'block_hash') required String blockHash,
    @JsonKey(name: 'block_time') required int blockTime,
  }) = _BtcWebTxStatus;

  factory BtcWebTxStatus.fromJson(Map<String, dynamic> json) => _$BtcWebTxStatusFromJson(json);
}
