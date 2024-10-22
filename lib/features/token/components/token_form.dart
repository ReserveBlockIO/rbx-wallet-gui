import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/cached_memory_image_provider.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/components.dart';
import '../../asset/asset.dart';
import '../../global_loader/global_loading_provider.dart';
import '../../wallet/components/wallet_selector.dart';
import '../../../utils/files.dart';
import '../../../utils/toast.dart';

import '../constants.dart';
import '../providers/token_form_provider.dart';

class TokenForm extends BaseComponent {
  const TokenForm({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(tokenFormProvider.notifier);
    final model = ref.watch(tokenFormProvider);
    return AppCard(
      child: Form(
        key: provider.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!kIsWeb)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Token Owner: "),
                  WalletSelector(
                    includeRbx: true,
                    includeBtc: false,
                    includeRa: false,
                    withOptions: false,
                    truncatedLabel: false,
                    headerHasCopy: false,
                  ),
                ],
              ),
            TextFormField(
              controller: provider.nameController,
              validator: provider.nameValidator,
              decoration: InputDecoration(
                label: Text(
                  "Token Name:",
                  style: TextStyle(color: Colors.white),
                ),
                hintText: "MyToken",
                helperText: "The name of this new token.",
              ),
            ),
            TextFormField(
              controller: provider.tickerController,
              validator: provider.tickerValidator,
              decoration: InputDecoration(
                label: Text(
                  "Token Ticker:",
                  style: TextStyle(color: Colors.white),
                ),
                hintText: "ABC",
                helperText: "The ticker for this new token.",
              ),
              inputFormatters: [UpperCaseTextFormatter(), FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))],
              textCapitalization: TextCapitalization.characters,
              maxLength: TOKEN_TICKER_MAX_LENGTH,
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                provider.setMintable(!model.mintable);
                provider.supplyController.text = '0';
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Checkbox(
                        value: !model.mintable,
                        onChanged: (val) {
                          if (val != null) {
                            provider.setMintable(!val);
                            provider.supplyController.text = '0';
                          }
                        }),
                  ),
                  Text(
                    "Token Has Fixed Supply:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (!model.mintable)
              TextFormField(
                controller: provider.supplyController,
                validator: provider.supplyValidator,
                decoration: InputDecoration(
                  label: Text(
                    "Total Supply:",
                    style: TextStyle(color: Colors.white),
                  ),
                  hintText: "0",
                  helperText: "Use 0 for Infinite (allows minting)",
                ),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Decimal Places:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    onPressed: model.decimalPlaces <= TOKEN_MIN_DECIMAL_PLACES
                        ? null
                        : () {
                            provider.setDecimalPlaces(model.decimalPlaces - 1);
                          },
                  ),
                  SizedBox(
                    width: 28,
                    child: Center(
                      child: Text(
                        model.decimalPlaces.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_up),
                    onPressed: model.decimalPlaces >= TOKEN_MAX_DECIMAL_PLACES
                        ? null
                        : () {
                            provider.setDecimalPlaces(model.decimalPlaces + 1);
                          },
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Is Burnable:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Checkbox(
                    value: model.burnable,
                    onChanged: (val) {
                      if (val != null) {
                        provider.setBurnable(val);
                      }
                    },
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Allow Voting:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Checkbox(
                    value: model.voting,
                    onChanged: (val) {
                      if (val != null) {
                        provider.setVoting(val);
                      }
                    },
                  )
                ],
              ),
            ),
            Row(
              children: [
                if (model.imageBase64 != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: Image(
                        image: CacheMemoryImageProvider(
                          model.imageBase64!,
                          Base64Decoder().convert(model.imageBase64!),
                        ),
                        width: 64,
                        height: 64,
                      ),
                    ),
                  ),
                AppButton(
                  label: model.imageBase64 == null ? "Upload Token Icon" : "Replace Token Icon",
                  onPressed: () async {
                    FilePickerResult? result;

                    if (kIsWeb) {
                      result = await FilePicker.platform.pickFiles(allowedExtensions: ['jpg', 'jpeg', 'gif', 'png', 'webp'], type: FileType.custom);
                      await Future.delayed(Duration(milliseconds: 10));
                      ref.read(globalLoadingProvider.notifier).start();
                      if (result == null || result.files.isEmpty) {
                        ref.read(globalLoadingProvider.notifier).complete();

                        return;
                      }
                      final bytes = result.files.single.bytes;
                      if (bytes == null) {
                        ref.read(globalLoadingProvider.notifier).complete();

                        return;
                      }

                      final base64 = resizeImageAndBase64FromBytes(bytes, 64);
                      if (base64 != null) {
                        provider.setImageBase64(base64);

                        final ext = result.files.single.extension;
                        final filename = result.files.single.name;

                        final url = await ExplorerService().uploadAsset(bytes, filename, ext);

                        final asset = Asset(
                          id: '00000000-0000-0000-0000-000000000000',
                          location: url,
                          extension: ext,
                          fileSize: result.files.single.bytes!.length,
                          bytes: bytes,
                          name: filename,
                        );

                        provider.setWebAsset(asset);
                      } else {
                        Toast.error();
                      }
                      ref.read(globalLoadingProvider.notifier).complete();
                    } else {
                      final Directory currentDir = Directory.current;
                      result = await FilePicker.platform.pickFiles();
                      Directory.current = currentDir;
                      if (result == null || result.files.isEmpty || result.files.first.path == null) {
                        return;
                      }
                      final base64 = resizeImageAndBase64(result.files.first.path!, 64);
                      if (base64 != null) {
                        provider.setImageBase64(base64);
                      } else {
                        Toast.error();
                      }
                    }
                  },
                  icon: Icons.image,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: provider.imageUrlController,
                    decoration: InputDecoration(
                      label: Text(
                        "Token Icon URL:",
                        style: TextStyle(color: Colors.white),
                      ),
                      hintText: "https://domain.com/image.jpg",
                      helperText: "Optional",
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  label: "Cancel",
                  variant: AppColorVariant.Danger,
                  onPressed: () {
                    provider.clear();
                    AutoRouter.of(context).pop();
                  },
                ),
                SizedBox(
                  width: 64,
                ),
                AppButton(
                  label: "Create",
                  onPressed: () async {
                    if (kIsWeb) {
                      final keypair = ref.read(webSessionProvider.select((value) => value.keypair));
                      if (keypair == null) {
                        Toast.error("No account selected");
                        return;
                      }
                    } else {
                      final currentWallet = ref.read(sessionProvider).currentWallet;

                      if (currentWallet == null) {
                        Toast.error("No account selected");
                        return null;
                      }
                    }

                    if (model.imageBase64 == null) {
                      Toast.error("Icon Image Required");
                      return;
                    }

                    if (!provider.formKey.currentState!.validate()) {
                      return;
                    }

                    final confirmed = await ConfirmDialog.show(
                      title: "Compile & Mint Token Smart Contract?",
                      body:
                          "Are you sure you want to proceed?\nOnce compiled you will not be able to make any changes\nand the smart contract/token will be deployed to the chain.",
                      confirmText: "Continue",
                      cancelText: "Cancel",
                    );

                    if (confirmed != true) {
                      return;
                    }

                    final extraConfirm = await ConfirmDialog.show(
                      title: "Confirm Address",
                      body:
                          "This will be minted by ${kIsWeb ? ref.read(webSessionProvider.select((value) => value.keypair))!.address : ref.read(sessionProvider).currentWallet!.labelWithoutTruncation}",
                      confirmText: "Compile & Mint",
                      cancelText: "Cancel",
                    );

                    if (extraConfirm != true) {
                      return;
                    }

                    final success = await provider.submit();

                    if (success == true) {
                      await InfoDialog.show(
                        title: "Stand by",
                        body:
                            "Token Smart Contract mint transaction has been broadcasted.\n\nThe Fungible Token screen will reflect the change once the block is crafted and block height has synced with this transaction.",
                      );

                      provider.clear();

                      AutoRouter.of(context).pop();
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
