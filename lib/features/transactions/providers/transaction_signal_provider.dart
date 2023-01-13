import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../nft/providers/transferred_provider.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../models/transaction.dart';
import '../models/transaction_notification.dart';
import 'transaction_notification_provider.dart';

class TransactionSignalProvider extends StateNotifier<List<Transaction>> {
  final Reader read;

  TransactionSignalProvider(this.read) : super([]);

  List<String> get _addresses {
    return read(walletListProvider).map((w) => w.address).toList();
  }

  bool _hasAddress(String address) {
    return _addresses.firstWhereOrNull((a) => a == address) != null;
  }

  void insert(Transaction transaction) {
    if (state.firstWhereOrNull((t) => t.hash == transaction.hash) == null) {
      state = [...state, transaction];
      _handle(transaction);
    }
  }

  void insertAll(List<Transaction> transactions) {
    for (final t in transactions) {
      insert(t);
    }
  }

  void _handle(Transaction transaction) {
    final isOutgoing = _hasAddress(transaction.fromAddress);
    final isIncoming = _hasAddress(transaction.toAddress);

    switch (transaction.type) {
      case TxType.rbxTransfer:
        _handleFundsTransfer(transaction, isOutgoing: isOutgoing, isIncoming: isIncoming);
        break;
      case TxType.nftMint:
        _handleNftMint(transaction);
        break;
      case TxType.voteTopic:
        _handleVoteTopic(transaction);
        break;
      case TxType.vote:
        _handleVote(transaction);
        break;
      case TxType.adnr:
        _handleAdnr(transaction);
        break;
      case TxType.nftTx:
        _handleNftTx(transaction, isOutgoing: isOutgoing, isIncoming: isIncoming);
        break;
      case TxType.nftBurn:
        _handleNftBurn(transaction);
        break;
    }
  }

  void _handleFundsTransfer(
    Transaction transaction, {
    bool isOutgoing = false,
    bool isIncoming = false,
  }) {
    if (isIncoming) {
      _broadcastNotification(
        TransactionNotification(
          identifier: "${transaction.hash}_incoming",
          transaction: transaction,
          title: "Funds Received",
          body: "${transaction.amount} RBX from ${transaction.fromAddress}",
          icon: Icons.move_to_inbox,
        ),
      );
    }
    if (isOutgoing) {
      _broadcastNotification(
        TransactionNotification(
          identifier: "${transaction.hash}_outgoing",
          transaction: transaction,
          title: "Funds Sent",
          body: "${transaction.amount.toString().replaceAll('-', '')} RBX to ${transaction.toAddress}",
          icon: Icons.outbox,
        ),
      );
    }
  }

  void _handleNftMint(Transaction transaction) {
    String? body;
    final nftData = _parseNftData(transaction);
    if (nftData != null) {
      body = _nftDataValue(nftData, 'ContractUID');
    }
    _broadcastNotification(
      TransactionNotification(identifier: transaction.hash, transaction: transaction, title: "NFT Minted", body: body, icon: Icons.lightbulb_outline),
    );
  }

  void _handleVoteTopic(Transaction transaction) {
    String? body;
    final nftData = _parseNftData(transaction);
    if (nftData != null) {
      final name = _nftDataValue(nftData['Topic'], 'TopicName');
      if (name == null) return;
      body = "Topic $name Created.";
      _broadcastNotification(
        TransactionNotification(identifier: transaction.hash, transaction: transaction, title: "Topic Created", body: body, icon: Icons.how_to_vote),
      );
    }
  }

  void _handleVote(Transaction transaction) {
    String? body;
    final nftData = _parseNftData(transaction);
    if (nftData != null) {
      final topic = _nftDataValue(nftData['Vote'], 'TopicUID');
      if (topic == null) return;
      body = "Vote casted on $topic";
      _broadcastNotification(
        TransactionNotification(identifier: transaction.hash, transaction: transaction, title: "Vote Casted", body: body, icon: Icons.how_to_vote),
      );
    }
  }

