import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/utils.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/models/smart_contract.dart';
import 'package:rbx_wallet/features/smart_contracts/services/smart_contract_service.dart';
import 'package:rbx_wallet/features/token/constants.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/providers/auto_mint_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class TokenFormProvider extends StateNotifier<TokenScFeature> {
  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();

  late final TextEditingController nameController;
  late final TextEditingController tickerController;
  late final TextEditingController supplyController;
  late final TextEditingController imageUrlController;

  TokenFormProvider(this.ref, TokenScFeature model) : super(model) {
    nameController = TextEditingController(text: model.name);
    tickerController = TextEditingController(text: model.ticker);
    supplyController = TextEditingController(text: model.supply == 0 ? '0' : model.supply.toString());
    imageUrlController = TextEditingController(text: model.imageUrl ?? '');
  }

  String? nameValidator(String? val) => formValidatorNotEmpty(val, "Token Name");
  String? tickerValidator(String? val) => formValidatorNotEmpty(val, "Token Ticker");
  String? supplyValidator(String? val) => formValidatorNumber(val, "Supply Amount");

  load(TokenScFeature model) {
    state = model;
    nameController.text = model.name;
    tickerController.text = model.ticker;
    supplyController.text = model.supply == 0 ? '0' : model.supply.toString();
    imageUrlController.text = model.imageUrl ?? '';
  }

  clear() {
    load(TokenScFeature.empty());
  }

  setDecimalPlaces(int amount) {
    if (amount < TOKEN_MIN_DECIMAL_PLACES) {
      amount = TOKEN_MIN_DECIMAL_PLACES;
    } else if (amount > TOKEN_MAX_DECIMAL_PLACES) {
      amount = TOKEN_MAX_DECIMAL_PLACES;
    }

    state = state.copyWith(decimalPlaces: amount);
  }

  setMintable(bool value) {
    state = state.copyWith(mintable: value);
  }

  setBurnable(bool value) {
    state = state.copyWith(burnable: value);
  }

  setVoting(bool value) {
    state = state.copyWith(voting: value);
  }

  setImageBase64(String value) {
    state = state.copyWith(imageBase64: value);
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    final currentWallet = ref.read(sessionProvider).currentWallet;

    if (currentWallet == null) {
      Toast.error("No account selected");
      return null;
    }

    final supply = double.tryParse(supplyController.text);
    if (supply == null) {
      Toast.error("Invalid Supply Amount");
      return null;
    }

    if (state.imageBase64 == null) {
      Toast.error("Icon Image Required");
      return null;
    }

    final token = state.copyWith(
      name: nameController.text,
      ticker: tickerController.text.toUpperCase(),
      imageUrl: imageUrlController.text,
      supply: state.mintable || supply == 0 ? 0 : supply,
    );

    final bytes = base64.decode(state.imageBase64!);
    final appDir = await syspaths.getTemporaryDirectory();
    final fileName = "${generateRandomString(16)}.png";
    final filePath = '${appDir.path}/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    final tempAsset = Asset(
      id: "00000000-0000-0000-0000-000000000000",
      fileSize: bytes.length,
      name: fileName,
      authorName: currentWallet.address,
      location: filePath,
      extension: "png",
    );

    final sc = SmartContract(
      owner: currentWallet,
      name: token.name,
      description: token.ticker,
      token: token,
      primaryAsset: tempAsset,
      minterName: currentWallet.address,
    );

    final timezoneName = ref.read(sessionProvider).timezoneName;
    final payload = sc.serializeForCompiler(timezoneName);
    ref.read(globalLoadingProvider.notifier).start();

    final csc = await SmartContractService().compileSmartContract(payload);
    ref.read(globalLoadingProvider.notifier).complete();

    if (csc == null) {
      Toast.error();
      print("CSC was null");
      return false;
    }

    if (!csc.success) {
      Toast.error();
      print("CSC not successful");
      return false;
    }
    ref.read(globalLoadingProvider.notifier).start();

    final details = await SmartContractService().retrieve(csc.smartContract.id);
    ref.read(globalLoadingProvider.notifier).complete();

    if (details == null) {
      Toast.error();
      print("Details null");
      return false;
    }

    final id = details.smartContract.id;

    if (state.mintable) {
      final premintAmount = await PromptModal.show(
        title: "Pre Mine Initial Issuance?",
        validator: (v) {
          return null;
        },
        labelText: "Supply",
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp("[0-9.]"),
          ),
        ],
      );
      final parsedPremintAmount = premintAmount != null ? double.tryParse(premintAmount) : null;

      if (parsedPremintAmount != null) {
        ref.read(autoMintProvider.notifier).add(id, currentWallet.address, parsedPremintAmount);
      }
    }
    ref.read(globalLoadingProvider.notifier).start();

    final success = await SmartContractService().mint(id);
    ref.read(globalLoadingProvider.notifier).complete();

    if (!success) {
      Toast.error();
      print("Mint error");
      return false;
    }

    return true;
  }
}

final tokenFormProvider = StateNotifierProvider<TokenFormProvider, TokenScFeature>(
  (ref) => TokenFormProvider(ref, TokenScFeature.empty()),
);
