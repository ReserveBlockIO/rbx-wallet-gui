import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/providers/session_provider.dart';
import '../../../utils/files.dart';
import '../../../utils/toast.dart';
import '../../global_loader/global_loading_provider.dart';
import '../constants.dart';
import '../models/config.dart';
import 'config_provider.dart';

class ConfigFormProvider extends StateNotifier<Config> {
  final Ref ref;

  final GlobalKey<FormState> formKey = GlobalKey();

  late final TextEditingController apiPortController;
  late final TextEditingController apiCallUrlController;
  late final TextEditingController walletUnlockTimeController;
  late final TextEditingController nftTimeoutController;
  late final TextEditingController passwordClearTimeController;
  late bool autoDownloadNftAsset;
  late bool ignoreIncomingNfts;
  late final TextEditingController rejectAssetExtensionTypesController;
  late final TextEditingController allowedExtensionTypesController;
  late final TextEditingController motherAddressController;
  late final TextEditingController motherPasswordController;
  bool obscuredPassword = true;

  ConfigFormProvider(this.ref, Config model) : super(model) {
    _init(model);
    addListeners();
  }

  void _init(Config model) {
    apiPortController = TextEditingController();
    apiCallUrlController = TextEditingController();
    walletUnlockTimeController = TextEditingController();
    nftTimeoutController = TextEditingController();
    passwordClearTimeController = TextEditingController();

    rejectAssetExtensionTypesController = TextEditingController();
    allowedExtensionTypesController = TextEditingController();
    motherAddressController = TextEditingController();
    motherPasswordController = TextEditingController();
    set(model);
  }

  void set(Config model) {
    apiPortController.text = model.isApiPortDefault ? '' : model.apiPort.toString();
    apiCallUrlController.text = model.isApiCallUrlDefault ? '' : model.apiCallUrl.toString();
    motherAddressController.text = model.isMotherAddressDefault ? '' : model.motherAddress.toString();
    motherPasswordController.text = model.isMotherPasswordDefault ? '' : model.motherPassword.toString();
    walletUnlockTimeController.text = model.isWalletUnlockTimeDefault ? '' : model.walletUnlockTime.toString();
    nftTimeoutController.text = model.isNftTimeoutDefault ? '' : model.nftTimeout.toString();
    passwordClearTimeController.text = model.isPasswordClearTimeDefault ? '' : model.passwordClearTime.toString();
    autoDownloadNftAsset = model.autoDownloadNftAsset;
    ignoreIncomingNfts = model.ignoreIncomingNfts;
    rejectAssetExtensionTypesController.text = model.nonDefaultRejectExtensionTypes;
    allowedExtensionTypesController.text = model.allowedAssetExtensionTypes != null ? model.allowedAssetExtensionTypes!.join(',') : '';
  }

  void addListeners() {
    apiCallUrlController.addListener(() {
      state = state.copyWith(apiCallUrl: apiCallUrlController.text);
    });
    motherAddressController.addListener(() {
      state = state.copyWith(motherAddress: motherAddressController.text);
    });
    motherPasswordController.addListener(() {
      state = state.copyWith(motherPassword: motherPasswordController.text);
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
    state = ref.read(configProvider);
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

  Future<bool> submit() async {
    final shouldRestart = await ConfirmDialog.show(
      title: "CLI restart required for changes to take effect.",
      body: "Would you like to restart now?",
      cancelText: "Later",
      confirmText: "Restart Now",
    );

    ref.read(globalLoadingProvider.notifier).start();
    String fileContents = await generateFileString();
    final path = await configPath();
    await File(path).writeAsString(fileContents);

    if (shouldRestart) {
      Toast.message("Restarting CLI...");
      await ref.read(sessionProvider.notifier).restartCli();
    }
    ref.read(globalLoadingProvider.notifier).complete();

    return shouldRestart;
  }

  switchObscurity() {
    obscuredPassword = !obscuredPassword;
  }

  Future<String> generateFileString() async {
    final path = await configPath();
    final currentLines = await File(path).readAsLines();

    final List<String> appendLines = [];
    for (final l in currentLines) {
      for (final setting in NON_CONFIGURABLE_SETTINGS) {
        if (l.contains(setting)) {
          appendLines.add(l);
        }
      }
    }

    String data = '';
    if (Env.isTestNet) {
      data += 'Port=13338\n';
      data += 'TestNet=true\n';
    } else {
      data += 'Port=3338\n';
    }

    data += 'APIPort=${state.apiPort}\n';
    if (!state.isApiCallUrlDefault) data += 'APICallURL=${state.apiCallUrl}\n';
    if (!state.isWalletUnlockTimeDefault) data += 'WalletUnlockTime=${state.walletUnlockTime}\n';
    data += 'NFTTimeout=${state.nftTimeout}\n';
    if (!state.isPasswordClearTimeDefault) data += 'PasswordClearTime=${state.passwordClearTime}\n';
    data += 'AutoDownloadNFTAsset=${state.autoDownloadNftAsset}\n';
    if (!state.isIgnoreIncomingNftsDefault) data += 'IgnoreIncomingNFTs=${state.ignoreIncomingNfts}\n';
    if (!state.isRejectAssetExtensionTypesDefault) data += 'RejectAssetExtensionTypes=${state.nonDefaultRejectExtensionTypes}\n';
    if (!state.isAllowedExtensionTypesDefault) data += 'AllowedExtensionsTypes=${state.nonBannedExtensionTypes}\n';
    if (!state.isMotherAddressDefault) data += 'MotherAddress=${state.motherAddress}\n';
    if (!state.isMotherPasswordDefault) data += 'MotherPassword=${state.motherPassword}\n';

    if (appendLines.isNotEmpty) {
      data += appendLines.join("\n");
    }

    return data;
  }
}

final configFormProvider = StateNotifierProvider<ConfigFormProvider, Config>((ref) {
  return ConfigFormProvider(ref, ref.read(configProvider));
});
