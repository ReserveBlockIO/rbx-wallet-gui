import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'btc_transaction.freezed.dart';
part 'btc_transaction.g.dart';

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
    @JsonKey(name: "TransactionType") required int type,
    @JsonKey(name: "FeeRate") required int feeRate,
  }) = _BtcTransaction;

  factory BtcTransaction.fromJson(Map<String, dynamic> json) => _$BtcTransactionFromJson(json);

  String get parseTimeStamp {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d12 = DateFormat('MM-dd-yyyy hh:mm a').format(date);
    return d12;
  }
}
