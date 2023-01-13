import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/theme/app_theme.dart';
import '../models/listing.dart';

class BidHistory extends BaseComponent {
  final Listing listing;
  const BidHistory({
    Key? key,
    required this.listing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: Color(0xFF040f26),
      title: Text(
        "Bid History",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: listing.bids.isEmpty
          ? Text("No bids yet.")
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 300),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: listing.bids.map((bid) {
                          return ListTile(
                            minLeadingWidth: 0,
                            visualDensity: VisualDensity.compact,
                            horizontalTitleGap: 0,
                            title: Text("${bid.amountLabel} (${bid.walletAddress}"),
                            subtitle: Text(bid.createdAtLabel),
                          );
                        }).toList(),
                      ),
                    ))
              ],
            ),
      actions: [
        TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.info,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Close",
              style: TextStyle(color: Theme.of(context).colorScheme.info),
            )),
      ],
    );
  }
}
