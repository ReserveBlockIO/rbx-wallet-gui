import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/config/constants.dart';
import 'package:rbx_wallet/features/config/providers/config_form_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/utils/validation.dart';

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
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                Flexible(child: _AllowedExtensionTypes())
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
          child: Text("Auto Download NFT Assets"),
        ),
        HelpButton(HelpType.autoDownloadNftAsset)
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
          child: Text("Ignore Incoming NFTs"),
        ),
        HelpButton(HelpType.ignoreIncomingNfts)
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
        label: Text(
          "Wallet Unlock Time",
          style: TextStyle(color: Colors.white),
        ),
        hintText: WALLET_UNLOCK_TIME_DEFAULT.toString(),
        suffixIcon: HelpButton(HelpType.walletUnlockTime),
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
        label: Text(
          "NFT Timeout",
          style: TextStyle(color: Colors.white),
        ),
        hintText: NFT_TIMEOUT_DEFAULT.toString(),
        suffixIcon: HelpButton(HelpType.nftTimeout),
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
        label: Text(
          "Api Port",
          style: TextStyle(color: Colors.white),
        ),
        hintText: Env.isTestNet ? '17292' : '7292',
        suffixIcon: HelpButton(HelpType.apiPort),
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
        label: Text(
          "Password Clear Time",
          style: TextStyle(color: Colors.white),
        ),
        hintText: PASSWORD_CLEAR_TIME_DEFAULT.toString(),
        suffixIcon: HelpButton(HelpType.passwordClearTime),
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
