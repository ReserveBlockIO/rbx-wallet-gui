import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/nft/components/nft_qr_code.dart';
import 'package:rbx_wallet/features/store/components/store_listing.dart';
import 'package:rbx_wallet/features/store/models/store_collection.dart';
import 'package:rbx_wallet/generated/assets.gen.dart';
import 'package:rbx_wallet/utils/toast.dart';

class StoreCollectionContainer extends BaseComponent {
  final StoreCollection collection;
  const StoreCollectionContainer(this.collection, {Key? key}) : super(key: key);
  Future<void> handleCopyUrl() async {
    final url = window.location.href;
    await Clipboard.setData(ClipboardData(text: url));
    Toast.message("URL copied to clipboard");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 920),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (collection.logoUrl != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Image.network(
                          collection.logoUrl!,
                          width: 400,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      collection.name,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    buildShareButtons(context),
                  ],
                ),
                SizedBox(height: 8),
                Text(collection.description),
              ],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: collection.listings
              .asMap()
              .entries
              .map(
                (entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StoreListing(entry.value, withShareButtons: false, collection: collection),
                      if (entry.key < collection.listings.length - 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 930),
                              child: Container(
                                width: double.infinity,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset.zero,
                                      blurRadius: 5,
                                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                                      spreadRadius: 4,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }

  Row buildShareButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              final url = window.location.href;

              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: NftQrCode(data: url),
                    );
                  });
            },
            icon: Icon(Icons.qr_code)),
        IconButton(
            onPressed: () {
              handleCopyUrl();
            },
            icon: Icon(Icons.link))
      ],
    );
  }
}
