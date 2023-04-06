import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/models/bid.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';

class BidHistoryModal extends StatelessWidget {
  final List<Bid> bids;
  const BidHistoryModal({
    super.key,
    required this.bids,
  });

  @override
  Widget build(BuildContext context) {
    return ModalContainer(
      withClose: false,
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
                leading: Builder(
                  builder: (context) {
                    if (bid.bidStatus == BidStatus.Sent) {
                      return AppBadge(
                        label: "Sent",
                        variant: AppColorVariant.Primary,
                      );
                    }

                    if (bid.bidStatus == BidStatus.Received) {
                      return AppBadge(
                        label: "Received",
                        variant: AppColorVariant.Primary,
                      );
                    }

                    if (bid.bidStatus == BidStatus.Accepted) {
                      return AppBadge(
                        label: "Accepted",
                        variant: AppColorVariant.Success,
                      );
                    }

                    if (bid.bidStatus == BidStatus.Rejected) {
                      return AppBadge(
                        label: "Rejected",
                        variant: AppColorVariant.Danger,
                      );
                    }

                    return SizedBox();
                  },
                ),
                title: Text("${bid.bidAmount} RBX"),
                subtitle: Text(bid.bidAddress),
                trailing: Text(bid.bidSendTimeLabel),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}
