// create VFX wallet
// get $ from faucet
// import btc key OR
//create btc account
//transfer BTC
// tokenize
// transfer btc => vbtc

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/btc/models/btc_account.dart';
import 'package:rbx_wallet/features/btc/models/tokenized_bitcoin.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';
import 'package:rbx_wallet/features/transactions/providers/transaction_list_provider.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'tokenized_btc_onboard_provider.g.dart';

enum VBtcOnboardStep {
  createVfxWallet,
  faucetWithdrawl,
  createOrImportBtcAccount,
  transferBtc,
  tokenize,
  transferBtcToVbtc,
}

const VBTC_ONBOARD_VFX_AMOUNT = 1.0;

class VBtcOnboardState {
  final VBtcOnboardStep step;
  final Wallet? vfxWallet;
  final BtcAccount? btcAccount;
  final double amountOfBtcToTransfer;
  final TokenizedBitcoin? tokenizedBtc;

  VBtcOnboardState({
    this.step = VBtcOnboardStep.createVfxWallet,
    this.vfxWallet,
    this.btcAccount,
    this.amountOfBtcToTransfer = 0.0,
    this.tokenizedBtc,
  });

  VBtcOnboardState copyWith({
    VBtcOnboardStep? step,
    Wallet? vfxWallet,
    BtcAccount? btcAccount,
    double? amountOfBtcToTransfer,
    TokenizedBitcoin? tokenizedBtc,
  }) {
    return VBtcOnboardState(
      step: step ?? this.step,
      vfxWallet: vfxWallet ?? this.vfxWallet,
      btcAccount: btcAccount ?? this.btcAccount,
      amountOfBtcToTransfer: amountOfBtcToTransfer ?? this.amountOfBtcToTransfer,
      tokenizedBtc: tokenizedBtc ?? this.tokenizedBtc,
    );
  }

  int get stepNumber {
    switch (step) {
      case VBtcOnboardStep.createVfxWallet:
        return 1;

      case VBtcOnboardStep.faucetWithdrawl:
        return 2;

      case VBtcOnboardStep.createOrImportBtcAccount:
        return 3;

      case VBtcOnboardStep.transferBtc:
        return 4;

      case VBtcOnboardStep.tokenize:
        return 5;

      case VBtcOnboardStep.transferBtcToVbtc:
        return 6;
    }
  }

  String get stepTitle {
    switch (step) {
      case VBtcOnboardStep.createVfxWallet:
        return "Create VFX Wallet";

      case VBtcOnboardStep.faucetWithdrawl:
        return "Get VFX";

      case VBtcOnboardStep.createOrImportBtcAccount:
        return "Import BTC Account";

      case VBtcOnboardStep.transferBtc:
        return "Transfer BTC";

      case VBtcOnboardStep.tokenize:
        return "Tokenized vBTC";

      case VBtcOnboardStep.transferBtcToVbtc:
        return "Transfer BTC to vBTC Token";
    }
  }

  String get stepDetails {
    switch (step) {
      case VBtcOnboardStep.createVfxWallet:
        return "First you'll need a VFX Wallet. You can either import an existing one or create one now";

      case VBtcOnboardStep.faucetWithdrawl:
        return "The community has provided a faucet to withdraw a minimal amount of VFX from in order to try out this feature. A phone number is required for verification purposes and to reduce the chance of abuse. Please note that only a hash of the phone number is stored with the faucet. Alternatively, you are welcome to purchase VFX via an exchange if you like. ";

      case VBtcOnboardStep.createOrImportBtcAccount:
        return "Now you need a BTC account added to your wallet. You can either import a private key or generate a new one.";

      case VBtcOnboardStep.transferBtc:
        return "";

      case VBtcOnboardStep.tokenize:
        return "";

      case VBtcOnboardStep.transferBtcToVbtc:
        return "";
    }
  }
}

@Riverpod(keepAlive: true)
class VBtcOnboard extends _$VBtcOnboard {
  ProviderSubscription<List<Transaction>>? vfxTransferListener;
  ProviderSubscription<List<BtcAccount>>? btcTransferListener;

  @override
  VBtcOnboardState build() {
    return VBtcOnboardState();
  }

  void setupVfxTransferListener() {
    vfxTransferListener = ref.listen(transactionListProvider(TransactionListType.Success), (previous, List<Transaction> transactions) {
      if (state.step == VBtcOnboardStep.faucetWithdrawl) {
        final tx = transactions.firstWhereOrNull((t) => t.toAddress == state.vfxWallet?.address && t.amount >= VBTC_ONBOARD_VFX_AMOUNT);
        if (tx != null) {
          Toast.message("VFX Funds Received!");
          state = state.copyWith(step: VBtcOnboardStep.createOrImportBtcAccount);
          vfxTransferListener?.close();
        }
      }
    });
  }

  void setupBtcTransferListener() {
    btcTransferListener = ref.listen(btcAccountListProvider, (previous, List<BtcAccount> accounts) {
      if (state.step == VBtcOnboardStep.transferBtc) {
        final account = accounts.firstWhereOrNull((a) => a.address == state.btcAccount?.address && a.balance > 0);
        if (account != null) {
          Toast.message("BTC Funds Received!");
          state = state.copyWith(step: VBtcOnboardStep.tokenize);

          btcTransferListener?.close();
        }
      }
    });
  }

  void reset() {
    state = VBtcOnboardState();
  }

  void setVfxWallet(Wallet vfxWallet) {
    if (vfxWallet.balance >= VBTC_ONBOARD_VFX_AMOUNT) {
      state = state.copyWith(vfxWallet: vfxWallet, step: VBtcOnboardStep.createOrImportBtcAccount);
    } else {
      state = state.copyWith(vfxWallet: vfxWallet, step: VBtcOnboardStep.faucetWithdrawl);
      setupVfxTransferListener();
    }
  }

  void setBtcAccount(BtcAccount account) {
    if (account.balance >= 0) {
      state = state.copyWith(btcAccount: account, step: VBtcOnboardStep.tokenize);
    } else {
      state = state.copyWith(btcAccount: account, step: VBtcOnboardStep.transferBtc);
      setupBtcTransferListener();
    }
  }
}
