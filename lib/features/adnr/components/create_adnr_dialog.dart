import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/adnr/providers/adnr_pending_provider.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/wallet/providers/wallet_list_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

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
        constraints: BoxConstraints(maxWidth: 400),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("RBX Domains cost $ADNR_COST RBX."),
              Text(
                "Your domain must only contain letters and numbers and will automatically be appended with `.rbx` upon verification",
                style: Theme.of(context).textTheme.caption,
              ),
              TextFormField(
                controller: controller,
                validator: (value) => formValidatorAlphaNumeric(value, "Domain Name"),
                decoration: InputDecoration(
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
          child: Text(
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
            ref.read(globalLoadingProvider.notifier).start();
            final result = await TransactionService().createAdnr(address, controller.text);
            ref.read(globalLoadingProvider.notifier).complete();

            if (result.success) {
              Toast.message("Transaction has been broadcasted. See log for hash.");
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
          },
          child: Text(
            "Create",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
