import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../../../core/app_constants.dart';

part 'btc_web_transaction.freezed.dart';
part 'btc_web_transaction.g.dart';

@freezed
class BtcWebTxInput with _$BtcWebTxInput {
  const BtcWebTxInput._();

  factory BtcWebTxInput({
    @JsonKey(name: "prev_hash") required String prevHash,
    @JsonKey(name: "output_index") required int outputIndex,
    @JsonKey(name: "output_value") required int outputValue,
    required int sequence,
    @Default([]) List<String> addresses,
    @JsonKey(name: "script_type") required String scriptType,
    required int age,
    @Default([]) List<String> witness,
  }) = _BtcWebTxInput;

  factory BtcWebTxInput.fromJson(Map<String, dynamic> json) => _$BtcWebTxInputFromJson(json);
}

@freezed
class BtcWebTxOutput with _$BtcWebTxOutput {
  const BtcWebTxOutput._();

  factory BtcWebTxOutput({
    required int value,
    required String script,
    @Default([]) List<String> addresses,
    @JsonKey(name: "script_type") required String scriptType,
  }) = _BtcWebTxOutput;

  factory BtcWebTxOutput.fromJson(Map<String, dynamic> json) => _$BtcWebTxOutputFromJson(json);
}

@freezed
class BtcWebTransaction with _$BtcWebTransaction {
  const BtcWebTransaction._();

  factory BtcWebTransaction({
    @JsonKey(name: "block_hash") String? blockHash,
    @JsonKey(name: "block_height") required int blockHeight,
    required String hash,
    @Default([]) List<String> addresses,
    required int total,
    required int fees,
    @Default(0) int confirmations,
    DateTime? confirmed,
    DateTime? received,
    @JsonKey(name: "relayed_by") String? relayedBy,
    @Default([]) List<BtcWebTxInput> inputs,
    @Default([]) List<BtcWebTxOutput> outputs,
  }) = _BtcWebTransaction;

  factory BtcWebTransaction.fromJson(Map<String, dynamic> json) => _$BtcWebTransactionFromJson(json);

  double get totalBtc {
    return total * BTC_SATOSHI_MULTIPLIER;
  }

  double get feesBtc {
    return fees * BTC_SATOSHI_MULTIPLIER;
  }

  List<String> otherAddresses(String address) {
    return addresses.where((a) => a != address).toList();
  }

  String get confirmedLabel {
    if (confirmed == null) {
      return "-";
    }
    return DateFormat('MM-dd-yyyy hh:mm a').format(confirmed!);
  }

  String get receivedLabel {
    if (received == null) {
      return "-";
    }
    return DateFormat('MM-dd-yyyy hh:mm a').format(received!);
  }
}
