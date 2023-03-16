import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/features/encrypt/utils.dart';
import 'package:rbx_wallet/features/reserve/screens/reserve_account_overview_screen.dart';
import 'package:rbx_wallet/features/reserve/services/reserve_account_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/wallet/components/wallet_selector.dart';
import 'package:rbx_wallet/utils/validation.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';

class ReserveAccountsButton extends BaseComponent {
  const ReserveAccountsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider).cliStarted;

    return AppButton(
      label: "Reserve Accounts",
      icon: Icons.security,
      onPressed: !cliStarted
          ? null
          : () async {
              AutoRouter.of(context).push(ReserveAccountOverviewScreenRoute());
              return;

              if (!await passwordRequiredGuard(context, ref)) return;

              final createNew = await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalContainer(
                      withDecor: false,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Reserve accounts are protected accounts that are timelocked and recoverable.\nCreate or recover one now.")),
                        ListTile(
                          title: Text("New Reserve Account"),
                          trailing: Icon(Icons.chevron_right),
                          leading: Icon(Icons.add),
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        ListTile(
                          title: Text("Recover Reserve Account"),
                          trailing: Icon(Icons.chevron_right),
                          leading: Icon(Icons.rotate_90_degrees_cw_rounded),
                          onTap: () {
                            Navigator.of(context).pop(false);
                          },
                        )
                      ],
                    );
                  });

              if (createNew == null) {
                return;
              }

              if (createNew == false) {
                final restoreCode = await PromptModal.show(title: "Restore Code", validator: (v) => null, labelText: "Restore Code");
                if (restoreCode == null) return;
                final password =
                    await PromptModal.show(title: "Password", validator: (v) => null, lines: 1, obscureText: true, labelText: "Password");
                if (password == null) return;

                final account = await ReserveAccountService().recover(restoreCode: restoreCode, password: password);
                if (account != null) {
                  await ref.read(sessionProvider.notifier).loadWallets();

                  showDialog(
                      context: context,
                      builder: (context) {
                        return ReserveAccountDetails(account: account);
                      });
                }
                return;
              }
              await PromptModal.show(
                  title: "New Reserve Account",
                  body: "Reserve accounts are timelocked and recoverable accounts.\n\nCreate a password to continue.",
                  validator: (value) => formValidatorNotEmpty(value, "Password"),
                  labelText: "Password",
                  obscureText: true,
                  lines: 1,
                  onValidSubmission: (password) async {
                    if (password.isNotEmpty) {
                      final account = await ReserveAccountService().create(password);
                      if (account == null) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return ReserveAccountDetails(account: account);
                          });
                    }
                  });
            },
    );
  }
}
