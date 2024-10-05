import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/token/models/web_fungible_token.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';

import '../../../core/app_constants.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../utils/toast.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../raw/raw_service.dart';

class WebTokenActionsManager {
  final Ref ref;

  WebTokenActionsManager(this.ref);

  Future<bool?> mintTokens(WebFungibleToken token, String address, double amount) async {
    const toAddress = "Token_Base";
    const txType = TxType.tokenTx;

    final data = {
      "Function": "TokenMint()",
      "ContractUID": token.smartContractId,
      "FromAddress": address,
      "Amount": amount,
      "TokenTicker": token.ticker,
      "TokenName": token.name,
    };

    ref.read(globalLoadingProvider.notifier).start();

    final txData = await RawTransaction.generate(
      keypair: ref.read(webSessionProvider).keypair!,
      toAddress: toAddress,
      amount: 0,
      txType: txType,
      data: data,
    );
    ref.read(globalLoadingProvider.notifier).complete();

    if (txData == null) {
      Toast.error("Invalid transaction data.");
      return false;
    }

    final txFee = txData['Fee'];

    final confirmed = await ConfirmDialog.show(
      title: "Valid Transaction",
      body: "Transaction verified. Would you like to proceed?",
      confirmText: "Mint",
      cancelText: "Cancel",
    );
    if (confirmed != true) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();

    final tx = await RawService().sendTransaction(transactionData: txData, execute: true, ref: ref);
    ref.read(globalLoadingProvider.notifier).complete();

    if (tx != null && tx['Result'] == "Success") {
      return true;
    }

    return false;
  }
}

final webTokenActionsManager = Provider((ref) {
  return WebTokenActionsManager(ref);
});
