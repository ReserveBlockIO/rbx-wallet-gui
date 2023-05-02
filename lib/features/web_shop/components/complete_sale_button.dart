import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/app_constants.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/transactions/models/web_transaction.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_bid_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CompleteSaleButton extends BaseComponent {
  final WebTransaction tx;

  const CompleteSaleButton({
    super.key,
    required this.tx,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAddress = ref.watch(webSessionProvider).keypair?.address;

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

              ref.read(webBidListProvider(0).notifier).buildSaleCompleteTx(nft, amount, myAddress!, keySign);
            },
          );
        }
      }
    }

    return Icon(Icons.chevron_right);
  }
}
