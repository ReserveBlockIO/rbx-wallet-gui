import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_router.gr.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import '../providers/btc_mode_provider.dart';

class BtcRbxSwitch extends BaseComponent {
  const BtcRbxSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(btcModeProvider);
    final provider = ref.read(btcModeProvider.notifier);
    final tabsRouter = AutoTabsRouter.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "RBX",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        Transform.scale(
          scale: 1.1,
          child: Switch(
            value: state,
            thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.btcOrange;
              }
              return Theme.of(context).colorScheme.secondary;
            }),
            onChanged: (val) async {
              provider.set(val);

              await Future.delayed(Duration(milliseconds: 300));

              if (val) {
                AutoRouter.of(context).replace(BtcTabRouter());
              } else {
                AutoRouter.of(context).replace(RootContainerRoute());
              }
            },
          ),
        ),
        Text(
          "BTC",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
