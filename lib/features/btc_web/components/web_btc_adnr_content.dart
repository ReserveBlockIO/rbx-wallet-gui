import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/adnr/components/create_adnr_dialog.dart';
import 'package:rbx_wallet/features/adnr/providers/adnr_pending_provider.dart';
import 'package:rbx_wallet/features/btc_web/models/btc_web_account.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/components.dart';

class WebBtcAdnrContent extends BaseComponent {
  final BtcWebAccount account;
  const WebBtcAdnrContent({super.key, required this.account});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(webSessionProvider);

    final address = account.address;
    const adnr = null;

    final rbxBalance = session.balance ?? 0;

    final isPendingCreate = ref.watch(adnrPendingProvider).contains("$address.create.${adnr ?? 'null'}");
    final isPendingBurn = ref.watch(adnrPendingProvider).contains("$address.delete.${adnr ?? 'null'}");
    final isPendingTransfer = ref.watch(adnrPendingProvider).contains("$address.transfer.${adnr ?? 'null'}");

    if (isPendingCreate) {
      return const Center(
        child: AppBadge(
          label: "BTC Domain Pending",
          variant: AppColorVariant.Success,
        ),
      );
    }

    if (isPendingTransfer) {
      return const Center(
        child: AppBadge(
          label: "BTC Domain Transfer Pending",
          variant: AppColorVariant.Primary,
        ),
      );
    }

    if (isPendingBurn) {
      return const Center(
        child: AppBadge(
          label: "BTC Domain Delete Pending",
          variant: AppColorVariant.Danger,
        ),
      );
    }

    if (adnr == null) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: AppCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create a BTC Domain as an alias to your account's address for receiving funds.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "BTC domains cost $ADNR_COST VFX plus the transaction fee.",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Divider(),
                ),
                AppButton(
                  label: "Create Domain",
                  variant: AppColorVariant.Btc,
                  onPressed: () async {
                    if (rbxBalance < (ADNR_COST + MIN_RBX_FOR_SC_ACTION)) {
                      Toast.error("Not enough VFX in your account to create a VFX domain. $ADNR_COST RBX required (plus TX fee).");
                      return;
                    }

                    await showDialog(
                      context: context,
                      builder: (context) {
                        return CreateAdnrDialog(
                          address: address,
                          adnr: "",
                          isBtc: true,
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    }

    return Text("TODO");
  }
}
