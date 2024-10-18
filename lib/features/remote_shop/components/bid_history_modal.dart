import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/session_provider.dart';
import '../../dst/models/bid.dart';
import 'bid_status_indicator.dart';
import '../services/remote_shop_service.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../../../utils/toast.dart';

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
                title: Text("${bid.bidAmount} VFX"),
                subtitle: SelectableText(bid.bidAddress),
                trailing: Builder(builder: (context) {
                  final currentAddress = ref.watch(sessionProvider.select((v) => v.currentWallet?.address));
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
