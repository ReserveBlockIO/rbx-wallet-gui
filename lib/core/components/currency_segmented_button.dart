import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

import '../providers/currency_segmented_button_provider.dart';

class CurrencySegementedButton extends BaseComponent {
  final String family;
  final Function(CurrencyType)? onChange;
  final bool shouldToggleGlobal;
  final bool includeAny;
  const CurrencySegementedButton({
    super.key,
    required this.family,
    this.onChange,
    this.includeAny = true,
    this.shouldToggleGlobal = true,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(currencySegementedButtonProvider(family).notifier);
    final state = ref.watch(currencySegementedButtonProvider(family));

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
                  return Theme.of(context).colorScheme.secondary;
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
            label: Text("Any"),
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