  void _handleNftTx(
    Transaction transaction, {
    bool isOutgoing = false,
    bool isIncoming = false,
  }) {
    final nftData = _parseNftData(transaction);

    if (nftData != null) {
      final evoState = _nftDataValue(nftData, "NewEvoState");
      if (evoState != null) {
        _broadcastNotification(
          TransactionNotification(
              identifier: "${transaction.hash}_evolve_$evoState",
              transaction: transaction,
              title: "NFT Evolved",
              body: "NFT evolved to state $evoState.",
              icon: Icons.change_circle),
        );
        return;
      }
    }

    if (isIncoming) {
      if (nftData != null) {
        final id = _nftDataValue(nftData, 'ContractUID');
        if (id != null) {
          read(transferredProvider.notifier).removeId(id);
          print("Removing transfer id of '$id'");
        }
      }

      _broadcastNotification(
        TransactionNotification(
            identifier: "${transaction.hash}_incoming",
            transaction: transaction,
            title: "NFT Received",
            body: "NFT from ${transaction.fromAddress}",
            icon: Icons.markunread_mailbox_outlined),
      );
    }

    if (isOutgoing) {
      _broadcastNotification(
        TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "NFT Sent",
            body: "NFT to ${transaction.toAddress}",
            icon: Icons.send),
      );
    }
  }

  void _handleAdnr(Transaction transaction) {
    String? body;
    String? function;
    final nftData = _parseNftData(transaction);

    if (nftData != null) {
      function = _nftDataValue(nftData, 'Function');
    }
    if (function != null) {
      if (function.contains('AdnrCreate')) {
        final name = _nftDataValue(nftData!, 'Name');
        if (name == null) return;
        body = "RBX Domain created for $name.rbx";
        _broadcastNotification(
          TransactionNotification(
              identifier: transaction.hash,
              transaction: transaction,
              title: "Domain Name Created",
              body: body,
              color: AppColorVariant.Success,
              icon: Icons.link),
        );
        return;
      }
      if (function.contains('AdnrDelete')) {
        final name = _nftDataValue(nftData!, 'Name');
        if (name == null) return;
        body = "RBX Domain deleted for $name";
        _broadcastNotification(
          TransactionNotification(
              identifier: transaction.hash,
              transaction: transaction,
              title: "Domain Name Deleted",
              body: body,
              color: AppColorVariant.Danger,
              icon: Icons.delete_forever),
        );
        return;
      }
      if (function.contains('AdnrTransfer')) {
        final name = _nftDataValue(nftData!, 'Name');
        if (name == null) return;
        body = "RBX Domain transfer for $name";
        _broadcastNotification(
          TransactionNotification(
            identifier: transaction.hash,
            transaction: transaction,
            title: "Domain Name Transfered",
            body: body,
            color: AppColorVariant.Warning,
            icon: Icons.move_down,
          ),
        );
        return;
      }
    }
  }

  void _handleNftBurn(Transaction transaction) {
    String? body;
    final nftData = _parseNftData(transaction);
    if (nftData != null) {
      body = _nftDataValue(nftData, 'ContractUID');
    }
    _broadcastNotification(
      TransactionNotification(
        identifier: transaction.hash,
        transaction: transaction,
        title: "NFT Burned",
        body: body,
        color: AppColorVariant.Danger,
      ),
    );
  }

  Map<String, dynamic>? _parseNftData(Transaction transaction) {
    try {
      if (transaction.nftData == null) {
        return null;
      }

      final data = jsonDecode(transaction.nftData);
      if (data is Map) {
        return data as Map<String, dynamic>;
      }

      if (data == null || data.isEmpty) {
        return null;
      }

      if (data[0] == null) {
        return null;
      }

      final Map<String, dynamic> d = data[0];

      return d;
    } catch (e) {
      print("Problem parsing NFT data on TX ${transaction.hash}");
      print(e);
      return null;
    }
  }

  String? _nftDataValue(Map<String, dynamic> nftData, String key) {
    return nftData.containsKey(key) ? nftData[key].toString() : null;
  }

  void _broadcastNotification(TransactionNotification notification) {
    read(transactionNotificationProvider.notifier).add(notification);
  }
}

final transactionSignalProvider = StateNotifierProvider<TransactionSignalProvider, List<Transaction>>((ref) {
  return TransactionSignalProvider(ref.read);
});
