part of './tokenize_btc_onboarding_screen.dart';

class _TransferBtcToVbtcStep extends BaseComponent {
  const _TransferBtcToVbtcStep();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vBtcOnboardProvider.notifier);
    final state = ref.watch(vBtcOnboardProvider);

    if (state.btcAccount == null || state.tokenizedBtc == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("No BTC account / Token Found."),
          AppButton(
            label: "Start Over",
            onPressed: () {
              provider.reset();
            },
          )
        ],
      );
    }

    int fee = 0;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 550),
      child: Form(
        key: provider.btcTransferFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!state.transferToTokenManually) ...[
              Text("From: ${state.btcAccount!.address}"),
              SizedBox(
                height: 8,
              ),
              Text("To: ${state.tokenizedBtc!.btcAddress}"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: provider.btcTransferAmountController,
                validator: (val) => formValidatorNumber(val, "Amount"),
                decoration: InputDecoration(label: Text("Amount to Send (BTC)")),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
              ),
              SizedBox(
                height: 8,
              ),
              Builder(
                builder: (context) {
                  final recommendedFees = ref.watch(sessionProvider).btcRecommendedFees ?? BtcRecommendedFees.fallback();

                  switch (state.btcFeeRatePreset) {
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
                        leading: const SizedBox(width: 100, child: Text("Fee Rate:")),
                        title: Row(
                          children: [
                            PopupMenuButton<BtcFeeRatePreset>(
                              color: Color(0xFF080808),
                              onSelected: (value) {
                                provider.setBtcFeeRatePreset(value);
                              },
                              itemBuilder: (context) {
                                return BtcFeeRatePreset.values.where((type) => type != BtcFeeRatePreset.custom).map((preset) {
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
                                    state.btcFeeRatePreset.label,
                                    style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.btcOrange),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 24,
                                    color: Theme.of(context).colorScheme.btcOrange,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Fee Estimate: ~$feeEstimate SATS | ~$feeEstimateBtc BTC    ($fee SATS /byte | $feeBtc BTC /byte)",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppButton(
                    label: "Initiate Transfer",
                    variant: AppColorVariant.Btc,
                    onPressed: () async {
                      if (!provider.btcTransferFormKey.currentState!.validate()) {
                        return;
                      }
                      final amountParsed = double.tryParse(provider.btcTransferAmountController.text.trim());
                      if (amountParsed == null) {
                        Toast.error("Invalid Amount");
                        return;
                      }

                      if (amountParsed > state.btcAccount!.balance) {
                        Toast.error("Not enough balance in BTC account to send $amountParsed BTC");
                        return;
                      }

                      final success = await provider.transferBtcToVbtc(amountParsed, fee);

                      if (success) {
                        provider.setProcessingState(VBtcProcessingState.waitingForBtcToVbtcTransfer);
                      }
                    },
                  ),
                ),
              ),
            ],
            if (!state.transferToTokenManually) ...[
              Divider(),
              Text("Alternatively, you can send the BTC manually to your token's deposit address."),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: AppButton(
                  label: state.transferToTokenManually ? "Send Automatically" : "Send Manually",
                  type: AppButtonType.Text,
                  underlined: true,
                  onPressed: () {
                    provider.setTransferToTokenManually(!state.transferToTokenManually);
                  },
                  variant: AppColorVariant.Light,
                ),
              ),
            ),
            if (state.transferToTokenManually) ...[
              TextFormField(
                initialValue: state.tokenizedBtc!.btcAddress,
                readOnly: true,
                decoration: InputDecoration(
                  label: Text("BTC Address"),
                  suffix: IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: state.tokenizedBtc!.btcAddress));
                      Toast.message("Address copied to clipboard!");
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: AppButton(
                  label: "I've sent this manually!",
                  type: AppButtonType.Text,
                  underlined: true,
                  onPressed: () {
                    provider.setProcessingState(VBtcProcessingState.waitingForBtcToVbtcTransfer);
                  },
                  variant: AppColorVariant.Btc,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class _TokenizeBtcStep extends BaseComponent {
  const _TokenizeBtcStep();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vBtcOnboardProvider.notifier);
    final state = ref.watch(vBtcOnboardProvider);

    return TokenizeBtcForm(
      onSuccess: () {
        provider.setProcessingState(VBtcProcessingState.waitingForTokenization);
      },
    );
  }
}

class _TransferBtcStep extends BaseComponent {
  const _TransferBtcStep();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vBtcOnboardProvider.notifier);
    final state = ref.watch(vBtcOnboardProvider);

    if (state.btcAccount == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("No BTC Account Found."),
          AppButton(
            label: "Start Over",
            onPressed: () {
              provider.reset();
            },
          )
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: TextFormField(
            initialValue: state.btcAccount!.address,
            readOnly: true,
            decoration: InputDecoration(
              label: Text("BTC Address"),
              suffix: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: state.btcAccount!.address));
                  Toast.message("WIF private key copied to clipboard");
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        AppButton(
          label: "Done!",
          onPressed: () {
            provider.setProcessingState(VBtcProcessingState.waitingForBtcTransfer);
          },
          variant: AppColorVariant.Btc,
        )
      ],
    );
  }
}

class _CreateOrImportVfxWalletStep extends BaseComponent {
  const _CreateOrImportVfxWalletStep();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vBtcOnboardProvider.notifier);
    final state = ref.watch(vBtcOnboardProvider);

    final existingWallets = ref.watch(walletListProvider).where((w) => !w.isReserved).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 16,
          children: [
            AppButton(
              label: "Import Existing",
              icon: Icons.upload,
              onPressed: () async {
                final pkey = await PromptModal.show(
                  title: "Import Wallet",
                  validator: (String? value) => formValidatorNotEmpty(value, "Private Key"),
                  labelText: "Private Key",
                  onValidSubmission: (value) async {},
                );

                if (pkey != null) {
                  final w = await ref.read(walletListProvider.notifier).import(pkey, false);
                  if (w != null) {
                    if (w.balance >= VBTC_ONBOARD_VFX_AMOUNT) {
                      await InfoDialog.show(
                        title: "Balance Found!",
                        body: "A balance of ${w.balance} VFX was found in this account. Skipping to step 3.",
                      );
                    }
                    provider.setVfxWallet(w);
                    Toast.message("VFX Account Imported Successfully");
                  }
                }
              },
              variant: AppColorVariant.Secondary,
            ),
            AppButton(
              label: "Create New",
              icon: Icons.add,
              onPressed: () async {
                final w = await ref.read(walletListProvider.notifier).create();
                if (w != null) {
                  provider.setVfxWallet(w);
                  Toast.message("VFX account Created Successfully");
                }
              },
              variant: AppColorVariant.Secondary,
            )
          ],
        ),
        if (existingWallets.isNotEmpty) ...[
          SizedBox(
            height: 16,
          ),
          Text("Or use one of your existing VFX Accounts:"),
          SizedBox(
            height: 8,
          ),
          ...existingWallets
              .map((w) => InkWell(
                  onTap: () {
                    provider.setVfxWallet(w);
                  },
                  child: Text(
                    w.address,
                    style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline),
                  )))
              .toList(),
        ]
      ],
    );
  }
}

