import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../web/models/web_recovery_details.dart';
import 'transaction.dart';

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
    @JsonKey(name: 'unlock_time') DateTime? unlockTime,
    @Default(false) bool isPending,
    // required int nonce,
    // required int timestamp,
    String? data,
    // required String signature,
    required int height,
    @JsonKey(name: "callback_details") WebTransaction? callbackDetails,
    @JsonKey(name: "recovery_details") WebRecoveryDetails? recoveryDetails,
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

  List<dynamic>? get subTxs {
    if (nftDataValue('Function') == "Sale_Complete()") {
      if (nftDataValue('Transactions') != null) {
        return nftDataValueList('Transactions');
      }
    }

    return null;
  }

  double? get subTxAmount {
    if (subTxs != null) {
      double amount = 0;
      for (final s in subTxs!) {
        amount += s['Amount'];
      }
      return amount;
    }

    return null;
  }

  String? get callbackHash {
    if (type != 10) {
      return null;
    }

    if (nftDataValue('Function') == "CallBack()") {
      return nftDataValue("Hash");
    }

    return null;
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
        if (nftDataValue('Function') == "Transfer()") {
          return "NFT Transfer";
        } else if (["ChangeEvolveStateSpecific()", "Evolve()", "Devolve()"].contains(nftDataValue('Function'))) {
          return "NFT Evolution";
        }

        return "NFT Tx";

      case 4:
        return "NFT Burn";
      case 5:
        if (nftDataValue('Function') == "Sale_Start()") {
          return "NFT Sale (Start)";
        } else if (nftDataValue('Function') == "Sale_Complete()") {
          return "NFT Sale (Complete)";
        }

        return "NFT Sale";

      case 6:
        if (nftDataValue('Function') == "AdnrCreate()") {
          return "VFX Domain (Create)";
        } else if (nftDataValue('Function') == "AdnrTransfer()") {
          return "VFX Domain (Transfer)";
        } else if (nftDataValue('Function') == "AdnrDelete()") {
          return "VFX Domain (Delete)";
        }

        return "Address";
      case 7:
        if (nftDataValue('Function') == "DecShopCreate()") {
          return "P2P Auction House (Create)";
        } else if (nftDataValue('Function') == "DecShopUpdate()") {
          return "P2P Auction House (Update)";
        } else if (nftDataValue('Function') == "DecShopDelete()") {
          return "P2P Auction House (Delete)";
        }
        return "DST Registration";
      case 8:
        return "Topic Create";
      case 9:
        return "Topic Vote";

      case 10:
        if (nftDataValue('Function') == "CallBack()") {
          return "Vault (Callback)";
        } else if (nftDataValue('Function') == "Register()") {
          return "Vault (Register)";
        } else if (nftDataValue('Function') == "Recover()") {
          return "Vault (Recover)";
        }
        return "Vault";
      case 11:
        return "Smart Contract Mint";
      case 12:
        return "Smart Contract TX";
      case 13:
        return "Smart Contract Burn";
      case 14:
        return "Fungible Token Mint";
      case 15:
        return "Fungible Token TX";
      case 16:
        return "Fungible Token Burn";
      case 17:
        if (data != null) {
          if (nftDataValue('Function') == "TokenDeploy()") {
            return "Fungible Token Deploy";
          }
        }

        return "Tokenization Mint";
      case 18:
        return "Tokenization TX";
      case 19:
        return "Tokenization Burn";
      case 20:
        return "Tokenization Withdrawl";
      case 21:
        return "Tokenization Withdrawl";
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

  List<dynamic>? nftDataValueList(String key) {
    final d = parseNftData();
    if (d == null) {
      return null;
    }

    return d.containsKey(key) && d[key] is List ? d[key] as List<dynamic> : null;
  }

  bool get isPendingSettlement {
    if (unlockTime == null) {
      return false;
    }

    return unlockTime!.isAfter(DateTime.now());
  }
}
