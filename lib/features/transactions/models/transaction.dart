import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import '../../../core/utils.dart';

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
    @JsonKey(name: 'UnlockTime') int? unlockTime,
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
        final data = parseNftData(this);
        if (data != null) {
          if (nftDataValue(data, 'Function') == "TokenDeploy()") {
            return "NFT Mint (Tokenized)";
          }
        }
        return "NFT Mint";
      case 3:
        final data = parseNftData(this);
        if (data != null) {
          if (nftDataValue(data, 'Function') == "Transfer()") {
            return "NFT Transfer";
          }
        }

        return "NFT Tx";
      case 4:
        return "NFT Burn";
      case 5:
        final data = parseNftData(this);
        if (data != null) {
          if (nftDataValue(data, 'Function') == "Sale_Start()") {
            return "NFT Sale Start";
          } else if (nftDataValue(data, 'Function') == "M_Sale_Start()") {
            return "NFT Sale Start (Manual)";
          } else if (nftDataValue(data, 'Function') == "Sale_Complete()") {
            return "NFT Sale Complete";
          } else if (nftDataValue(data, 'Function') == "M_Sale_Complete()") {
            return "NFT Sale Complete (Manual)";
          }
        }
        return "NFT Sale";
      case 6:
        final data = parseNftData(this);
        if (data != null) {
          if (nftDataValue(data, "Function") == "AdnrCreate()") {
            return "ADNR Create";
          }
          if (nftDataValue(data, "Function") == "AdnrTransfer()") {
            return "ADNR Transfer";
          }

          if (nftDataValue(data, "Function") == "AdnrDelete()") {
            return "ADNR Delete";
          }

          if (nftDataValue(data, "Function") == "BTCAdnrCreate()") {
            return "BTC ADNR Create";
          }
          if (nftDataValue(data, "Function") == "BTCAdnrTransfer()") {
            return "BTC ADNR Transfer";
          }

          if (nftDataValue(data, "Function") == "BTCAdnrDelete()") {
            return "BTC ADNR Delete";
          }
        }
        return "ADNR";
      case 7:
        return "DST Registration";
      case 8:
        return "Topic Create";
      case 9:
        return "Topic Vote";
      case 10:
        final data = parseNftData(this);
        if (data != null) {
          if (nftDataValue(data, 'Function') == "CallBack()") {
            return "Reserve (Callback)";
          } else if (nftDataValue(data, 'Function') == "Register()") {
            return "Reserve (Register)";
          } else if (nftDataValue(data, 'Function') == "Recover()") {
            return "Reserve (Recover)";
          }
        }
        return "Reserve";
      case 11:
        return "Smart Contract Mint";
      case 12:
        return "Smart Contract TX";
      case 13:
        return "Smart Contract Burn";
      case 14:
        return "Fungible Token Mint";
      case 15:
        final data = parseNftData(this);
        if (data != null) {
          final amount = nftDataValue(data, 'Amount');
          final ticker = nftDataValue(data, 'TokenTicker');
          if (nftDataValue(data, 'Function') == "TokenMint()") {
            return "Fungible Token Mint${amount != null ? ' ($amount${ticker != null ? ' $ticker' : ''})' : ''}";
          }
          if (nftDataValue(data, 'Function') == "TokenBurn()") {
            return "Fungible Token Burn${amount != null ? ' ($amount${ticker != null ? ' $ticker' : ''})' : ''}";
          }

          if (nftDataValue(data, 'Function') == "TokenTransfer()") {
            return "Fungible Token Transfer${amount != null ? ' ($amount${ticker != null ? ' $ticker' : ''})' : ''}";
          }

          if (nftDataValue(data, 'Function') == "TokenBurn()") {
            return "Fungible Token Burn${amount != null ? ' ($amount${ticker != null ? ' $ticker' : ''})' : ''}";
          }

          if (nftDataValue(data, 'Function') == "TokenContractOwnerChange()") {
            return "Fungible Token Ownership Change${ticker != null ? ' ($ticker)' : ''}";
          }
          if (nftDataValue(data, 'Function') == "TokenPause()") {
            final isPause = nftDataValue(data, 'Pause') == "true";
            return "Fungible Token ${isPause ? 'Pause' : 'Resume'}${ticker != null ? ' ($ticker)' : ''}";
          }

          if (nftDataValue(data, 'Function') == "TokenBanAddress()") {
            return "Fungible Token Ban Address${ticker != null ? ' ($ticker)' : ''}";
          }

          if (nftDataValue(data, 'Function') == "TokenVoteTopicCast()") {
            return "Fungible Token Vote Cast${ticker != null ? ' ($ticker)' : ''}";
          }
          if (nftDataValue(data, 'Function') == "TokenVoteTopicCreate()") {
            return "Fungible Token Topic Created${ticker != null ? ' ($ticker)' : ''}";
          }
        }

        return "Fungible Token TX";

      case 16:
        final data = parseNftData(this);
        if (data != null) {
          final amount = nftDataValue(data, 'Amount');
          final ticker = nftDataValue(data, 'TokenTicker');
          if (nftDataValue(data, 'Function') == "TokenBurn()") {
            return "Fungible Token Burn${amount != null ? ' ($amount${ticker != null ? ' $ticker' : ''})' : ''}";
          }
        }
        return "Fungible Token Burn";
      case 17:
        final data = parseNftData(this);
        if (data != null) {
          if (nftDataValue(data, 'Function') == "TokenDeploy()") {
            return "Fungible Token Deploy";
          }
        }
        return "Tokenization Mint";
      case 18:
        final data = parseNftData(this);
        if (data != null) {
          final function = nftDataValue(data, 'Function');
          final amount = nftDataValue(data, 'Amount');
          if (function == "TransferCoin()") {
            return "vBTC Transfer Coin ($amount vBTC)";
          }

          if (function == "Transfer()") {
            return "vBTC Token Ownership Transfer";
          }
        }
        return "Tokenization TX";

      case 19:
        return "Tokenization Burn";
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

  DateTime? get unlockTimeAsDate {
    if (unlockTime == null) {
      return null;
    }
    if (status != TransactionStatus.Reserved) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(unlockTime! * 1000);
  }

  DateTime? get callbackUntil {
    if (unlockTime == null) {
      return null;
    }
    if (status != TransactionStatus.Reserved) {
      return null;
    }

    final now = DateTime.now();

    if (unlockTimeAsDate!.isBefore(now)) {
      return null;
    }

    return unlockTimeAsDate;
  }

  String get parseUnlockTimeAsDate {
    if (unlockTime == null) {
      return "-";
    }
    if (status != TransactionStatus.Reserved) {
      return "-";
    }

    var date = DateTime.fromMillisecondsSinceEpoch(unlockTime! * 1000);
    var d12 = DateFormat('MM-dd-yyyy hh:mm a').format(date);
    return d12;
  }

  bool get isFromReserveAccount {
    return fromAddress.startsWith("xRBX");
  }

  bool get isToReserveAccount {
    return toAddress.startsWith("xRBX");
  }
}
