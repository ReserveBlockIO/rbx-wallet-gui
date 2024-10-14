import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../base_component.dart';
import '../providers/session_provider.dart';
import '../theme/app_theme.dart';
import '../../features/btc/providers/btc_account_list_provider.dart';
import '../../features/wallet/providers/wallet_list_provider.dart';

import '../providers/currency_segmented_button_provider.dart';
import '../theme/colors.dart';

class CurrencySegementedButton extends BaseComponent {
  final Function(CurrencyType)? onChange;
  final bool shouldToggleGlobal;
  final bool includeAny;
  const CurrencySegementedButton({
    super.key,
    this.onChange,
    this.includeAny = true,
    this.shouldToggleGlobal = true,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(currencySegementedButtonProvider.notifier);
    final state = ref.watch(currencySegementedButtonProvider);

    return SegmentedButton<CurrencyType>(
      multiSelectionEnabled: false,
      selectedIcon: null,
      showSelectedIcon: false,
      selected: {state},
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            width: 1,
            color: Colors.white54,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              switch (state) {
                case CurrencyType.any:
                  return Colors.white;
                case CurrencyType.vfx:
                  return AppColors.getBlue();
                case CurrencyType.btc:
                  return Theme.of(context).colorScheme.btcOrange;
              }
            }
            return Colors.black;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.primary;
            }
            return Colors.white;
          },
        ),
      ),
      onSelectionChanged: (value) {
        provider.set(value.first);

        if (onChange != null) {
          onChange!(value.first);
        }

        if (shouldToggleGlobal) {
          switch (value.first) {
            case CurrencyType.any:
              if (ref.read(sessionProvider).btcSelected) {
                if (ref.read(btcAccountListProvider).isEmpty) {
                  ref.read(sessionProvider.notifier).toggleToVfxWallet();
                }
              } else {
                if (ref.read(walletListProvider).isEmpty) {
                  ref.read(sessionProvider.notifier).toggleToBtcWallet();
                }
              }

              return;
            case CurrencyType.vfx:
              ref.read(sessionProvider.notifier).toggleToVfxWallet();
              return;
            case CurrencyType.btc:
              ref.read(sessionProvider.notifier).toggleToBtcWallet();

              return;
          }
        }
      },
      segments: [
        if (includeAny)
          ButtonSegment(
            label: Text("All"),
            value: CurrencyType.any,
          ),
        ButtonSegment(
          label: Text("VFX"),
          value: CurrencyType.vfx,
        ),
        ButtonSegment(
          label: Text("BTC"),
          value: CurrencyType.btc,
        ),
      ],
    );
  }
}
