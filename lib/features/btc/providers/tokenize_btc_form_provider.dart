import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/compile_animation.dart';
import 'package:rbx_wallet/features/smart_contracts/models/multi_asset.dart';
import 'package:rbx_wallet/utils/toast.dart';

part 'tokenize_btc_form_provider.freezed.dart';

@freezed
abstract class TokenizeBtcFormState with _$TokenizeBtcFormState {
  const TokenizeBtcFormState._();

  factory TokenizeBtcFormState({
    @Default(false) bool isProcessing,
    Asset? asset,
    String? vfxAddress,
    @Default([]) List<Asset> additionalAssets,
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

  setAddress(String address) {
    state = state.copyWith(vfxAddress: address);
  }

  addAdditonalAsset(Asset asset) {
    state = state.copyWith(additionalAssets: [
      ...state.additionalAssets,
      asset,
    ]);
  }

  replaceAdditionalAsset(int index, Asset asset) {
    state = state.copyWith(
      additionalAssets: [...state.additionalAssets]
        ..removeAt(index)
        ..insert(index, asset),
    );
  }

  removeAdditionalAsset(int index) {
    state = state.copyWith(additionalAssets: [...state.additionalAssets]..removeAt(index));
  }

  void showCompileAnimation(
    BuildContext context,
    Completer<BuildContext> completer, [
    bool mint = false,
  ]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
      builder: (dialogContext) {
        if (!completer.isCompleted) {
          completer.complete(dialogContext);
        }
        return Center(
            child: CompileAnimation(
          mint,
          btc: true,
        ));
      },
    );
  }

  void showCompileComplete(
    BuildContext context,
    Completer<BuildContext> completer, [
    bool mint = false,
  ]) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
      builder: (dialogContext) {
        if (!completer.isCompleted) {
          completer.complete(dialogContext);
        }
        return Center(
            child: CompileAnimationComplete(
          mint,
          btc: true,
        ));
      },
    );
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    if (state.vfxAddress == null) {
      Toast.error("A VFX account with a balance is required to proceed.");
      return null;
    }

    final assetLocation = state.asset?.location;

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
      rbxAddress: state.vfxAddress!,
      fileLocation: assetLocation,
      name: tokenName,
      description: tokenDescription,
      multiAsset: state.additionalAssets.isNotEmpty ? MultiAsset(assets: state.additionalAssets) : null,
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