class _FaucetWithdrawlStep extends BaseComponent {
  const _FaucetWithdrawlStep();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vBtcOnboardProvider.notifier);
    final state = ref.watch(vBtcOnboardProvider);

    if (state.vfxWallet == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("No VFX Account Found."),
          AppButton(
            label: "Start Over",
            onPressed: () {
              provider.reset();
            },
          )
        ],
      );
    }

    return Wrap(
      spacing: 16,
      children: [
        AppButton(
          label: "Use Faucet",
          onPressed: () async {
            final phone = await PromptModal.show(
              title: "Phone Number",
              validator: formValidatorPhoneNumber,
              labelText: "Your Phone Number",
            );

            if (phone != null) {
              final cleanPhone = cleanPhoneNumber(phone);
              if (cleanPhone == null) {
                Toast.error("Invalid Phone Number");
                return;
              }

              try {
                final uuid = await ExplorerService().faucetRequest(cleanPhone, VBTC_ONBOARD_VFX_AMOUNT, state.vfxWallet!.address);

                final code = await PromptModal.show(
                  title: "Enter verification code sent to $phone",
                  validator: (v) => formValidatorNumber(v, "Verification Code"),
                  labelText: "Verification Code",
                );

                if (code != null) {
                  final result = await ExplorerService().faucetVerify(uuid, code.trim());

                  Toast.message("Success! Funds are on their way. TX Hash: $result");
                  provider.setProcessingState(VBtcProcessingState.waitingForVfxTransfer);
                }
              } catch (e) {
                print(e);
              }
            }
          },
        ),
        GetVfxButton(
          address: state.vfxWallet!.address,
          vfxOnly: true,
        ),
      ],
    );
  }
}

