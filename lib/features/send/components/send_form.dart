import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/app_constants.dart';
import '../../../core/models/web_session_model.dart';
import '../../btc/models/btc_account.dart';
import '../../btc/models/btc_fee_rate_preset.dart';
import '../../btc/models/btc_recommended_fees.dart';
import '../../btc/providers/btc_account_list_provider.dart';
import '../../btc/utils.dart';
import '../../btc_web/models/btc_web_account.dart';
import '../../keygen/models/ra_keypair.dart';
import '../../../core/providers/session_provider.dart';
import '../../reserve/providers/pending_activation_provider.dart';
import '../../reserve/providers/reserve_account_provider.dart';
import '../../wallet/providers/wallet_list_provider.dart';

import '../../../core/base_component.dart';
import '../../../core/breakpoints.dart';
import '../../../core/components/badges.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../encrypt/utils.dart';
import '../../keygen/models/keypair.dart';
import '../../wallet/models/wallet.dart';
import '../../reserve/components/balance_indicator.dart';
import '../providers/send_form_provider.dart';

class SendForm extends BaseComponent {
  final Wallet? wallet;
  final BtcAccount? btcAccount;
  final Keypair? keypair;
  final RaKeypair? raKeypair;
  final BtcWebAccount? btcWebAccount;
  const SendForm({
    this.wallet,
    this.keypair,
    this.raKeypair,
    this.btcAccount,
    this.btcWebAccount,
    super.key,
  });

