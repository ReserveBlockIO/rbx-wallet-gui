import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/env.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_header.dart';
import '../../smart_contracts/components/sc_creator/common/help_button.dart';
import '../constants.dart';
import '../providers/config_form_provider.dart';

class ConfigurationFormGroup extends BaseComponent {
  const ConfigurationFormGroup({Key? key}) : super(key: key);

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Configuration",
            helpType: HelpType.configuration,
          ),
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Flexible(
                  child: _ApiPort(),
                ),
                Flexible(
                  child: _ApiCallUrl(),
                ),
                Flexible(child: _WalletUnlockTime()),
                Flexible(
                  child: _PasswordClearTime(),
                ),
                Flexible(child: _NftTimeout()),
                Flexible(
                  child: _AutoDownloadNftAsset(),
                ),
                Flexible(child: _IgnoreIncomingNfts()),
                Flexible(child: _RejectAssetsExtensionTypes()),
                Flexible(child: _AllowedExtensionTypes()),
                Flexible(child: _MotherAddress()),
                Flexible(child: _MotherPassword()),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _ApiCallUrl extends BaseComponent {
  const _ApiCallUrl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.apiCallUrlController,
      decoration: const InputDecoration(
        label: Text(
          "Api Call Url",
          style: TextStyle(color: Colors.white),
        ),
        hintText: "",
        suffixIcon: HelpButton(HelpType.apiCallUrl),
      ),
    );
  }
}

class _MotherAddress extends BaseComponent {
  const _MotherAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.motherAddressController,
      decoration: const InputDecoration(
        label: Text(
          "Mother Address",
          style: TextStyle(color: Colors.white),
        ),
        hintText: "",
        suffixIcon: HelpButton(HelpType.motherAddress),
      ),
    );
  }
}

class _MotherPassword extends BaseComponent {
  const _MotherPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      obscureText: true,
      controller: provider.motherPasswordController,
      decoration: const InputDecoration(
        label: Text(
          "Mother Password",
          style: TextStyle(color: Colors.white),
        ),
        hintText: "",
        suffixIcon: HelpButton(HelpType.motherPassword),
      ),
    );
  }
}

class _AutoDownloadNftAsset extends BaseComponent {
  const _AutoDownloadNftAsset({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    final model = ref.watch(configFormProvider);
    return Row(
      children: [
        Checkbox(
            value: model.autoDownloadNftAsset,
            onChanged: (val) {
              provider.changeAutoDownloadNFTAssets(val!);
            }),
        GestureDetector(
          onTap: () {
            provider.changeAutoDownloadNFTAssets(!model.autoDownloadNftAsset);
          },
          child: const Text("Auto Download NFT Assets"),
        ),
        const HelpButton(HelpType.autoDownloadNftAsset)
      ],
    );
  }
}

class _IgnoreIncomingNfts extends BaseComponent {
  const _IgnoreIncomingNfts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    final model = ref.watch(configFormProvider);
    return Row(
      children: [
        Checkbox(
            value: model.ignoreIncomingNfts,
            onChanged: (val) {
              provider.changeIgnoreIncomingNfts(val!);
            }),
        GestureDetector(
          onTap: () {
            provider.changeIgnoreIncomingNfts(!model.ignoreIncomingNfts);
          },
          child: const Text("Ignore Incoming NFTs"),
        ),
        const HelpButton(HelpType.ignoreIncomingNfts)
      ],
    );
  }
}

class _WalletUnlockTime extends BaseComponent {
  const _WalletUnlockTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.walletUnlockTimeController,
      validator: (val) => formValidatorNumber(val, "WalletUnlockTime"),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: provider.setWalletUnlockTime,
      decoration: InputDecoration(
        label: const Text(
          "Account Unlock Time",
          style: TextStyle(color: Colors.white),
        ),
        hintText: WALLET_UNLOCK_TIME_DEFAULT.toString(),
        suffixIcon: const HelpButton(HelpType.walletUnlockTime),
      ),
    );
  }
}

class _NftTimeout extends BaseComponent {
  const _NftTimeout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.nftTimeoutController,
      validator: (val) => formValidatorNumber(val, "NFTTimeout"),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: provider.setNftTimeout,
      decoration: InputDecoration(
        label: const Text(
          "NFT Timeout",
          style: TextStyle(color: Colors.white),
        ),
        hintText: NFT_TIMEOUT_DEFAULT.toString(),
        suffixIcon: const HelpButton(HelpType.nftTimeout),
      ),
    );
  }
}

class _ApiPort extends BaseComponent {
  const _ApiPort({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.apiPortController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: provider.setApiPort,
      decoration: InputDecoration(
        label: const Text(
          "Api Port",
          style: TextStyle(color: Colors.white),
        ),
        hintText: Env.isTestNet ? '17292' : '7292',
        suffixIcon: const HelpButton(HelpType.apiPort),
      ),
    );
  }
}

class _PasswordClearTime extends BaseComponent {
  const _PasswordClearTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.passwordClearTimeController,
      validator: (val) => formValidatorNumber(val, "PasswordClearTime"),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: provider.setPasswordClearTime,
      decoration: InputDecoration(
        label: const Text(
          "Password Clear Time",
          style: TextStyle(color: Colors.white),
        ),
        hintText: PASSWORD_CLEAR_TIME_DEFAULT.toString(),
        suffixIcon: const HelpButton(HelpType.passwordClearTime),
      ),
    );
  }
}

class _AllowedExtensionTypes extends BaseComponent {
  const _AllowedExtensionTypes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.allowedExtensionTypesController,
      onChanged: provider.setAllowedExtensionTypes,
      decoration: const InputDecoration(
        label: Text(
          "Allowed Extension Types",
          style: TextStyle(color: Colors.white),
        ),
        suffixIcon: HelpButton(HelpType.allowedAssetExtensionTypes),
      ),
    );
  }
}

class _RejectAssetsExtensionTypes extends BaseComponent {
  const _RejectAssetsExtensionTypes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(configFormProvider.notifier);
    return TextFormField(
      controller: provider.rejectAssetExtensionTypesController,
      onChanged: provider.setRejectedAssetExtensionTypes,
      decoration: const InputDecoration(
        label: Text(
          "Rejected Asset Extension Types",
          style: TextStyle(color: Colors.white),
        ),
        suffixIcon: HelpButton(HelpType.rejectAssetExtensionTypes),
      ),
    );
  }
}
