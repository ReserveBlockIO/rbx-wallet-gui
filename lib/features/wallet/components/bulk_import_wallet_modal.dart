import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../bridge/providers/wallet_info_provider.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../providers/wallet_list_provider.dart';
import '../../../utils/toast.dart';

class BulkImportWalletModal extends BaseComponent {
  const BulkImportWalletModal({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    return ModalContainer(
      withDecor: false,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bulk Account Importer",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        const Divider(),
        TextFormField(
          controller: controller,
          minLines: 6,
          maxLines: 10,
          decoration: const InputDecoration(hintText: "Paste in your private keys. Each key should be a separate line."),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            label: "Import",
            variant: AppColorVariant.Success,
            onPressed: () async {
              final value = controller.text;
              if (value.isEmpty) {
                return null;
              }

              final lines = value.split("\n");
              final List<String> linesToImport = [];
              for (final line in lines) {
                final l = line.trim();
                if (l.isNotEmpty) {
                  linesToImport.add(l);
                }
              }

              if (lines.isEmpty) {
                return null;
              }

              final label = "${linesToImport.length} keypair${linesToImport.length == 1 ? '' : 's'}";

              final confirmed = await ConfirmDialog.show(
                title: "Confirm Import",
                body: "Would you like to proceed with importing $label?",
                confirmText: "Import",
                cancelText: "Cancel",
              );
              if (confirmed != true) {
                return null;
              }

              final resync = await ConfirmDialog.show(
                title: "Rescan Blocks?",
                body: "Would you like to rescan the chain to include any transactions relevant to these keys?",
                confirmText: "Yes",
                cancelText: "No",
              );

              for (final privateKey in linesToImport) {
                await ref.read(walletListProvider.notifier).import(privateKey, false, resync == true);
              }

              Toast.message("$label imported!");

              ref.read(walletInfoProvider.notifier).infoLoop(false);
              ref.read(sessionProvider.notifier).mainLoop(false);
              ref.read(sessionProvider.notifier).smartContractLoop(false);

              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}