class _CreateOrImportBtcAccountStep extends BaseComponent {
  const _CreateOrImportBtcAccountStep();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vBtcOnboardProvider.notifier);
    final state = ref.watch(vBtcOnboardProvider);

    final existingAccounts = ref.watch(btcAccountListProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 16,
          children: [
            AppButton(
              label: "Import Existing",
              icon: Icons.upload,
              variant: AppColorVariant.Btc,
              onPressed: () async {
                final privateKeyController = TextEditingController();
                final List<String>? data = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Import BTC Private Key"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Paste in your BTC private key to import your account."),
                          ),
                          ListTile(
                            leading: const Icon(Icons.security),
                            title: TextFormField(
                              controller: privateKeyController,
                              decoration: InputDecoration(
                                  label: Text(
                                "Private Key",
                                style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                              )),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop([privateKeyController.text, "test"]);
                          },
                          child: Text(
                            "Import",
                            style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                          ),
                        )
                      ],
                    );
                  },
                );

                if (data != null) {
                  if (data.length == 2) {
                    final privateKey = data.first;
                    const addressType = BtcAddressType.segwit;
                    final success = await ref.read(btcAccountListProvider.notifier).importPrivateKey(privateKey, addressType);
                    final btcAccountSyncInfo = ref.read(sessionProvider).btcAccountSyncInfo;

                    if (success) {
                      if (btcAccountSyncInfo != null) {
                        Toast.message("Private Key Imported! Please wait until ${btcAccountSyncInfo.nextSyncFormatted} for the balance to sync.");
                      } else {
                        Toast.message("Private Key Imported!");
                      }
                      final account = ref.read(btcAccountListProvider).firstWhereOrNull((a) => a.privateKey == privateKey);
                      if (account != null) {
                        provider.setBtcAccount(account);
                      }
                    } else {
                      Toast.error();
                    }
                  }
                }
              },
            ),
            AppButton(
              label: "Create New",
              icon: Icons.add,
              onPressed: () async {
                final account = await ref.read(btcAccountListProvider.notifier).create();
                if (account == null) {
                  Toast.error();
                  return;
                }

                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("BTC Account Created"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Here are your BTC account details. Please ensure to back up your private key in a safe place."),
                          ),
                          ListTile(
                            leading: const Icon(Icons.account_balance_wallet),
                            title: TextFormField(
                              initialValue: account.address,
                              decoration: InputDecoration(
                                  label: Text(
                                "Address",
                                style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                              )),
                              readOnly: true,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.security),
                            title: TextFormField(
                              initialValue: account.privateKey,
                              decoration: InputDecoration(
                                label: Text("Private Key", style: TextStyle(color: Theme.of(context).colorScheme.btcOrange)),
                              ),
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                              readOnly: true,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.copy,
                                color: Theme.of(context).colorScheme.btcOrange,
                              ),
                              onPressed: () async {
                                await Clipboard.setData(ClipboardData(text: account.privateKey));
                                Toast.message("Private Key copied to clipboard");
                              },
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Done",
                              style: TextStyle(color: Theme.of(context).colorScheme.btcOrange),
                            ))
                      ],
                    );
                  },
                );

                provider.setBtcAccount(account);
              },
              variant: AppColorVariant.Btc,
            )
          ],
        ),
        if (existingAccounts.isNotEmpty) ...[
          SizedBox(
            height: 16,
          ),
          Text("Or use one of your existing BTC Accounts:"),
          SizedBox(
            height: 8,
          ),
          ...existingAccounts
              .map((a) => InkWell(
                  onTap: () {
                    provider.setBtcAccount(a);
                  },
                  child: Text(
                    a.address,
                    style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline),
                  )))
              .toList(),
        ]
      ],
    );
  }
}
