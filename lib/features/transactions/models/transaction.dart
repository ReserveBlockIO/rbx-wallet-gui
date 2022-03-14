import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const Transaction._();

  factory Transaction({
    @JsonKey(name: 'Hash') required String hash,
    @JsonKey(name: 'ToAddress') required String toAddress,
    @JsonKey(name: 'FromAddress') required String fromAddress,
    @JsonKey(name: 'Amount') required double amount,
    @JsonKey(name: 'Nonce') required int nonce,
    @JsonKey(name: 'Fee') required double fee,
    @JsonKey(name: 'Timestamp') required int timestamp,
    @JsonKey(name: 'NFTData') required dynamic nftData,
    @JsonKey(name: 'Signature') String? signature,
    @JsonKey(name: 'Height') required int height,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  String get parseTimeStamp {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d12 = DateFormat('MM-dd-yyyy hh:mm a').format(date);
    return d12;
  }
}
