import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_constants.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/services/explorer_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../transactions/models/web_transaction.dart';
import '../providers/web_shop_bid_provider.dart';

class CompleteSaleButton extends BaseComponent {
  final WebTransaction tx;
  final Widget fallbackWidget;

  const CompleteSaleButton({
    super.key,
    required this.tx,
    required this.fallbackWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAddress = ref.watch(webSessionProvider.select((v) => v.keypair?.address));

    if (tx.type == TxType.nftSale) {
      if (myAddress != null && tx.toAddress == myAddress) {
        final function = tx.nftDataValue("Function");
        final nftId = tx.nftDataValue("ContractUID");
        final keySign = tx.nftDataValue("KeySign");
        final amount = tx.nftDataValueDouble("SoldFor");

        if (function == "Sale_Start()" && nftId != null && keySign != null && amount != null) {
          return AppButton(
            label: "Complete Sale",
            variant: AppColorVariant.Success,
            icon: Icons.check,
            size: AppSizeVariant.Lg,
            onPressed: () async {
              final nft = await ExplorerService().retrieveNft(nftId);
              if (nft == null) {
                return;
              }

              if (nft.currentOwner == myAddress) {
                Toast.error("You are already the owner of this NFT.");
                return;
              }

              ref.read(webBidListProvider(0).notifier).buildSaleCompleteTx(nft, amount, myAddress, keySign);
            },
          );
        }
      }
    }

    return fallbackWidget;
  }
}
