import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';

class ReserveAccountsButton extends BaseComponent {
  const ReserveAccountsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider.select((v) => v.cliStarted));

    return AppButton(
      label: "Vault Accounts",
      icon: Icons.security,
      onPressed: !cliStarted
          ? null
          : () {
              // AutoRouter.of(context).push(ReserveAccountOverviewScreenRoute());
              AutoTabsRouter.of(context).setActiveIndex(14);
            },
    );
  }
}
