import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/features/bridge/providers/wallet_info_provider.dart';
import '../../../../core/app_router.gr.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../utils/toast.dart';

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
          : () {
              if (ref.read(walletInfoProvider)!.lastestBlock!.height < BLOCK_LOCK_4) {
                Toast.error("Reserve Accounts are locked until block $BLOCK_LOCK_4.");
                return;
              }

              AutoRouter.of(context).push(ReserveAccountOverviewScreenRoute());
            },
    );
  }
}