  Future<void> _pasteAddress(SendFormProvider formProvider) async {
    ClipboardData? clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null && clipboardData.text != null) {
      final normalizedText = clipboardData.text!.replaceAll(RegExp('[^a-zA-Z0-9]'), "");
      formProvider.addressController.text = normalizedText;
    } else {
      Toast.error("Clipboard text is invalid");
    }
  }

  Future<void> chooseAddress(BuildContext context, WidgetRef ref, SendFormProvider formProvider) async {
    final wallets = ref.read(walletListProvider);

    final address = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Choose an address"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white60),
                ),
              )
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: wallets
                  .map(
                    (w) => TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(w.address);
                      },
                      child: Text(
                        w.fullLabel,
                        style: const TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        });
    if (address != null) {
      formProvider.addressController.text = address;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isWeb = kIsWeb;
    bool isBtc = kIsWeb ? ref.watch(webSessionProvider).usingBtc : ref.watch(sessionProvider).btcSelected;

    const leadingWidth = 70.0;

    final formProvider = ref.read(sendFormProvider.notifier);
    final formState = ref.watch(sendFormProvider);

    String pasteMessage = "Use ctrl+v to paste or click ";

    if (!kIsWeb && Platform.isMacOS) {
      pasteMessage = pasteMessage.replaceAll("ctrl+v", "cmd+v");
    }

    final isMobile = BreakPoints.useMobileLayout(context);
    final btcColor = Theme.of(context).colorScheme.btcOrange;

    double? balance;
    Color color = Colors.white;

    if (isBtc) {
      balance = kIsWeb ? ((ref.watch(webSessionProvider).btcBalanceInfo?.btcFinalBalance) ?? 0.0) : btcAccount!.balance;
      color = btcColor;
    } else {
      balance = isWeb
          ? ref.watch(webSessionProvider).usingRa
              ? ref.watch(webSessionProvider).raBalance
              : ref.watch(webSessionProvider).balance
          : wallet?.balance ?? 0;

      color = wallet!.isReserved ? Colors.deepPurple.shade200 : Colors.white;

      if (kIsWeb) {
        color = ref.watch(webSessionProvider).usingRa ? Colors.deepPurple.shade200 : Colors.white;
      }
    }

    return Form(
      key: formProvider.formKey,
      child: Container(
        decoration: BoxDecoration(boxShadow: glowingBox),
        child: Card(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 72,
                        child: Text("From:"),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!isBtc && wallet!.isReserved && !wallet!.isNetworkProtected)
                              AppBadge(
                                label: 'Not Activated',
                                variant: AppColorVariant.Danger,
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isWeb)
                                  Flexible(
                                    child: Builder(builder: (context) {
                                      String address = "";
                                      switch (ref.watch(webSessionProvider).selectedWalletType) {
                                        case WalletType.rbx:
                                          address = keypair!.address;
                                          break;
                                        case WalletType.ra:
                                          address = raKeypair!.address;
                                          break;
                                        case WalletType.btc:
                                          address = btcWebAccount!.address;
                                      }

                                      return Text(
                                        address,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: color, fontSize: 16),
                                      );
                                    }),
                                  ),
                                if (!isWeb)
                                  PopupMenuButton(
                                    color: Color(0xFF080808),
                                    constraints: BoxConstraints(maxWidth: 500),
                                    itemBuilder: (context) {
                                      final currentWallet = ref.watch(sessionProvider).currentWallet;
                                      final allWallets = ref.watch(walletListProvider);
                                      final allBtcAccounts = ref.watch(btcAccountListProvider);

                                      final list = <PopupMenuEntry<int>>[];

                                      for (final wallet in allWallets) {
                                        final isSelected = !isBtc && currentWallet != null && wallet.address == currentWallet.address;

                                        final color = wallet.isReserved ? Colors.deepPurple.shade200 : Theme.of(context).textTheme.bodyText1!.color!;

                                        list.add(
                                          PopupMenuItem(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (isSelected)
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 4.0),
                                                    child: Icon(Icons.check),
                                                  ),
                                                Text(
                                                  wallet.labelWithoutTruncation,
                                                  style: TextStyle(color: color),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              ref.read(sessionProvider.notifier).setCurrentWallet(wallet);
                                            },
                                          ),
                                        );
                                      }

                                      for (final account in allBtcAccounts) {
                                        final isSelected = isBtc && btcAccount != null && btcAccount!.address == account.address;

                                        final color = btcColor;
                                        list.add(
                                          PopupMenuItem(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (isSelected)
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 4.0),
                                                    child: Icon(Icons.check),
                                                  ),
                                                Text(
                                                  account.address,
                                                  style: TextStyle(color: color),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              ref.read(sessionProvider.notifier).setCurrentBtcAccount(account);
                                            },
                                          ),
                                        );
                                      }
                                      return list;
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          isBtc ? btcAccount!.address : wallet!.address,
                                          style: TextStyle(color: color, fontSize: 16),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 24,
                                          color: isBtc
                                              ? btcColor
                                              : wallet!.isReserved
                                                  ? Colors.deepPurple.shade200
                                                  : Theme.of(context).textTheme.bodyText1!.color!,
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                      !isBtc && (wallet!.lockedBalance == 0 || wallet!.isReserved)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (wallet!.lockedBalance == 0.0)
                                  AppBadge(
                                    label: "$balance RBX",
                                    variant: AppColorVariant.Light,
                                  ),
                                if (wallet!.lockedBalance > 0) ...[
                                  BalanceIndicator(
                                    label: "Available",
                                    value: wallet!.balance,
                                    bgColor: Colors.white,
                                    fgColor: Colors.black,
                                  ),
                                  BalanceIndicator(
                                    label: "Locked",
                                    value: wallet!.lockedBalance,
                                    bgColor: Colors.red.shade700,
                                    fgColor: Colors.white,
                                  ),
                                  BalanceIndicator(
                                    label: "Total",
                                    value: wallet!.balance + wallet!.lockedBalance,
                                    bgColor: Colors.green.shade700,
                                    fgColor: Colors.white,
                                  ),
                                ]
                              ],
                            )
                          : isBtc
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppBadge(
                                      label: kIsWeb
                                          ? "${ref.watch(webSessionProvider).btcBalanceInfo?.btcFinalBalance ?? 0} BTC"
                                          : "${btcAccount!.balance} BTC",
                                      variant: AppColorVariant.Btc,
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    BalanceIndicator(
                                      label: "Available",
                                      value: wallet!.balance,
                                      bgColor: Colors.deepPurple.shade400,
                                      fgColor: Colors.white,
                                    ),
                                    BalanceIndicator(
                                      label: "Locked",
                                      value: wallet!.lockedBalance,
                                      bgColor: Colors.red.shade700,
                                      fgColor: Colors.white,
                                    ),
                                    BalanceIndicator(
                                      label: "Total",
                                      value: wallet!.balance + wallet!.lockedBalance,
                                      bgColor: Colors.green.shade700,
                                      fgColor: Colors.white,
                                    ),
                                  ],
                                ),
                    ],
                  ),
                ),
                ListTile(
                  leading: isMobile ? null : const SizedBox(width: leadingWidth, child: Text("To:")),
                  title: TextFormField(
                    controller: formProvider.addressController,
                    validator: formProvider.addressValidator,
                    decoration: const InputDecoration(hintText: "Recipient's Wallet Address"),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.]')),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(pasteMessage),
                        InkWell(
                          onTap: () {
                            _pasteAddress(formProvider);
                          },
                          child: Text(
                            "here",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        const Text("."),
                      ],
                    ),
                  ),
                  trailing: isMobile
                      ? null
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.paste),
                              onPressed: () {
                                _pasteAddress(formProvider);
                              },
                            ),
                            if (!kIsWeb)
                              IconButton(
                                icon: const Icon(
                                  FontAwesomeIcons.folderOpen,
                                  size: 18,
                                ),
                                onPressed: () {
                                  // _pasteAddress(formProvider);
                                  chooseAddress(context, ref, formProvider);
                                },
                              ),
                          ],
                        ),
                ),
                ListTile(
                  leading: isMobile ? null : const SizedBox(width: leadingWidth, child: Text("Amount:")),
                  title: TextFormField(
                    controller: formProvider.amountController,
                    validator: formProvider.amountValidator,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                    decoration: InputDecoration(hintText: "Amount of ${isBtc ? 'BTC' : 'RBX'} to send"),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                if (isBtc && !kIsWeb)
                  Consumer(builder: (context, ref, _) {
                    final recommendedFees = ref.watch(sessionProvider).btcRecommendedFees ?? BtcRecommendedFees.fallback();

                    int fee = 0;

                    switch (formState.btcFeeRatePreset) {
                      case BtcFeeRatePreset.custom:
                        fee = 0;
                        break;
                      case BtcFeeRatePreset.minimum:
                        fee = recommendedFees.minimumFee;
                        break;
                      case BtcFeeRatePreset.economy:
                        fee = recommendedFees.economyFee;
                        break;
                      case BtcFeeRatePreset.hour:
                        fee = recommendedFees.hourFee;
                        break;
                      case BtcFeeRatePreset.halfHour:
                        fee = recommendedFees.halfHourFee;
                        break;
                      case BtcFeeRatePreset.fastest:
                        fee = recommendedFees.fastestFee;
                        break;
                    }

                    final feeBtc = satashiToBtcLabel(fee);
                    final feeEstimate = satashiTxFeeEstimate(fee);
                    final feeEstimateBtc = btcTxFeeEstimateLabel(fee);

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const SizedBox(width: leadingWidth, child: Text("Fee Rate:")),
                          title: Row(
                            children: [
                              PopupMenuButton<BtcFeeRatePreset>(
                                color: Color(0xFF080808),
                                onSelected: (value) {
                                  formProvider.setBtcFeeRatePreset(value);
                                },
                                itemBuilder: (context) {
                                  return BtcFeeRatePreset.values.map((preset) {
                                    return PopupMenuItem(
                                      value: preset,
                                      child: Text(preset.label),
                                    );
                                  }).toList();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      formState.btcFeeRatePreset.label,
                                      style: TextStyle(fontSize: 16, color: btcColor),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 24,
                                      color: btcColor,
                                    ),
                                  ],
                                ),
                              ),
                              if (formState.btcFeeRatePreset == BtcFeeRatePreset.custom)
                                Expanded(
                                  child: TextFormField(
                                    controller: formProvider.btcCustomFeeRateController,
                                    validator: formProvider.btcCustomFeeRateValidator,
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                                    decoration: InputDecoration(hintText: "Fee rate in satoshis"),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: false),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (formState.btcFeeRatePreset != BtcFeeRatePreset.custom)
                          Padding(
                            padding: const EdgeInsets.only(left: leadingWidth + 30),
                            child: Text(
                              "Fee Estimate: ~$feeEstimate SATS | ~$feeEstimateBtc BTC    ($fee SATS /byte | $feeBtc BTC /byte)",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        if (formState.btcFeeRatePreset == BtcFeeRatePreset.custom)
                          Padding(
                            padding: const EdgeInsets.only(left: leadingWidth + 30),
                            child: Text(
                              "Fee Estimate: ~${formState.btcCustomFeeRate * BTC_TX_EXPECTED_BYTES * BTC_SATOSHI_MULTIPLIER} BTC",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                      ],
                    );
                  }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        label: "Clear",
                        type: AppButtonType.Text,
                        variant: AppColorVariant.Info,
                        onPressed: () {
                          formProvider.formKey.currentState!.reset();
                          formProvider.clear();
                        },
                      ),
                      Consumer(builder: (context, ref, _) {
                        return AppButton(
                          label: "Send",
                          type: AppButtonType.Elevated,
                          variant: AppColorVariant.Btc,
                          processing: formState.isProcessing,
                          disabled: !isBtc && (wallet!.isReserved && !wallet!.isNetworkProtected),
                          onPressed: () async {
                            if (!await passwordRequiredGuard(context, ref)) return;

                            if (!formProvider.formKey.currentState!.validate()) {
                              return;
                            }

                            formProvider.submit();
                          },
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
