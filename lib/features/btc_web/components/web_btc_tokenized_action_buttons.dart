import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../btc/models/tokenized_bitcoin.dart';
import '../../btc/providers/btc_pending_tokenized_address_list_provider.dart';
import '../../btc/utils.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../../wallet/providers/wallet_list_provider.dart';
import '../../../utils/toast.dart';

import '../../token/providers/web_token_actions_manager.dart';
import '../models/btc_web_vbtc_token.dart';

class WebTokenizedBtcActionButtons extends BaseComponent {
  final BtcWebVbtcToken token;
  final bool isOwner;
  const WebTokenizedBtcActionButtons({
    super.key,
    required this.token,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAddress = ref.watch(webSessionProvider.select((value) => value.keypair?.address));
    final myBalance = myAddress != null ? token.balanceForAddress(myAddress) : 0.0;

    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        AppButton(
          label: "Copy Deposit Address",
          icon: Icons.copy,
          variant: AppColorVariant.Primary,
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: token.depositAddress));
            Toast.message("BTC Address copied to clipboard");
          },
        ),
        if (isOwner)
          AppButton(
            label: "Fund",
            icon: Icons.outbox,
            onPressed: () {},
            variant: AppColorVariant.Primary,
          ),
        AppButton(
          label: "Withdraw",
          icon: Icons.download,
          variant: AppColorVariant.Primary,
          onPressed: () async {},
        ),
        AppButton(
          label: "Transfer Ownership",
          icon: Icons.person,
          variant: AppColorVariant.Primary,
          onPressed: () async {
            final manager = ref.read(webTokenActionsManager);
            if (!manager.verifyBalance()) {
              return;
            }

            final toAddress = await manager.promptForAddress(title: "Transfer to");
            if (toAddress == null) {
              return;
            }

            final success = await manager.transferVbtcOwnership(token, toAddress);
          },
        ),
        AppButton(
          label: "Transfer",
          variant: AppColorVariant.Primary,
          icon: Icons.send,
          onPressed: () async {
            final manager = ref.read(webTokenActionsManager);
            if (!manager.verifyBalance()) {
              return;
            }

            final toAddress = await manager.promptForAddress(title: "Transfer to");
            if (toAddress == null) {
              return;
            }

            final amount = await manager.promptForAmount(title: "Amount to Transfer");
            if (amount == null) {
              return;
            }

            if (amount > myBalance) {
              Toast.error("Your balance is insufficent.");
              return;
            }

            final success = await manager.transferVbtcAmount(token, toAddress, amount);
          },
        ),
        AppButton(
          label: "Borrow/Lend",
          icon: Icons.people,
          onPressed: () {
            Toast.message("Action Not Available Yet.");
          },
        ),
      ],
    );
  }
}

class _TransferShareModalResponse {
  final String toAddress;
  final double amount;
  final int feeRate;

  _TransferShareModalResponse({
    required this.toAddress,
    required this.amount,
    this.feeRate = 0,
  });
}

class _TransferSharesModal extends BaseComponent {
  final TokenizedBitcoin token;
  final bool forWithdrawl;
  _TransferSharesModal({
    required this.token,
    required this.forWithdrawl,
  });

  final TextEditingController toAddressController = TextEditingController();
  // final TextEditingController fromAddressController = TextEditingController(text: forWithdrawl ? token.rbxAddress : '');
  final TextEditingController amountControlller = TextEditingController();

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme.btcOrange;
    // int fee = 0;
    // BtcFeeRatePreset btcFeeRatePreset = BtcFeeRatePreset.economy;
    int fee = 0;

