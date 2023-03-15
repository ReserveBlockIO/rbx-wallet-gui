import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

enum TransactionStatus {
  Pending,
  Success,
  Fail,
  Reserved,
  CalledBack,
  Recovered,
}

statusFromJson(int? status) {
  if (status == null) return null;
  return TransactionStatus.values[status];
}

@freezed
class Transaction with _$Transaction {
  const Transaction._();

  factory Transaction({
    @JsonKey(name: 'Hash') required String hash,
    @JsonKey(name: 'ToAddress') required String toAddress,
    @JsonKey(name: 'FromAddress') required String fromAddress,
    @JsonKey(name: 'TransactionType') required int type,
    @JsonKey(name: 'TransactionStatus', fromJson: statusFromJson) TransactionStatus? status,
    @JsonKey(name: 'Amount') required double amount,
    @JsonKey(name: 'Nonce') required int nonce,
    @JsonKey(name: 'Fee') required double fee,
    @JsonKey(name: 'Timestamp') required int timestamp,
    @JsonKey(name: 'Data') required dynamic nftData,
    @JsonKey(name: 'Signature') String? signature,
    @JsonKey(name: 'Height') required int height,
    @JsonKey(name: 'UnlockTime') double? unlockTime,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

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
        return "ADNR";
      case 7:
        return "DST Registration";
      case 8:
        return "Topic Create";
      case 9:
        return "Topic Vote";
      case 10:
        return "Reserve";
      default:
        return type.toString();
    }
  }

  String get statusLabel {
    switch (status) {
      case TransactionStatus.Success:
        return "Success";
      case TransactionStatus.Pending:
        return "Pending";
      case TransactionStatus.Fail:
        return "Fail";
      case TransactionStatus.Reserved:
        return "Reserved";
      case TransactionStatus.CalledBack:
        return "Called Back";
      case TransactionStatus.Recovered:
        return "Recovered";
      default:
        return "-";
    }
  }

  Color statusColor(BuildContext context) {
    switch (status) {
      case TransactionStatus.Success:
        return Theme.of(context).colorScheme.success;
      case TransactionStatus.Pending:
        return Theme.of(context).colorScheme.warning;

      case TransactionStatus.Fail:
        return Theme.of(context).colorScheme.danger;
      case TransactionStatus.Reserved:
      case TransactionStatus.CalledBack:
      case TransactionStatus.Recovered:
        return Colors.deepPurple.shade200;
      default:
        return Colors.white;
    }
  }

  Uri get explorerUrl {
    return Uri.parse("${Env.explorerWebsiteBaseUrl}/transaction/$hash");
  }
}
