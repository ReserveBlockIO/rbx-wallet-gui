import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class ValidatingCheckButton extends BaseComponent {
  const ValidatingCheckButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Validator Check",
      icon: Icons.medical_services,
      onPressed: ref.watch(sessionProvider).cliStarted
          ? () async {
              final isValidating = await BridgeService().isValidating();

              if (isValidating == null) {
                Toast.error("A problem occurred checking your validating status. Please restart your wallet and try again.");
                return;
              }

              if (isValidating) {
                InfoDialog.show(
                  headerColor: Colors.white,
                  title: "Validating ✅",
                  content: const Text(
                    "YES you are Validating!",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                InfoDialog.show(
                  title: "Not Validating ❌",
                  headerColor: Colors.white,
                  content: const Text(
                    "NO you are NOT Validating",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }
            }
          : null,
    );
  }
}
