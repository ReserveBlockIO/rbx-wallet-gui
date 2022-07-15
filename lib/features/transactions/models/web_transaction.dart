import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'web_transaction.freezed.dart';
part 'web_transaction.g.dart';

double? stringToDouble(String val) => double.tryParse(val);

@freezed
class WebTransaction with _$WebTransaction {
  const WebTransaction._();

  factory WebTransaction({
    required String hash,
    @JsonKey(name: 'to_address') required String toAddress,
    @JsonKey(name: 'from_address') required String fromAddress,
    @JsonKey(name: 'transaction_type') required int type,
    @JsonKey(fromJson: stringToDouble) required double? amount,
    @JsonKey(fromJson: stringToDouble) required double? fee,
    required int nonce,
    required int timestamp,
    // @JsonKey(name: 'nft_data') dynamic nftData,
    required String signature,
    required int height,
  }) = _WebTransaction;

  factory WebTransaction.fromJson(Map<String, dynamic> json) => _$WebTransactionFromJson(json);

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
