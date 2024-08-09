import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:rbx_wallet/features/btc/models/btc_utxo.dart';

part 'btc_transaction.freezed.dart';
part 'btc_transaction.g.dart';

enum BTCTransactionType {
  send,
  recieve,
  replaced,
  multiSigSend,
  sameWalletTx,
  ;
}

BTCTransactionType txTypeFromJson(int value) {
  return BTCTransactionType.values[value];
}

@freezed
class BtcTransaction with _$BtcTransaction {
  const BtcTransaction._();

  factory BtcTransaction({
    @JsonKey(name: "Hash") required String hash,
    @JsonKey(name: "ToAddress") required String toAddress,
    @JsonKey(name: "FromAddress") required String fromAddress,
    @JsonKey(name: "Amount") required double amount,
    @JsonKey(name: "Fee") required double fee,
    @JsonKey(name: "Timestamp") required int timestamp,
    @JsonKey(name: "Signature") required String signature,
    @JsonKey(name: "TransactionType", fromJson: txTypeFromJson) required BTCTransactionType type,
    @JsonKey(name: "FeeRate") required int feeRate,
    @JsonKey(name: "ConfirmedHeight") required int confirmedHeight,
    @JsonKey(name: "IsConfirmed") required bool isConfirmed,
    @JsonKey(name: "BitcoinUTXOs") @Default([]) List<BtcUtxo> utxos,
  }) = _BtcTransaction;

  factory BtcTransaction.fromJson(Map<String, dynamic> json) => _$BtcTransactionFromJson(json);

  String get parseTimeStamp {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d12 = DateFormat('MM-dd-yyyy hh:mm a').format(date);
    return d12;
  }

  String get typeLabel {
    switch (type) {
      case BTCTransactionType.send:
        return "Send";

      case BTCTransactionType.recieve:
        return "Receive";

      case BTCTransactionType.replaced:
        return "Replace";

      case BTCTransactionType.multiSigSend:
        return "Multi-signature";

      case BTCTransactionType.sameWalletTx:
        return "Same Wallet TX";
    }
  }
}
