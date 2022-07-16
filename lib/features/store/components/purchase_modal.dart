import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/centered_loader.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/store/components/not_accepting_rbx_message.dart';
import 'package:rbx_wallet/features/store/models/listing.dart';
import 'package:rbx_wallet/features/store/providers/listing_detail_provider.dart';
import 'package:rbx_wallet/features/store/providers/purchase_provider.dart';

class PurchaseModal extends BaseComponent {
  final Listing listing;
  const PurchaseModal({
    Key? key,
    required this.listing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(purchaseProvider(listing.slug).notifier);
    final purchase = ref.watch(purchaseProvider(listing.slug));

    final session = ref.watch(webSessionProvider);

    if (purchase.listing == null) {
      return CenteredLoader();
    }

    return AlertDialog(
      backgroundColor: Color(0xFF040f26),
      title: Text(
        "Buy Now",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      content: Form(
        key: provider.formKey,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (purchase.type == PurchaseType.creditCard) Text("Purchasing ${listing.name}. You will be charged \$${listing.buyNowPrice} USD."),
          if (purchase.type == PurchaseType.rbx) Text("Purchasing ${listing.name}. You will be charged ${listing.buyNowPriceRbx} RBX."),
          Divider(),
          if (session.keypair != null) Text("Email: ${session.keypair!.email}\nAddress: ${session.keypair!.public}"),
          Divider(),
          AppDropdown<PurchaseType>(
            label: "Payment Type",
            selectedValue: purchase.type,
            selectedLabel: purchase.type == PurchaseType.creditCard ? "Credit Card (USD)" : 'RBX',
            onChange: (val) {
              provider.setType(val);
            },
            options: [
              if (listing.allowRbx) AppDropdownOption(label: "RBX", value: PurchaseType.rbx),
              if (listing.allowCC) AppDropdownOption(label: "Credit Card (USD)", value: PurchaseType.creditCard),
            ],
          ),
          if (!listing.allowRbx) NotAcceptingRbxMessage(),
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
              "Purchase",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
