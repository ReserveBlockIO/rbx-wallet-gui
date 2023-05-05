import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';

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
    required int type,
    @JsonKey(name: "total_amount") required double? amount,
    @JsonKey(name: "total_fee") required double? fee,
    @JsonKey(name: 'date_crafted') required DateTime date,
    // required int nonce,
    // required int timestamp,
    String? data,
    // required String signature,
    required int height,
  }) = _WebTransaction;

  factory WebTransaction.fromJson(Map<String, dynamic> json) => _$WebTransactionFromJson(json);

  Transaction toNative() {
    return Transaction(
      hash: hash,
      toAddress: toAddress,
      fromAddress: fromAddress,
      type: type,
      amount: amount ?? 0,
      nonce: 0,
      fee: fee ?? 0,
      timestamp: (date.millisecondsSinceEpoch / 1000).round(),
      nftData: data,
      height: height,
    );
  }

  String get parseTimeStamp {
    //TODO: fix this;
    return "-";
    // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    // var d12 = DateFormat('MM-dd-yyyy hh:mm a').format(date);
    // return d12;
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

  Map<String, dynamic>? parseNftData() {
    try {
      if (data == null) {
        return null;
      }

      final d = jsonDecode(data!);
      if (d is Map) {
        return d as Map<String, dynamic>;
      }

      if (d == null || d.isEmpty) {
        return null;
      }

      if (d[0] == null) {
        return null;
      }

      final Map<String, dynamic> response = d[0];

      return response;
    } catch (e, st) {
      print("Problem parsing NFT data on TX $hash");
      print(e);
      print(st);
      return null;
    }
  }

  String? nftDataValue(String key) {
    final d = parseNftData();
    if (d == null) {
      return null;
    }

    return d.containsKey(key) ? d[key].toString() : null;
  }

  double? nftDataValueDouble(String key) {
    final d = parseNftData();
    if (d == null) {
      return null;
    }

    return d.containsKey(key) && d[key] is num ? d[key] as double : null;
  }
}
