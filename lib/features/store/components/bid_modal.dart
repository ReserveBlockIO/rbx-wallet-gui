import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/store/components/not_accepting_rbx_message.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';
import 'package:rbx_wallet/features/store/models/store_collection.dart';
import 'package:rbx_wallet/features/store/providers/bid_provider.dart';
import 'package:rbx_wallet/features/store/providers/listing_detail_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

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
      return CenteredLoader();
    }

    return AlertDialog(
      backgroundColor: Color(0xFF040f26),
      title: Text(
        "Bid",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: Form(
        key: provider.formKey,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (bid.type == BidType.rbx) Text("Bidding on ${listing.name}. Your bid must be higher than ${listing.minimumBidRbx} RBX"),
          if (bid.type == BidType.creditCard) Text("Bidding on ${listing.name}. Your bid must be higher than \$${listing.minimumBidUsd} USD"),
          Divider(),
          if (session.keypair != null) Text("Email: ${session.keypair!.email}\nAddress: ${session.keypair!.public}"),
          Divider(),
          AppDropdown<BidType>(
            label: "Payment Type",
            selectedValue: bid.type,
            selectedLabel: bid.type == BidType.creditCard ? "Credit Card (USD)" : 'RBX',
            onChange: (val) {
              provider.setType(val);
            },
            options: [
              if (bid.listing!.allowRbx) AppDropdownOption(label: "RBX", value: BidType.rbx),
              if (bid.listing!.allowCC) AppDropdownOption(label: "Credit Card (USD)", value: BidType.creditCard),
            ],
          ),
          if (!listing.allowRbx) NotAcceptingRbxMessage(),
          TextFormField(
            controller: provider.amountController,
            decoration: InputDecoration(
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
            child: Text(
              "Bid",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
