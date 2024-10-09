import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_watcher.dart';
import 'package:rbx_wallet/features/nft/providers/sale_provider.dart';
import 'package:rbx_wallet/features/reserve/providers/ra_auto_activate_provider.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:rbx_wallet/features/token/providers/auto_mint_provider.dart';
import 'package:rbx_wallet/features/token/providers/pending_token_pause_provider.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_list_provider.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../dst/providers/dec_shop_provider.dart';
import '../../dst/providers/dst_tx_pending_provider.dart';
import '../../token/providers/token_list_provider.dart';
import 'web_transaction_list_provider.dart';
import '../../../utils/toast.dart';

import '../../../core/app_constants.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../nft/providers/transferred_provider.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../models/transaction.dart';
import '../models/transaction_notification.dart';
import 'transaction_notification_provider.dart';

class TransactionSignalProvider extends StateNotifier<List<Transaction>> {
  final Ref ref;

  TransactionSignalProvider(this.ref) : super([]);

  List<String> get _addresses {
    return kIsWeb ? ["${ref.read(webSessionProvider).keypair?.address}"] : ref.read(walletListProvider).map((w) => w.address).toList();
  }

  bool _hasAddress(String address) {
    return _addresses.firstWhereOrNull((a) => a == address) != null;
  }

  void insert(Transaction transaction) {
    final threshold = (DateTime.now().subtract(Duration(minutes: 5)).millisecondsSinceEpoch / 1000).round();
    if (transaction.timestamp < threshold) {
      return;
    }

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
      case TxType.tokenDeploy:
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
      case TxType.tokenTx:
        _handleNftTx(transaction, isOutgoing: isOutgoing, isIncoming: isIncoming);
        break;
      case TxType.nftBurn:
        _handleNftBurn(transaction);
        break;
      case TxType.dstShop:
        _handleDstShop(transaction);
        break;
      case TxType.nftSale:
        _handleNftSale(transaction);
        break;
    }
  }

  void _handleFundsTransfer(
    Transaction transaction, {
    bool isOutgoing = false,
    bool isIncoming = false,
  }) {
    if (isIncoming) {
      if (transaction.fromAddress == "Coinbase_BlkRwd") {
        return;
      }

      _broadcastNotification(
        TransactionNotification(
          identifier: "${transaction.hash}_incoming",
          transaction: transaction,
          title: "Funds Received",
          body: "${transaction.amount} VFX from ${transaction.fromAddress}",
          icon: Icons.move_to_inbox,
        ),
      );

      final autoActivateData = ref.read(reserveAccountAutoActivateProvider);
      if (autoActivateData.containsKey(transaction.hash)) {
        final data = autoActivateData[transaction.hash];
        final String? address = data['address'];
        final String? password = data['password'];

        if (address != null && password != null) {
          ReserveAccountService().publish(address: address, password: password).then((success) {
            if (success) {
              Toast.message("Vault Account Auto Activation process initiated");
            }
          });
        }
        ref.read(reserveAccountAutoActivateProvider.notifier).remove(transaction.hash);
      }
    }
    if (isOutgoing) {
      _broadcastNotification(
        TransactionNotification(
          identifier: "${transaction.hash}_outgoing",
          transaction: transaction,
          title: "Funds Sent",
          body: "${transaction.amount.toString().replaceAll('-', '')} VFX to ${transaction.toAddress}",
          icon: Icons.outbox,
        ),
      );
    }

    if (kIsWeb) {
      final address = ref.read(webSessionProvider).keypair?.address;
      if (address != null) {
        ref.read(webTransactionListProvider(address).notifier).checkForNew(address);
      }
    }
  }

  void _handleNftMint(Transaction transaction) {
    String? body;
    final nftData = _parseNftData(transaction);
    if (nftData != null) {
      if (_nftDataValue(nftData, 'Function') == "TokenDeploy()") {
        body = _nftDataValue(nftData, 'ContractUID');
        _broadcastNotification(
          TransactionNotification(
            identifier: transaction.hash,
            transaction: transaction,
            title: "Token Deployed",
            body: body,
            icon: Icons.toll,
          ),
        );
        ref.read(tokenListProvider.notifier).reloadCurrentPage();

        final scId = _nftDataValue(nftData, 'ContractUID');
        if (scId != null) {
          final autoMintData = ref.read(autoMintProvider);

          if (autoMintData.containsKey(scId)) {
            final Map<String, dynamic>? data = autoMintData[scId];
            if (data != null) {
              if (data.containsKey('amount') && data.containsKey('fromAddress')) {
                final double? amount = data['amount'];
                final String? fromAddress = data['fromAddress'];

                if (amount != null && fromAddress != null) {
                  TokenService().mint(scId: scId, fromAddress: fromAddress, amount: amount).then((success) {
                    if (success == true) {
                      Toast.message("Token Auto Mint initiated. ($scId: $amount)");
                    }
                  });
                }
              }
            }

            ref.read(autoMintProvider.notifier).remove(scId);
          }
        }
      } else {
        if (transaction.type == 17) {
          body = _nftDataValue(nftData, 'ContractUID');
          _broadcastNotification(
            TransactionNotification(
              color: AppColorVariant.Btc,
              identifier: transaction.hash,
              transaction: transaction,
              title: "vBTC Tokenization Mint",
              body: body,
              icon: Icons.lightbulb_outline,
            ),
          );
        } else {
          body = _nftDataValue(nftData, 'ContractUID');
          _broadcastNotification(
            TransactionNotification(
              identifier: transaction.hash,
              transaction: transaction,
              title: "NFT Minted",
              body: body,
              icon: Icons.lightbulb_outline,
            ),
          );
        }
      }
    }

    kIsWeb ? ref.read(webSessionProvider.notifier).getNfts() : ref.read(sessionProvider.notifier).smartContractLoop(false);
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
      final function = _nftDataValue(nftData, "Function");

      if (function == "TokenMint()") {
        final amount = _nftDataValue(nftData, "Amount");
        final ticker = _nftDataValue(nftData, "TokenTicker");

        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Tokens Minted",
            body: "$amount ${ticker != null ? '[$ticker]' : ''}",
            icon: Icons.toll,
          ),
        );
        return;
      }

      if (function == "TokenTransfer()") {
        final amount = _nftDataValue(nftData, "Amount");
        final ticker = _nftDataValue(nftData, "TokenTicker");

        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Token Transfer",
            body: "$amount ${ticker != null ? '[$ticker]' : ''}",
            icon: Icons.toll,
            color: AppColorVariant.Primary,
          ),
        );
        return;
      }

      if (function == "TokenBurn()") {
        final amount = _nftDataValue(nftData, "Amount");
        final ticker = _nftDataValue(nftData, "TokenTicker");

        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Token Burn",
            body: "$amount ${ticker != null ? '[$ticker]' : ''}",
            icon: Icons.toll,
            color: AppColorVariant.Danger,
          ),
        );
        return;
      }

      if (function == "TokenPause()") {
        final isPause = _nftDataValue(nftData, "Pause") == "true";

        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Token Pause",
            body: isPause ? "Paused" : "Resumed",
            icon: Icons.toll,
          ),
        );

        final scId = _nftDataValue(nftData, "ContractUID");

        if (scId != null) {
          ref.invalidate(nftDetailWatcher(scId));
          ref.read(pendingTokenPauseProvider.notifier).removeId(scId);
        }
        return;
      }

      if (function == "TokenBanAddress()") {
        final address = _nftDataValue(nftData, "BanAddress");

        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Token Ban Address",
            body: address,
            icon: Icons.toll,
          ),
        );

        final scId = _nftDataValue(nftData, "ContractUID");

        if (scId != null) {
          ref.invalidate(nftDetailWatcher(scId));
        }
        return;
      }

      if (function == "TokenContractOwnerChange()") {
        final address = _nftDataValue(nftData, "ToAddress");

        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Token Change Ownership",
            body: address,
            icon: Icons.toll,
          ),
        );

        final scId = _nftDataValue(nftData, "ContractUID");

        if (scId != null) {
          ref.invalidate(nftDetailWatcher(scId));
          ref.read(transferredProvider.notifier).removeId(scId);
          ref.read(tokenListProvider.notifier).reloadCurrentPage();
        }
        return;
      }

      if (function == "TokenVoteTopicCreate()") {
        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Token Topic Created",
            icon: FontAwesomeIcons.gavel,
            color: AppColorVariant.Primary,
          ),
        );
        return;
      }

      if (function == "TokenVoteTopicCast()") {
        _broadcastNotification(
          TransactionNotification(
            identifier: "${transaction.hash}_outgoing",
            transaction: transaction,
            title: "Token Vote Cast",
            icon: FontAwesomeIcons.gavel,
            color: AppColorVariant.Primary,
          ),
        );
        return;
      }

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
        kIsWeb ? ref.read(webSessionProvider.notifier).getNfts() : ref.read(sessionProvider.notifier).smartContractLoop(false);

        return;
      }
    }

    if (nftData != null) {
      final id = _nftDataValue(nftData, 'ContractUID');
      if (id != null) {
        ref.read(transferredProvider.notifier).removeId(id);
      }
    }

    if (isIncoming) {
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

    kIsWeb ? ref.read(webSessionProvider.notifier).getNfts() : ref.read(sessionProvider.notifier).smartContractLoop(false);
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

        body = "VFX Domain created for $name.vfx";
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
        body = "VFX Domain deleted for $name";
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
        body = "VFX Domain transfer for $name";
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

      //BTC

      if (function.contains('BtcAdnrCreate')) {
        final name = _nftDataValue(nftData!, 'Name');
        if (name == null) return;
        body = "BTC Domain created for $name.btc";
        _broadcastNotification(
          TransactionNotification(
              identifier: transaction.hash,
              transaction: transaction,
              title: "BTC Domain Name Created",
              body: body,
              color: AppColorVariant.Btc,
              icon: Icons.link),
        );
        return;
      }
      if (function.contains('BtcAdnrDelete')) {
        final name = _nftDataValue(nftData!, 'Name');
        if (name == null) return;
        body = "BTC Domain deleted for $name";
        _broadcastNotification(
          TransactionNotification(
              identifier: transaction.hash,
              transaction: transaction,
              title: "BTC Domain Name Deleted",
              body: body,
              color: AppColorVariant.Btc,
              icon: Icons.delete_forever),
        );
        return;
      }
      if (function.contains('BtcAdnrTransfer')) {
        final name = _nftDataValue(nftData!, 'Name');
        if (name == null) return;
        body = "VFX Domain transfer for $name";
        _broadcastNotification(
          TransactionNotification(
            identifier: transaction.hash,
            transaction: transaction,
            title: "BTC Domain Name Transfered",
            body: body,
            color: AppColorVariant.Btc,
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
    kIsWeb ? ref.read(webSessionProvider.notifier).getNfts() : ref.read(sessionProvider.notifier).smartContractLoop(false);
  }

  void _handleNftSale(Transaction transaction) async {
    final nftData = _parseNftData(transaction)!;

    final function = _nftDataValue(nftData, 'Function');
    // final nextOwner = _nftDataValue(nftData, 'NextOwner');
    final scId = _nftDataValue(nftData, 'ContractUID');
    final amount = _nftDataValue(nftData, 'SoldFor');

    if (function == "Sale_Start()") {
      _broadcastNotification(
        TransactionNotification(
          identifier: transaction.hash,
          transaction: transaction,
          title: "Sale Started",
          body: scId,
          color: AppColorVariant.Warning,
        ),
      );
    } else if (function == "Sale_Complete()") {
      _broadcastNotification(
        TransactionNotification(
          identifier: transaction.hash,
          transaction: transaction,
          title: "Sale Completed",
          body: scId,
          color: AppColorVariant.Success,
        ),
      );

      // if (kIsWeb) {
      //   ref.read(webListingListProvider().notifier).refresh();
      // }
    } else if (function == "M_Sale_Start()") {
      _broadcastNotification(
        TransactionNotification(
          identifier: transaction.hash,
          transaction: transaction,
          title: "Sale Started (Manual)",
          body: scId,
          color: AppColorVariant.Warning,
        ),
      );
    } else if (function == "M_Sale_Complete()") {
      _broadcastNotification(
        TransactionNotification(
          identifier: transaction.hash,
          transaction: transaction,
          title: "Sale Completed (Manual)",
          body: scId,
          color: AppColorVariant.Success,
        ),
      );
      if (scId != null) {
        ref.read(saleProvider.notifier).removeId(scId);
      }
    }
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

  void _handleDstShop(Transaction transaction) {
    if (kIsWeb) {
      ref.read(webShopListProvider(WebShopListType.mine).notifier).refresh();
    } else {
      ref.invalidate(decShopProvider);
      ref.read(dstTxPendingProvider.notifier).set(false);
    }

    _broadcastNotification(
      TransactionNotification(
        identifier: transaction.hash,
        transaction: transaction,
        title: "DecShop TX",
        body: "DecShop TX Complete",
        icon: Icons.store,
      ),
    );
  }

  String? _nftDataValue(Map<String, dynamic> nftData, String key) {
    return nftData.containsKey(key) ? nftData[key].toString() : null;
  }

  void _broadcastNotification(TransactionNotification notification) {
    ref.read(transactionNotificationProvider.notifier).add(notification);
  }
}

final transactionSignalProvider = StateNotifierProvider<TransactionSignalProvider, List<Transaction>>((ref) {
  return TransactionSignalProvider(ref);
});
