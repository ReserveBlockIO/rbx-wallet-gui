import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/services/transaction_service.dart';
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
          child: const Text(
            "Create",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
