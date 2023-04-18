import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/models/bid.dart';
import 'package:rbx_wallet/features/remote_shop/components/bid_status_indicator.dart';
import 'package:rbx_wallet/features/remote_shop/services/remote_shop_service.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/toast.dart';

class BidHistoryModal extends BaseComponent {
  final List<Bid> bids;
  const BidHistoryModal({
    super.key,
    required this.bids,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ModalContainer(
      withClose: true,
      withDecor: false,
      children: [
        const Text(
          "Current Bids",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: bids.map(
            (bid) {
              return ListTile(
                leading: BidStatusIndicator(bid),
                title: Text("${bid.bidAmount} RBX"),
                subtitle: Text(bid.bidAddress),
                trailing: Builder(builder: (context) {
                  final currentAddress = ref.watch(sessionProvider).currentWallet?.address;
                  final isBidder = currentAddress == bid.bidAddress;

                  if (isBidder && bid.bidStatus == BidStatus.Sent) {
                    return AppButton(
                      label: "Resend Bid",
                      onPressed: () async {
                        final success = await RemoteShopService().resendBid(bid.id);
                        if (success) {
                          Toast.message("Bid Resent!");
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  }

                  return Text(bid.bidSendTimeLabel);
                }),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}
