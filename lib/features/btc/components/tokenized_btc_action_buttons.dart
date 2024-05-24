import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/btc/models/btc_fee_rate_preset.dart';
import 'package:rbx_wallet/features/btc/models/tokenized_bitcoin.dart';
import 'package:rbx_wallet/features/btc/providers/btc_account_list_provider.dart';
import 'package:rbx_wallet/features/btc/providers/btc_pending_tokenized_address_list_provider.dart';
import 'package:rbx_wallet/features/btc/providers/tokenized_bitcoin_list_provider.dart';
import 'package:rbx_wallet/features/btc/services/btc_fee_rate_service.dart';
import 'package:rbx_wallet/features/btc/services/btc_service.dart';
import 'package:rbx_wallet/features/btc/utils.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/features/nft/utils.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/wallet/models/wallet.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TokenizedBtcActionButtons extends BaseComponent {
  final TokenizedBitcoin token;
  const TokenizedBtcActionButtons({
    super.key,
    required this.token,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingIds = ref.watch(btcPendingTokenizedAddressListProvider);

    bool debuggingAddressExists = true;

    return Builder(
      builder: (context) {
        if (token.btcAddress == null) {
          if (pendingIds.contains(token.smartContractUid)) {
            return Center(
              child: AppBadge(
                label: "BTC Address Pending",
                variant: AppColorVariant.Primary,
              ),
            );
          }

          return Center(
            child: AppButton(
              label: "Generate BTC Address",
              variant: AppColorVariant.Primary,
              icon: Icons.star,
              onPressed: () async {
                final confirmed = await ConfirmDialog.show(
                  title: "Generate BTC Address",
                  body: "Are you sure you want to generate this token's BTC address?",
                  confirmText: "Generate",
                  cancelText: "Cancel",
                );
                if (confirmed == true) {
                  ref.read(globalLoadingProvider.notifier).start();
                  final address = await BtcService().generateTokenizedBitcoinAddress(token.smartContractUid);
                  ref.read(globalLoadingProvider.notifier).complete();

                  if (address == null) {
                    return;
                  }

                  Toast.message("BTC Address generated ($address)");
                  ref.read(logProvider.notifier).append(
                        LogEntry(
                          message: "BTC Address generated ($address)",
                          textToCopy: address,
                          variant: AppColorVariant.Primary,
                        ),
                      );
                  ref.read(tokenizedBitcoinListProvider.notifier).refresh();
                  ref.read(btcPendingTokenizedAddressListProvider.notifier).addScId(token.smartContractUid);
                }
              },
            ),
          );
        }

        return Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            AppButton(
              label: "Copy BTC Address",
              icon: Icons.copy,
              variant: AppColorVariant.Primary,
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: token.btcAddress));
                Toast.message("BTC Address copied to clipboard");
              },
            ),
            AppButton(
              label: "Fund",
              icon: Icons.outbox,
              onPressed: () {
                final btcAccounts = ref.watch(btcAccountListProvider).where((a) => a.balance > 0).toList();

                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalContainer(
                      withDecor: false,
                      withClose: true,
                      children: [
                        Text(
                          "Choose BTC Wallet to Send From",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                        ),
                        Divider(),
                        ListView(
                          shrinkWrap: true,
                          children: [
                            ...btcAccounts.map((account) {
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 2),
                                color: Colors.white10,
                                child: ListTile(
                                  title: Text(account.address),
                                  subtitle: Text("${account.balance} BTC"),
                                  trailing: Icon(Icons.send),
                                  onTap: () async {
                                    Navigator.of(context).pop();

                                    final amount = await PromptModal.show(
                                      title: "BTC Amount",
                                      validator: (v) => formValidatorNumber(v, "Amount"),
                                      labelText: "Amount",
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                                    );

                                    if (amount != null) {
                                      final parsedAmount = double.tryParse(amount);

                                      if (parsedAmount == null) {
                                        Toast.error("Invalid Amount");
                                        return;
                                      }

                                      if (parsedAmount <= 0) {
                                        Toast.error("Amount must be greater than 0.0 BTC");
                                        return;
                                      }

                                      if (parsedAmount > account.balance) {
                                        Toast.error("Insufficient Balance. This account only has ${account.balance} BTC.");
                                        return;
                                      }
                                      ref.read(globalLoadingProvider.notifier).start();
                                      final recommendedFees = await BtcFeeRateService().recommended();
                                      ref.read(globalLoadingProvider.notifier).complete();

                                      final int? feeRate = await showDialog(
                                        context: rootNavigatorKey.currentContext!,
                                        builder: (context) {
                                          BtcFeeRatePreset preset = BtcFeeRatePreset.economy;
                                          return StatefulBuilder(
                                            builder: (context, setState) {
                                              int fee = 0;

                                              return AlertDialog(
                                                title: Text("Fee Rate"),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: BtcFeeRatePreset.values.where((element) => element != BtcFeeRatePreset.custom).map((p) {
                                                    switch (p) {
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

                                                    return ConstrainedBox(
                                                      constraints: BoxConstraints(minWidth: 300),
                                                      child: CheckboxListTile(
                                                        value: p == preset,
                                                        controlAffinity: ListTileControlAffinity.leading,
                                                        onChanged: (v) {
                                                          if (v == true) {
                                                            setState(() {
                                                              preset = p;
                                                            });
                                                          }
                                                        },
                                                        title: Text(p.label),
                                                        subtitle: Text("$fee SATS | ${satashiToBtcLabel(fee)} BTC"),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(null);
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(color: Colors.white70),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(fee);
                                                    },
                                                    child: Text(
                                                      "Continue",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );

                                      if (feeRate == null) {
                                        return;
                                      }

                                      final amountRequired = parsedAmount + satashisToBtc(feeRate);

                                      if (amountRequired > account.balance) {
                                        Toast.error(
                                            "Insufficient Balance. This account only has ${account.balance} BTC. With the fee, the amount required is ${amountRequired.toStringAsFixed(9)} BTC.");
                                        return;
                                      }

                                      final confirmed = await ConfirmDialog.show(
                                        title: "Confirm Transaction",
                                        body: "Sending ${parsedAmount.toStringAsFixed(9)} BTC to ${account.address}",
                                        confirmText: "Send",
                                        cancelText: "Cancel",
                                      );

                                      if (confirmed != true) {
                                        return;
                                      }
                                      ref.read(globalLoadingProvider.notifier).start();

                                      final result = await BtcService().sendTransaction(
                                        amount: parsedAmount,
                                        feeRate: feeRate,
                                        fromAddress: account.address,
                                        toAddress: token.btcAddress ?? "null",
                                      );
                                      ref.read(globalLoadingProvider.notifier).complete();

                                      if (!result.success) {
                                        Toast.error(result.message);
                                        return;
                                      }
                                      final txHash = result.message;
                                      final message = "BTC TX broadcasted with hash of $txHash";
                                      ref.read(logProvider.notifier).append(
                                            LogEntry(
                                              message: message,
                                              textToCopy: txHash,
                                              variant: AppColorVariant.Btc,
                                            ),
                                          );
                                      Toast.message("$amount BTC has been sent to ${token.btcAddress}.");

                                      InfoDialog.show(
                                          title: "Transaction Broadcasted",
                                          buttonColorOverride: Color(0xfff7931a),
                                          content: ConstrainedBox(
                                            constraints: BoxConstraints(maxWidth: 600),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextFormField(
                                                  initialValue: txHash,
                                                  readOnly: true,
                                                  decoration: InputDecoration(
                                                    label: Text(
                                                      "Transaction Hash",
                                                      style: TextStyle(
                                                        color: Color(0xfff7931a),
                                                      ),
                                                    ),
                                                    suffix: IconButton(
                                                      icon: Icon(Icons.copy),
                                                      onPressed: () async {
                                                        await Clipboard.setData(ClipboardData(text: txHash));
                                                        Toast.message("Transaction Hash copied to clipboard");
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                AppButton(
                                                  label: "Open in BTC Explorer",
                                                  variant: AppColorVariant.Btc,
                                                  type: AppButtonType.Text,
                                                  onPressed: () {
                                                    if (Env.isTestNet) {
                                                      launchUrlString("https://live.blockcypher.com/btc-testnet/tx/$txHash/");
                                                    } else {
                                                      launchUrlString("https://live.blockcypher.com/btc/tx/$txHash/");
                                                    }
                                                  },
                                                )
                                              ],
                                            ),
                                          ));
                                    }
                                  },
                                ),
                              );
                            }).toList(),
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 2),
                              color: Colors.white10,
                              child: ListTile(
                                title: Text("Manual Send"),
                                subtitle: Text("Send coin manually to this token's BTC deposit address"),
                                trailing: Icon(Icons.send),
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(text: token.btcAddress));
                                  Toast.message("Send funds to ${token.btcAddress} (address copied to clipboard)");
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              variant: AppColorVariant.Primary,
            ),
            AppButton(
              label: "Transfer",
              variant: AppColorVariant.Primary,
              icon: Icons.send,
              onPressed: () async {
                final int? option = await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ModalContainer(
                        withClose: true,
                        withDecor: false,
                        children: [
                          Text(
                            "Transfer",
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                          ),
                          Card(
                            color: Colors.white10,
                            child: ListTile(
                              title: Text("Transfer Token"),
                              leading: Icon(Icons.toll),
                              subtitle: Text("Transfer the ownership of this token to another VFX wallet."),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.of(context).pop(1);
                              },
                            ),
                          ),
                          Card(
                            color: Colors.white10,
                            child: ListTile(
                              title: Text("Transfer BTC"),
                              leading: Icon(FontAwesomeIcons.btc),
                              subtitle: Text("Transfer a specific portion of the BTC within the token to another BTC address."),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.of(context).pop(2);
                              },
                            ),
                          ),
                          Card(
                            color: Colors.white10,
                            child: ListTile(
                              title: Text("Withdraw BTC"),
                              leading: Icon(FontAwesomeIcons.btc),
                              subtitle: Text("Withdraw BTC..."),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.of(context).pop(3);
                              },
                            ),
                          ),
                          Card(
                            color: Colors.white10,
                            child: ListTile(
                              title: Text("Transfer To Reserve/Protected Account"),
                              leading: Icon(Icons.security),
                              subtitle: Text("Transfer this token to your reserve/protected account."),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () {
                                Navigator.of(context).pop(4);
                              },
                            ),
                          ),
                        ],
                      );
                    });

                if (option == null) {
                  return;
                }

                if (option == 1) {
                  final nft = await NftService().retrieve(token.smartContractUid);
                  if (nft == null) {
                    Toast.error("Could not resolve nft from ${token.smartContractUid}");
                    return;
                  }
                  await initTransferNftProcess(
                    context,
                    ref,
                    nft,
                    backupRequired: false,
                    titleOverride: "Transfer Token",
                    isToken: true,
                  );
                }
                if (option == 2 || option == 3) {
                  final forWithdrawl = option == 3;

                  final result = await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return _TransferSharesModal(
                        forWithdrawl: forWithdrawl,
                      );
                    },
                  );

                  if (result is _TransferShareModalResponse) {
                    final confirmed = await ConfirmDialog.show(
                      title: forWithdrawl ? "Withdraw BTC" : "Transfer BTC",
                      body: forWithdrawl
                          ? "Are you sure you want to withdraw ${result.amount} BTC"
                          : "Are you sure you want to transfer ${result.amount} BTC to ${result.toAddress}?",
                    );

                    if (confirmed != true) {
                      return;
                    }

                    final txHash = await BtcService().transferTokenCoin(token.smartContractUid, result.toAddress, result.amount);
                    final message = "BTC ${forWithdrawl ? "Withdrawl" : "Transfer"} TX Broadcasted successfully with hash for $txHash";
                    Toast.message(message);

                    ref.read(logProvider.notifier).append(
                          LogEntry(message: message, textToCopy: txHash, variant: AppColorVariant.Btc),
                        );
                  }
                }

                if (option == 4) {
                  //TODO choose RA wallet etc.
                  final nft = await NftService().retrieve(token.smartContractUid);
                  if (nft == null) {
                    Toast.error("Could not resolve nft from ${token.smartContractUid}");
                    return;
                  }

                  final wallets = ref.read(walletListProvider).where((w) => w.isReserved).toList();
                  if (wallets.isEmpty) {
                    Toast.error("You don't have any Reserve Accounts in this wallet");
                    return;
                  }

                  final wallet = await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ModalContainer(
                          children: [
                            Text("Choose Reserve Account"),
                            ...wallets
                                .map(
                                  (w) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      boxShadow: glowingBoxRa,
                                    ),
                                    child: Card(
                                      color: Colors.black,
                                      child: ListTile(
                                        title: Text(w.fullLabel),
                                        subtitle: Text(w.balanceLabel),
                                        leading: Icon(Icons.security),
                                        trailing: Icon(Icons.chevron_right),
                                        onTap: () {
                                          Navigator.of(context).pop(w);
                                        },
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                          ],
                        );
                      });

                  if (wallet is Wallet) {
                    await initTransferNftProcess(
                      context,
                      ref,
                      nft,
                      backupRequired: false,
                      titleOverride: "Transfer Token",
                      isToken: true,
                      prefillAddress: wallet.address,
                    );
                  }
                }
              },
            ),
            AppButton(
              label: "Lend",
              icon: Icons.people,
              onPressed: () {
                Toast.message("Action Not Available Yet.");
              },
            ),
            // AppButton(
            //   label: "Unlock",
            //   icon: Icons.lock_open_sharp,
            //   variant: AppColorVariant.Danger,
            //   onPressed: () async {
            //     final confirmed = await ConfirmDialog.show(
            //       title: "Withdraw Token",
            //       body:
            //           "Are you sure you want to unlock and reveal the private key of this BTC token? Once unlocked, the token will become obsolete.",
            //       confirmText: "Reveal",
            //       cancelText: "Cancel",
            //     );

            //     if (confirmed == true) {
            //       final privateKey = await BtcService().withdrawCoin(token.smartContractUid);
            //       if (privateKey == null) {
            //         Toast.error();
            //         return;
            //       }

            //       showDialog(
            //         context: context,
            //         barrierDismissible: false,
            //         builder: (context) {
            //           return AlertDialog(
            //             title: Text("BTC Private Key"),
            //             content: ConstrainedBox(
            //               constraints: BoxConstraints(maxWidth: 600),
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   TextFormField(
            //                     readOnly: true,
            //                     decoration: InputDecoration(
            //                       label: Text(
            //                         "Private Key",
            //                         style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
            //                       ),
            //                       suffixIcon: IconButton(
            //                         icon: Icon(
            //                           Icons.copy,
            //                           color: Theme.of(context).colorScheme.btcOrange,
            //                         ),
            //                         onPressed: () async {
            //                           await Clipboard.setData(ClipboardData(text: privateKey));
            //                           Toast.message("BTC Private Key copied to clipboard");
            //                         },
            //                       ),
            //                     ),
            //                     initialValue: privateKey,
            //                   ),
            //                   TextFormField(
            //                     readOnly: true,
            //                     decoration: InputDecoration(
            //                       label: Text(
            //                         "Address",
            //                         style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
            //                       ),
            //                       suffixIcon: IconButton(
            //                         icon: Icon(
            //                           Icons.copy,
            //                           color: Theme.of(context).colorScheme.btcOrange,
            //                         ),
            //                         onPressed: () async {
            //                           await Clipboard.setData(ClipboardData(text: token.btcAddress));
            //                           Toast.message("BTC Address copied to clipboard");
            //                         },
            //                       ),
            //                     ),
            //                     initialValue: token.btcAddress,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             actions: [
            //               TextButton(
            //                 onPressed: () async {
            //                   final confirmed = await ConfirmDialog.show(
            //                     title: "Confirm Close",
            //                     body: "Have you copy and pasted your private key to a safe location?",
            //                     confirmText: "Yes",
            //                     cancelText: "No",
            //                   );
            //                   if (confirmed == true) {
            //                     Navigator.of(context).pop();
            //                   }
            //                 },
            //                 child: Text(
            //                   "Close",
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               )
            //             ],
            //           );
            //         },
            //       );
            //     }
            //   },
            // ),
          ],
        );
      },
    );
  }
}

class _TransferShareModalResponse {
  final String toAddress;
  final String? fromAddress;
  final double amount;

  _TransferShareModalResponse({
    required this.toAddress,
    this.fromAddress,
    required this.amount,
  });
}

class _TransferSharesModal extends BaseComponent {
  final bool forWithdrawl;
  const _TransferSharesModal({
    super.key,
    required this.forWithdrawl,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final TextEditingController toAddressController = TextEditingController();
    final TextEditingController fromAddressController = TextEditingController();
    final TextEditingController amountControlller = TextEditingController();

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
            children: [
              TextFormField(
                controller: toAddressController,
                decoration: InputDecoration(
                  label: Text(
                    "To BTC Address",
                    style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                  ),
                ),
              ),
              if (forWithdrawl)
                TextFormField(
                  controller: fromAddressController,
                  decoration: InputDecoration(
                    label: Text(
                      "From BTC Address",
                      style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                    ),
                  ),
                ),
              TextFormField(
                controller: amountControlller,
                decoration: InputDecoration(
                  label: Text(
                    "Amount of BTC to Send",
                    style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                  ),
                ),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
              ),
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
                    variant: AppColorVariant.Btc,
                    onPressed: () {
                      final toAddress = toAddressController.text.trim();
                      if (toAddress.isEmpty) {
                        print("Invalid To Address");
                        return;
                      }

                      final fromAddress = forWithdrawl ? fromAddressController.text.trim() : null;
                      if (forWithdrawl && fromAddress!.isEmpty) {
                        print("Invalid From Address");
                        return;
                      }

                      final amount = double.tryParse(amountControlller.text);

                      if (amount == null || amount <= 0) {
                        Toast.error("Invalid Amount");
                        return;
                      }
                      final result = _TransferShareModalResponse(toAddress: toAddress, fromAddress: fromAddress, amount: amount);
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
