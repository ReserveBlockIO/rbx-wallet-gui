import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/colors.dart';
import 'package:rbx_wallet/core/theme/components.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../providers/tokenize_btc_form_provider.dart';

class TokenizeBtcScreen extends BaseScreen {
  const TokenizeBtcScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text("Tokenize BTC (vBTC)"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: TokenizeBtcForm(
        onSuccess: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class TokenizeBtcForm extends BaseComponent {
  final VoidCallback onSuccess;
  const TokenizeBtcForm({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(tokenizeBtcFormProvider);
    final formProvider = ref.read(tokenizeBtcFormProvider.notifier);
    return AppCard(
      padding: 16,
      child: Form(
        key: formProvider.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: formProvider.tokenNameController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.getWhite()),
                ),
                label: Text(
                  "Token Name (Optional)",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                hintText: "vBTC Token",
              ),
            ),
            TextFormField(
              controller: formProvider.tokenDescriptionController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.getWhite()),
                ),
                label: Text(
                  "Token Description (Optional)",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                hintText: "vBTC Token",
              ),
              minLines: 3,
              maxLines: 3,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Token Image (Optional)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            FileSelector(
              asset: formState.asset,
              allowedExtensions: IMAGE_EXTENSIONS,
              resizeToSquareWidth: 200,
              transparentBackground: true,
              onChange: (a) {
                formProvider.setAsset(a);
              },
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Media (Optional)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: formState.additionalAssets.length,
                itemBuilder: (context, index) {
                  final asset = formState.additionalAssets[index];
                  return FileSelector(
                    key: Key("${index}_${asset.fileName}"),
                    asset: asset,
                    onChange: (a) {
                      if (a != null) {
                        formProvider.replaceAdditionalAsset(index, a);
                      } else {
                        formProvider.removeAdditionalAsset(index);
                      }
                    },
                  );
                }),
            FileSelector(
              transparentBackground: true,
              onChange: (a) {
                if (a != null) {
                  formProvider.addAdditonalAsset(a);
                }
              },
            ),
            SizedBox(
              height: 22,
            ),
            Center(
              child: VBtcButton(
                // processing: formState.isProcessing,
                label: "Compile & Mint",
                // variant: AppColorVariant.Light,
                onPressed: () async {
                  if (formState.vfxAddress == null) {
                    Toast.error("A VFX address is required");
                    return;
                  }

                  if (formState.isProcessing) {
                    return;
                  }

                  final confirmed = await ConfirmDialog.show(
                      title: "Compile & Mint?",
                      cancelText: "Cancel",
                      confirmText: "Compile & Mint",
                      content: Consumer(builder: (context, ref, child) {
                        final formState = ref.watch(tokenizeBtcFormProvider);
                        final formProvider = ref.read(tokenizeBtcFormProvider.notifier);

                        final wallets = ref.watch(walletListProvider).where((a) => a.balance > MIN_RBX_FOR_SC_ACTION && !a.isReserved);

                        return ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("This transaction requires a network fee ~0.000028 VFX."),
                              if (wallets.length == 1) Text("VFX Account: ${formState.vfxAddress}"),
                              if (wallets.length > 1)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text("Change Account:"),
                                    Row(
                                      children: [
                                        PopupMenuButton<String>(
                                          onSelected: (address) {
                                            formProvider.setAddress(address);
                                          },
                                          color: Color(0xFF080808),
                                          constraints: const BoxConstraints(
                                            minWidth: 2.0 * 56.0,
                                            maxWidth: 8.0 * 56.0,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("VFX Address:"),
                                              SizedBox(width: 4),
                                              Text(
                                                formState.vfxAddress ?? "None",
                                                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                                              ),
                                              Transform.translate(
                                                offset: Offset(0, 2),
                                                child: Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          itemBuilder: (context) {
                                            return wallets.map(
                                              (w) {
                                                return PopupMenuItem(
                                                  value: w.address,
                                                  child: Text(
                                                    "${w.labelWithoutTruncation} (${w.balance} VFX)",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          w.address == formState.vfxAddress ? Theme.of(context).colorScheme.secondary : Colors.white,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 12,
                              ),
                              Text("Continue?")
                            ],
                          ),
                        );
                      }));

                  if (confirmed != true) {
                    return;
                  }

                  final compileAnimation = Completer<BuildContext>();
                  formProvider.showCompileAnimation(context, compileAnimation);
                  final dialogContext = await compileAnimation.future;

                  await Future.delayed(Duration(seconds: 2));

                  final success = await formProvider.submit();

                  if (success == true) {
                    Navigator.pop(dialogContext);
                    final completeAnimation = Completer<BuildContext>();
                    formProvider.showCompileComplete(context, completeAnimation);
                    final completedDialogContext = await completeAnimation.future;
                    await Future.delayed(const Duration(seconds: 3));
                    Navigator.pop(completedDialogContext);
                    await InfoDialog.show(
                      title: "Transaction Broadcasted",
                      body: "Once this transaction reflects on chain, you'll be able to deposit BTC funds in this vBTC token.",
                    );

                    onSuccess();
                  } else {
                    Navigator.pop(dialogContext);
                  }
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