    return ModalContainer(
      withClose: true,
      withDecor: false,
      children: [
        Text(
          forWithdrawl ? "Withdraw BTC" : "Transfer BTC",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 8,
        ),
        Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: toAddressController,
                decoration: InputDecoration(
                  label: Text(
                    forWithdrawl ? "To BTC Address" : "To VFX Address",
                    style: TextStyle(color: color),
                  ),
                ),
              ),
              // if (forWithdrawl)
              //   TextFormField(
              //     controller: fromAddressController,
              //     readOnly: true,
              //     decoration: InputDecoration(
              //       label: Text(
              //         "From VFX Address",
              //         style: TextStyle(color: color),
              //       ),
              //     ),
              //   ),
              TextFormField(
                controller: amountControlller,
                decoration: InputDecoration(
                  label: Text(
                    "Amount of BTC to Send",
                    style: TextStyle(color: color),
                  ),
                ),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Fee Rate: $BTC_WITHDRAWL_FEE_RATE SATS per byte (${satashiToBtcLabel(BTC_WITHDRAWL_FEE_RATE)} BTC per byte)"),
              ),
              Text(
                "This is a Multi-signature. The fee rate has been calculated for you.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              // if (forWithdrawl)
              //   Builder(
              //     builder: (context) {
              //       final state = ref.watch(vBtcOnboardProvider);

              //       final recommendedFees = ref.watch(sessionProvider).btcRecommendedFees ?? BtcRecommendedFees.fallback();

              //       switch (state.btcFeeRatePreset) {
              //         case BtcFeeRatePreset.custom:
              //           fee = 1;
              //           break;
              //         case BtcFeeRatePreset.minimum:
              //           fee = recommendedFees.minimumFee;
              //           break;
              //         case BtcFeeRatePreset.economy:
              //           fee = recommendedFees.economyFee;
              //           break;
              //         case BtcFeeRatePreset.hour:
              //           fee = recommendedFees.hourFee;
              //           break;
              //         case BtcFeeRatePreset.halfHour:
              //           fee = recommendedFees.halfHourFee;
              //           break;
              //         case BtcFeeRatePreset.fastest:
              //           fee = recommendedFees.fastestFee;
              //           break;
              //       }

              //       final feeBtc = satashiToBtcLabel(fee);
              //       final feeEstimate = satashiTxFeeEstimate(fee);
              //       final feeEstimateBtc = btcTxFeeEstimateLabel(fee);

              //       return Column(
              //         mainAxisSize: MainAxisSize.min,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           ListTile(
              //             contentPadding: EdgeInsets.zero,
              //             leading: const SizedBox(width: 100, child: Text("Fee Rate:")),
              //             title: Row(
              //               children: [
              //                 PopupMenuButton<BtcFeeRatePreset>(
              //                   color: Color(0xFF080808),
              //                   onSelected: (value) {
              //                     ref.read(vBtcOnboardProvider.notifier).setBtcFeeRatePreset(value);
              //                   },
              //                   itemBuilder: (context) {
              //                     return BtcFeeRatePreset.values.where((type) => type != BtcFeeRatePreset.custom).map((preset) {
              //                       return PopupMenuItem(
              //                         value: preset,
              //                         child: Text(preset.label),
              //                       );
              //                     }).toList();
              //                   },
              //                   child: Row(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       Text(
              //                         state.btcFeeRatePreset.label,
              //                         style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.btcOrange),
              //                       ),
              //                       Icon(
              //                         Icons.arrow_drop_down,
              //                         size: 24,
              //                         color: Theme.of(context).colorScheme.btcOrange,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           SizedBox(
              //             height: 8,
              //           ),
              //           Text(
              //             "Fee Estimate: ~$feeEstimate SATS | ~$feeEstimateBtc BTC    ($fee SATS /byte | $feeBtc BTC /byte)",
              //             style: Theme.of(context).textTheme.caption,
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    label: "Cancel",
                    type: AppButtonType.Text,
                    variant: AppColorVariant.Light,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  AppButton(
                    label: forWithdrawl ? "Withdraw" : "Transfer",
                    variant: forWithdrawl ? AppColorVariant.Secondary : AppColorVariant.Btc,
                    onPressed: () {
                      final toAddress = toAddressController.text.trim();
                      if (toAddress.isEmpty) {
                        print("Invalid To Address");
                        return;
                      }

                      // final fromAddress = forWithdrawl ? fromAddressController.text.trim() : null;
                      // if (forWithdrawl && fromAddress!.isEmpty) {
                      //   print("Invalid From Address");
                      //   return;
                      // }

                      final amount = double.tryParse(amountControlller.text);

                      if (amount == null || amount <= 0) {
                        Toast.error("Invalid Amount");
                        return;
                      }
                      print("-----");

                      if (amount > token.myBalance) {
                        Toast.error("Not enough balance");
                        return;
                      }
                      final result = _TransferShareModalResponse(toAddress: toAddress, amount: amount, feeRate: fee);
                      Navigator.of(context).pop(result);
                    },
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
