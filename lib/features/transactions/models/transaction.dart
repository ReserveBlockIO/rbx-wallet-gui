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
    @JsonKey(name: 'TransactionType') required int type,
    @JsonKey(name: 'Amount') required double amount,
    @JsonKey(name: 'Nonce') required int nonce,
    @JsonKey(name: 'Fee') required double fee,
    @JsonKey(name: 'Timestamp') required int timestamp,
    @JsonKey(name: 'Data') required dynamic nftData,
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

  String get typeLabel {
    switch (type) {
      case 0:
        return "Tx";
      case 1:
        return "Node";
      case 2:
        return "NFT Mint";
      case 3:
        return "NFT Tx";
      case 4:
        return "NFT Burn";
      case 5:
        return "NFT Sale";
      case 6:
        return "Address";
      case 7:
        return "DST Registration";
      default:
        return "-";
    }
  }
}
