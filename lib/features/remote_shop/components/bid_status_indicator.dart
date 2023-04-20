import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/models/bid.dart';

class BidStatusIndicator extends StatelessWidget {
  final Bid bid;
  const BidStatusIndicator(
    this.bid, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
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
    );
  }
}
