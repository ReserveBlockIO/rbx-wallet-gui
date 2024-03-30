import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

part 'tokenize_btc_form_provider.freezed.dart';

@freezed
abstract class TokenizeBtcFormState with _$TokenizeBtcFormState {
  const TokenizeBtcFormState._();

  factory TokenizeBtcFormState({
    @Default(false) bool isProcessing,
    Asset? asset,
  }) = _TokenizeBtcFormState;
}

class TokenizeBtcFormProvider extends StateNotifier<TokenizeBtcFormState> {
  final Ref ref;
  TokenizeBtcFormProvider(this.ref) : super(TokenizeBtcFormState());

  final formKey = GlobalKey<FormState>();

  final tokenNameController = TextEditingController();
  final tokenDescriptionController = TextEditingController();

  setAsset(Asset? asset) {
    state = state.copyWith(asset: asset);
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    final session = ref.read(sessionProvider);
    if (session.currentWallet == null || session.btcSelected || session.currentWallet!.isReserved) {
      Toast.error("Select an RBX Wallet is to proceed.");
      return null;
    }

    final assetLocation = state.asset?.location;
    if (assetLocation == null) {
      Toast.error("Token Image is CURRENTLY required.");
      return null;
    }

    state = state.copyWith(isProcessing: true);

    String? tokenName = tokenNameController.text.trim();
    String? tokenDescription = tokenDescriptionController.text.trim();

    if (tokenName.isEmpty) {
      tokenName = null;
    }

    if (tokenDescription.isEmpty) {
      tokenDescription = null;
    }

    final hash = await BtcService().tokenizeBtc(
      rbxAddress: session.currentWallet!.address,
      fileLocation: assetLocation,
      name: tokenName,
      description: tokenDescription,
    );

    state = state.copyWith(isProcessing: false);
    if (hash != null) {
      Toast.message("Transaction Broadcasted with hash of $hash");
      ref.read(logProvider.notifier).append(
            LogEntry(
              message: "BTC Tokenization Transaction Broadcasted with hash of $hash",
              textToCopy: hash,
              variant: AppColorVariant.Btc,
            ),
          );
      clear();
      return true;
    }

    return false;
  }

  void clear() {
    state = TokenizeBtcFormState();
    tokenNameController.clear();
    tokenDescriptionController.clear();
  }
}

final tokenizeBtcFormProvider = StateNotifierProvider<TokenizeBtcFormProvider, TokenizeBtcFormState>((ref) {
  return TokenizeBtcFormProvider(ref);
});
