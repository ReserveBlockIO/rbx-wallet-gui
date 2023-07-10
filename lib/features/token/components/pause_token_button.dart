import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/providers/nft_detail_watcher.dart';
import 'package:rbx_wallet/features/token/models/token_account.dart';
import 'package:rbx_wallet/features/token/models/token_sc_feature.dart';
import 'package:rbx_wallet/features/token/providers/pending_token_pause_provider.dart';
import 'package:rbx_wallet/features/token/services/token_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class PauseTokenButton extends BaseComponent {
  final String scId;
  final String fromAddress;

  const PauseTokenButton({
    super.key,
    required this.scId,
    required this.fromAddress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(nftDetailWatcher(scId));

    return data.when(
        loading: () => SizedBox(),
        error: (_, __) => SizedBox(),
        data: (nft) {
          if (nft == null) {
            return SizedBox();
          }

          final isPaused = nft.tokenStateDetails?.isPaused == true;

          if (ref.watch(pendingTokenPauseProvider).contains(nft.id)) {
            return AppButton(
              label: isPaused ? "Pending Resume" : "Pending Pause",
              processing: true,
              variant: AppColorVariant.Light,
              onPressed: () {},
            );
          }

          return AppButton(
            label: isPaused ? "Resume" : "Pause",
            variant: AppColorVariant.Light,
            onPressed: () async {
              final confirmed = await ConfirmDialog.show(
                title: isPaused ? "Resume Token Transactions" : "Pause Token Transactions",
                body: isPaused
                    ? "Are you sure you want to resume token transactions?"
                    : "Are you sure you want to pause token transactions? This will prevent transfers and burning of this token until resumed.",
                confirmText: isPaused ? "Resume" : "Pause",
                cancelText: "Cancel",
              );

              if (confirmed != true) {
                return;
              }

              ref.read(globalLoadingProvider.notifier).start();
              final success = await TokenService().pause(
                scId: scId,
                fromAddress: fromAddress,
              );
              ref.read(globalLoadingProvider.notifier).complete();

              if (success) {
                ref.read(pendingTokenPauseProvider.notifier).addId(scId);

                Toast.message(isPaused ? "Token resume transaction broadcasted" : "Token pause transaction broadcasted");
              }
            },
          );
        });
  }
}
