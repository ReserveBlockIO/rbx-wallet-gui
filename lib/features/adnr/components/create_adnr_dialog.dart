import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/bridge/models/log_entry.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class CreateAdnrDialog extends BaseComponent {
  final String address;
  const CreateAdnrDialog({
    required this.address,
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
            final result = await TransactionService().createAdnr(address, controller.text);

            if (result.success) {
              Toast.message("Transaction has been broadcasted. See log for hash.");
              if (result.hash != null) {
                ref.read(logProvider.notifier).append(
                      LogEntry(
                          message: "ADNR create transaction broadcasted. Tx Hash: ${result.hash}",
                          textToCopy: result.hash,
                          variant: AppColorVariant.Success),
                    );
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
