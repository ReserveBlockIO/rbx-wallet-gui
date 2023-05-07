import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/adnr/services/adnr_service.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../../utils/validation.dart';
import '../../bridge/models/log_entry.dart';
import '../../bridge/providers/log_provider.dart';
import '../../global_loader/global_loading_provider.dart';
import '../providers/adnr_pending_provider.dart';

class CreateAdnrDialog extends BaseComponent {
  final String address;
  final String? adnr;
  const CreateAdnrDialog({
    required this.address,
    required this.adnr,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: const Text("New RBX Domain"),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("RBX Domains cost $ADNR_COST RBX."),
              Text(
                "Your domain must only contain letters and numbers and will automatically be appended with `.rbx` upon verification",
                style: Theme.of(context).textTheme.caption,
              ),
              TextFormField(
                controller: controller,
                validator: (value) => formValidatorAlphaNumeric(value, "Domain Name"),
                decoration: const InputDecoration(
                  label: Text("Domain Name"),
                ),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white38),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }

            if (address.length > 65) {
              Toast.error("Maximum characters for domain is 65");
              return;
            }

            if (kIsWeb) {
              final keyPair = ref.read(webSessionProvider).keypair;
              if (keyPair == null) {
                Toast.error("No wallet");
                return;
              }

              final domainWithoutSuffix = controller.text;
              final domain = "$domainWithoutSuffix.rbx";

              ref.read(globalLoadingProvider.notifier).start();

              final available = await ExplorerService().adnrAvailable(domain);

              if (!available) {
                ref.read(globalLoadingProvider.notifier).complete();
                Toast.error("This RBX Domain already exists");
                return;
              }

              final txData = await RawTransaction.generate(
                keypair: ref.read(webSessionProvider).keypair!,
                amount: ADNR_COST,
                toAddress: "Adnr_Base",
                txType: TxType.adnr,
                data: {"Function": "AdnrCreate()", "Name": domainWithoutSuffix},
              );

              ref.read(globalLoadingProvider.notifier).complete();

              if (txData == null) {
                Toast.error("Invalid transaction data.");
                return;
              }

              final txFee = txData['Fee'];

              final confirmed = await ConfirmDialog.show(
                title: "Valid Transaction",
                body:
                    "The RBX Domain transaction is valid.\nAre you sure you want to proceed?\n\nDomain: $domain\nAmount: $ADNR_COST RBX\nFee: $txFee RBX\nTotal: ${ADNR_COST + txFee} RBX",
                confirmText: "Send",
                cancelText: "Cancel",
              );

              if (confirmed != true) {
                Navigator.of(context).pop();
                Toast.message("Transaction Cancelled");
                return;
              }
              ref.read(globalLoadingProvider.notifier).start();

              final tx = await RawService().sendTransaction(transactionData: txData, execute: true, widgetRef: ref);
              ref.read(globalLoadingProvider.notifier).complete();

              if (tx != null && tx['Result'] == "Success") {
                ref.read(adnrPendingProvider.notifier).addId(address, "create", "null");
                Toast.message("RBX Domain Transaction has been broadcasted. See log for hash.");
                Navigator.of(context).pop();

                return;
              }

              Toast.error();
            } else {
              ref.read(globalLoadingProvider.notifier).start();
              final result = await AdnrService().createAdnr(address, controller.text);
              ref.read(globalLoadingProvider.notifier).complete();

              if (result.success) {
                Toast.message("RBX Domain Transaction has been broadcasted. See log for hash.");
                if (result.hash != null) {
                  ref.read(logProvider.notifier).append(
                        LogEntry(
                            message: "ADNR create transaction broadcasted. Tx Hash: ${result.hash}",
                            textToCopy: result.hash,
                            variant: AppColorVariant.Success),
                      );

                  ref.read(adnrPendingProvider.notifier).addId(address, "create", adnr ?? "null");
                }

                Navigator.of(context).pop();
                return;
              }

              Toast.error(result.message);
            }
          },
          child: const Text(
            "Create",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
