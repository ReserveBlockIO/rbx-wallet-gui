import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/web/providers/web_ra_pending_funding_provider.dart';
import 'package:rbx_wallet/features/web/utils/raw_transaction.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebFundRaAccountButton extends BaseComponent {
  const WebFundRaAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keypair = ref.watch(webSessionProvider).raKeypair;
    final hasFunded = ref.watch(webRaPendingFundingProvider).contains(keypair?.address);

    if (keypair == null) {
      return SizedBox();
    }

    return AppButton(
      label: "Fund Account",
      icon: Icons.money_outlined,
      disabled: hasFunded,
      onPressed: () async {
        final confirmed = await ConfirmDialog.show(
          title: "Fund Your Reserve Account",
          body: "Would you like to send 5 RBX from ${ref.watch(webSessionProvider).keypair!.address}?",
          confirmText: "Send",
          cancelText: "Cancel",
        );

        if (confirmed == true) {
          ref.read(globalLoadingProvider.notifier).start();

          final txData = await RawTransaction.generate(
            keypair: ref.read(webSessionProvider).keypair!,
            amount: 5.0,
            toAddress: ref.read(webSessionProvider).raKeypair!.address,
            txType: TxType.rbxTransfer,
          );

          if (txData == null) {
            ref.read(globalLoadingProvider.notifier).complete();
            Toast.error();
            return;
          }

          final tx = await RawService().sendTransaction(transactionData: txData, execute: true, widgetRef: ref);
          if (tx != null) {
            if (tx['Result'] == "Success") {
              Toast.message("5 RBX sent to ${ref.read(webSessionProvider).raKeypair!.address}");
              ref.read(globalLoadingProvider.notifier).complete();
              ref.read(webRaPendingFundingProvider.notifier).addAddress(keypair.address);
              return;
            }
          }

          Toast.error();
          ref.read(globalLoadingProvider.notifier).complete();
        }
      },
    );
  }
}
