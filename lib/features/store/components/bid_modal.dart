import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/components/dropdowns.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/validation.dart';
import '../models/listing.dart';
import '../providers/bid_provider.dart';
import '../providers/listing_detail_provider.dart';
import 'not_accepting_rbx_message.dart';

class BidModal extends BaseComponent {
  final Listing listing;

  const BidModal({
    Key? key,
    required this.listing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(bidProvider(listing.slug).notifier);
    final bid = ref.watch(bidProvider(listing.slug));

    final session = ref.watch(webSessionProvider);

    if (bid.listing == null) {
      return const CenteredLoader();
    }

    return AlertDialog(
      backgroundColor: const Color(0xFF040f26),
      title: const Text(
        "Bid",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: Form(
        key: provider.formKey,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (bid.type == BidType.rbx) Text("Bidding on ${listing.name}. Your bid must be higher than ${listing.minimumBidRbx} RBX"),
          if (bid.type == BidType.creditCard) Text("Bidding on ${listing.name}. Your bid must be higher than \$${listing.minimumBidUsd} USD"),
          const Divider(),
          if (session.keypair != null) Text("Email: ${session.keypair!.email}\nAddress: ${session.keypair!.public}"),
          const Divider(),
          AppDropdown<BidType>(
            label: "Payment Type",
            selectedValue: bid.type,
            selectedLabel: bid.type == BidType.creditCard ? "Credit Card (USD)" : 'RBX',
            onChange: (val) {
              provider.setType(val);
            },
            options: [
              if (bid.listing!.allowRbx) const AppDropdownOption(label: "RBX", value: BidType.rbx),
              if (bid.listing!.allowCC) const AppDropdownOption(label: "Credit Card (USD)", value: BidType.creditCard),
            ],
          ),
          if (!listing.allowRbx) const NotAcceptingRbxMessage(),
          TextFormField(
            controller: provider.amountController,
            decoration: const InputDecoration(
              label: Text("Bid Amount"),
            ),
            validator: (value) => formValidatorNumber(value, "Amount"),
            inputFormatters: [
              FilteringTextInputFormatter.deny(',', replacementString: '.'),
              FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
            ],
          ),
        ]),
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
              Navigator.of(context).pop(null);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Theme.of(context).colorScheme.info),
            )),
        TextButton(
            style: TextButton.styleFrom(
              primary: Theme.of(context).colorScheme.info,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              final success = await provider.submit();

              if (success == true) {
                ref.refresh(listingDetailProvider(listing.slug));
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              "Bid",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
