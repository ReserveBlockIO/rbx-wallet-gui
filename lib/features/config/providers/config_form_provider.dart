import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/config/models/config.dart';
import 'package:rbx_wallet/features/config/providers/config_provider.dart';
import 'package:rbx_wallet/utils/files.dart';

import '../../../core/dialogs.dart';
import '../../../core/env.dart';

class ConfigFormProvider extends StateNotifier<Config> {
  final Reader read;

  final GlobalKey<FormState> formKey = GlobalKey();

  late final TextEditingController apiPortController;
  late final TextEditingController apiCallUrlController;
  late final TextEditingController walletUnlockTimeController;
  late final TextEditingController nftTimeoutController;
  late final TextEditingController passwordClearTimeController;
  late final bool autoDownloadNftAssetController;
  late final bool ignoreIncomingNftsController;
  late final TextEditingController rejectAssetExtensionTypesController;
  late final TextEditingController allowedExtensionTypesController;

  ConfigFormProvider(this.read, Config model) : super(model) {
    apiPortController = TextEditingController(
      text: model.isApiPortDefault ? '' : model.apiPort.toString(),
    );
    apiCallUrlController = TextEditingController(
      text: model.isApiCallUrlDefault ? '' : model.apiCallUrl,
    );
    walletUnlockTimeController = TextEditingController(
      text: model.isWalletUnlockTimeDefault ? '' : model.walletUnlockTime.toString(),
    );
    nftTimeoutController = TextEditingController(
      text: model.isNftTimeoutDefault ? '' : model.nftTimeout.toString(),
    );
    passwordClearTimeController = TextEditingController(
      text: model.isPasswordClearTimeDefault ? '' : model.passwordClearTime.toString(),
    );
    autoDownloadNftAssetController = model.autoDownloadNftAsset;
    ignoreIncomingNftsController = model.ignoreIncomingNfts;
    rejectAssetExtensionTypesController = TextEditingController(
      text: model.nonDefaultRejectExtensionTypes,
    );
    allowedExtensionTypesController = TextEditingController(
      text: model.allowedAssetExtensionTypes != null ? model.allowedAssetExtensionTypes!.join(',') : '',
    );

    apiCallUrlController.addListener(() {
      state = state.copyWith(apiCallUrl: apiCallUrlController.text);
    });
    nftTimeoutController.addListener(() {
      state = state.copyWith(nftTimeout: int.tryParse(nftTimeoutController.text) ?? -1);
    });
    passwordClearTimeController.addListener(() {
      state = state.copyWith(passwordClearTime: int.tryParse(passwordClearTimeController.text) ?? -1);
    });
    rejectAssetExtensionTypesController.addListener(() {
      state = state.copyWith(rejectAssetExtensionTypes: rejectAssetExtensionTypesController.text.split(','));
    });
    allowedExtensionTypesController.addListener(() {});
  }

  void clear() {
    state = read(configProvider);
  }

  void setApiPort(String val) {
    if (val.isNotEmpty) {
      state = state.copyWith(apiPort: int.parse(val));
    } else {
      state = state.copyWith(apiPort: -1);
    }
  }

  void setWalletUnlockTime(String val) {
    if (val.isNotEmpty) {
      state = state.copyWith(walletUnlockTime: int.parse(val));
    } else {
      state = state.copyWith(walletUnlockTime: -1);
    }
  }

  void setPasswordClearTime(String val) {
    if (val.isNotEmpty) {
      state = state.copyWith(passwordClearTime: int.parse(val));
    } else {
      state = state.copyWith(passwordClearTime: -1);
    }
  }

  void setAllowedExtensionTypes(String val) {
    if (val.isNotEmpty) {
      state = state.copyWith(allowedAssetExtensionTypes: allowedExtensionTypesController.text.split(','));
    } else {
      state = state.copyWith(allowedAssetExtensionTypes: []);
    }
  }

  void setRejectedAssetExtensionTypes(String val) {
    if (val.isNotEmpty) {
      state = state.copyWith(rejectAssetExtensionTypes: allowedExtensionTypesController.text.split(','));
    } else {
      state = state.copyWith(rejectAssetExtensionTypes: []);
    }
  }

  void setNftTimeout(String val) {
    if (val.isNotEmpty) {
      state = state.copyWith(nftTimeout: int.parse(val));
    } else {
      state = state.copyWith(nftTimeout: -1);
    }
  }

  void changeAutoDownloadNFTAssets(bool val) {
    state = state.copyWith(autoDownloadNftAsset: val);
  }

  void changeIgnoreIncomingNfts(bool val) {
    state = state.copyWith(ignoreIncomingNfts: val);
  }

  Future<bool> submit(BuildContext context) async {
    final confirmed = await ConfirmDialog.show(
      title: "Are you sure you want to save this configuration?",
      body: "The CLI will restart to see the changes",
      cancelText: "Cancel",
      confirmText: "Continue",
    );

    if (confirmed) {
      String fileContents = generateFileString();
      final path = await configPath();
      await File(path).writeAsString(fileContents);
      print(fileContents);
      read(sessionProvider.notifier).restartCli();
      clear();
      AutoRouter.of(context).pop();
    }
    return confirmed;
  }

  String generateFileString() {
    String data = '';
    if (Env.isTestNet) {
      data += 'Port=13338\n';
      data += 'TestNet=true\n';
    } else {
      data += 'Port=3338\n';
    }

    if (!state.isApiPortDefault) data += 'APIPort=${state.apiPort}\n';
    if (!state.isApiCallUrlDefault) data += 'APICallURL=${state.apiCallUrl}\n';
    if (!state.isWalletUnlockTimeDefault) data += 'WalletUnlockTime=${state.walletUnlockTime}\n';
    if (!state.isNftTimeoutDefault) data += 'NFTTimeout=${state.nftTimeout}\n';
    if (!state.isPasswordClearTimeDefault) data += 'PasswordClearTime=${state.passwordClearTime}\n';
    if (!state.isAutoDownloadingNftAssetDefault) data += 'AutoDownloadNFTAsset=${state.autoDownloadNftAsset}\n';
    if (!state.isIgnoreIncomingNftsDefault) data += 'IgnoreIncomingNFTs=${state.ignoreIncomingNfts}\n';
    if (!state.isRejectAssetExtensionTypesDefault) data += 'RejectAssetExtensionTypes=${state.nonDefaultRejectExtensionTypes}\n';
    if (!state.isAllowedExtensionTypesDefault) data += 'AllowedExtensionsTypes=${state.nonBannedExtensionTypes}\n';

    return data;
  }
}

final configFormProvider = StateNotifierProvider<ConfigFormProvider, Config>((ref) {
  return ConfigFormProvider(ref.read, ref.read(configProvider));
});
