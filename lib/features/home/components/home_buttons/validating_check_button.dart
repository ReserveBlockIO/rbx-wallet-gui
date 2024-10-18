import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/dialogs.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../bridge/services/bridge_service.dart';
import '../../../../utils/toast.dart';

class ValidatingCheckButton extends BaseComponent {
  const ValidatingCheckButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Validator Check",
      icon: Icons.medical_services,
      onPressed: ref.watch(sessionProvider.select((v) => v.cliStarted))
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
