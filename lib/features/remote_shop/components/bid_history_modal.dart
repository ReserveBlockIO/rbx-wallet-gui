import 'package:flutter/material.dart';
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
                leading: Icon(Icons.gavel),
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
