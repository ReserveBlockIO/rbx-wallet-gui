import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/store/providers/create_listing_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CreateListingForm extends BaseComponent {
  final int storeId;
  const CreateListingForm({Key? key, required this.storeId}) : super(key: key);

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref, bool forStartsAt) async {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.read(createListingProvider(storeId));

    final d = await showDatePicker(
      context: context,
      initialDate: forStartsAt ? listing.startsAt ?? DateTime.now() : listing.endsAt ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 100),
      ),
    );

    if (d != null) {
      provider.setDate(d, forStartsAt);
    }
  }

  Future<void> handleSubmit(BuildContext context, WidgetRef ref) async {
    final provider = ref.read(createListingProvider(storeId).notifier);

    final slug = await provider.submit();

    if (slug != null) {
      Toast.message("Listing Created!");
      AutoRouter.of(context).push(StoreListingScreenRoute(slug: slug));
    }
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.watch(createListingProvider(storeId));

    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildName(provider),
            buildDescription(provider),
            Divider(),
            buildStartsAt(provider, context, ref),
            buildEndsAt(provider, context, ref),
            Divider(),
            buildNft(),
            buildAuctionSwitch(listing, provider),
            buildBuyNowSwitch(listing, provider),
            if (listing.hasAuction) buildFloorPrice(provider),
            if (listing.hasBuyNow) buildBuyNowPrice(provider),
            Divider(),
            buildSubmit(context, ref),
          ],
        ),
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createListingProvider(storeId).notifier);
    final listing = ref.watch(createListingProvider(storeId));

    return Form(
      key: provider.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildName(provider),
          buildDescription(provider),
          Divider(),
          Row(
            children: [
              Expanded(
                child: buildStartsAt(provider, context, ref),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 2,
                  height: 32,
                  color: Colors.white24,
                ),
              ),
              Expanded(
                child: buildEndsAt(provider, context, ref),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              buildNft(),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  width: 2,
                  height: 32,
                  color: Colors.white24,
                ),
              ),
              buildAuctionSwitch(listing, provider),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  width: 2,
                  height: 32,
                  color: Colors.white24,
                ),
              ),
              buildBuyNowSwitch(listing, provider)
            ],
          ),
          Divider(),
          Row(
            children: [
              if (listing.hasAuction)
                Expanded(
                  child: buildFloorPrice(provider),
                ),
              if (listing.hasAuction && listing.hasBuyNow)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 2,
                    height: 32,
                    color: Colors.white24,
                  ),
                ),
              if (listing.hasBuyNow)
                Expanded(
                  child: buildBuyNowPrice(provider),
                ),
            ],
          ),
          Divider(),
          buildSubmit(context, ref)
        ],
      ),
    );
  }

  Align buildSubmit(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppButton(
        label: "Create",
        onPressed: () {
          handleSubmit(context, ref);
        },
      ),
    );
  }

  TextFormField buildBuyNowPrice(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.buyNowPriceController,
      validator: provider.buyNowPriceValidator,
      decoration: InputDecoration(label: Text("Buy Now Price (USD)")),
      inputFormatters: [
        FilteringTextInputFormatter.deny(',', replacementString: '.'),
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
      ],
    );
  }

  TextFormField buildFloorPrice(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.floorPriceController,
      validator: provider.floorPriceValidator,
      decoration: InputDecoration(label: Text("Auction Floor Price (USD)")),
      inputFormatters: [
        FilteringTextInputFormatter.deny(',', replacementString: '.'),
        FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
      ],
    );
  }

  Row buildBuyNowSwitch(CreateListingModel listing, CreateListingProvider provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
            value: listing.hasBuyNow,
            onChanged: (val) {
              provider.setHasBuyNow(val);
            }),
        SizedBox(
          width: 6,
        ),
        Text("Allow Purchase (Buy Now)")
      ],
    );
  }

  Row buildAuctionSwitch(CreateListingModel listing, CreateListingProvider provider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
            value: listing.hasAuction,
            onChanged: (val) {
              provider.setHasAuction(val);
            }),
        SizedBox(
          width: 6,
        ),
        Text("Allow Bidding (Auction)")
      ],
    );
  }

  AppDropdown<int> buildNft() {
    return AppDropdown(
        label: "NFT",
        selectedValue: 1,
        selectedLabel: "My Fun NFT",
        onChange: (val) {
          print('todo');
        });
  }

  TextFormField buildDescription(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.descriptionController,
      validator: provider.descriptionValidator,
      decoration: InputDecoration(
        label: Text("Auction Description"),
      ),
      minLines: 3,
      maxLines: 6,
    );
  }

  TextFormField buildName(CreateListingProvider provider) {
    return TextFormField(
      controller: provider.nameController,
      validator: provider.nameValidator,
      decoration: InputDecoration(label: Text("Auction Name")),
    );
  }

  TextFormField buildEndsAt(CreateListingProvider provider, BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: provider.endsAtController,
      validator: provider.endsAtValidator,
      onTap: () {
        _showDatePicker(context, ref, false);
      },
      decoration: InputDecoration(
        label: const Text(
          "Ends On",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          onPressed: () {
            _showDatePicker(context, ref, false);
          },
        ),
      ),
    );
  }

  TextFormField buildStartsAt(CreateListingProvider provider, BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: provider.startsAtController,
      validator: provider.startsAtValidator,
      onTap: () {
        _showDatePicker(context, ref, true);
      },
      decoration: InputDecoration(
        label: const Text(
          "Starts On",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          onPressed: () {
            _showDatePicker(context, ref, true);
          },
        ),
      ),
    );
  }
}
