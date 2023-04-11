import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/dst/components/nft_selector.dart';
import 'package:rbx_wallet/utils/toast.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';
import '../models/web_collection.dart';
import '../providers/create_web_listing_provider.dart';

class CreateListingFormGroup extends BaseComponent {
  int collection;
  int store;
  CreateListingFormGroup({Key? key, required this.collection, required this.store}) : super(key: key);

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(createWebListingProvider.notifier);
    final model = ref.watch(createWebListingProvider);
    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: _NFT(),
                      ),
                    ),
                  ),
                  Flexible(child: _StartDate()),
                  Flexible(child: _EndDate()),
                  SizedBox(height: 16),
                  Flexible(child: _EnableBuyNow()),
                  if (model.enableBuyNow) Flexible(child: _BuyNow()),
                  SizedBox(height: 16),
                  Flexible(child: _EnableAuction()),
                  if (model.enableAuction) ...[
                    Flexible(child: _FloorPrice()),
                  ],
                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              AppButton(
                label: 'Complete',
                variant: AppColorVariant.Success,
                onPressed: () {
                  provider.complete(context);
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class _EnableBuyNow extends BaseComponent {
  const _EnableBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    final model = ref.watch(createWebListingProvider).enableBuyNow;

    return Row(
      children: [
        Checkbox(
            value: model,
            onChanged: (val) {
              if (val != null) {
                provider.updateEnableBuyOnly(val);
              }
            }),
        GestureDetector(
          onTap: () {
            provider.updateEnableBuyOnly(!model);
          },
          child: const Text("Enable Buy Now?"),
        ),
      ],
    );
  }
}

class _EnableAuction extends BaseComponent {
  const _EnableAuction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    final model = ref.watch(createWebListingProvider).enableAuction;

    return Row(
      children: [
        Checkbox(
            value: model,
            onChanged: (val) {
              if (val != null) {
                provider.updateEnableAuction(val);
              }
            }),
        GestureDetector(
          onTap: () {
            provider.updateEnableAuction(!model);
          },
          child: const Text("Enable Auction?"),
        ),
      ],
    );
  }
}

class _BuyNow extends BaseComponent {
  const _BuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    return TextFormField(
      controller: provider.buyNowController,
      onChanged: provider.updateBuyNow,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      validator: (value) => formValidatorNotEmpty(value, "Buy Now"),
      decoration: InputDecoration(
        label: const Text(
          "Buy Now Price",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _FloorPrice extends BaseComponent {
  const _FloorPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    return TextFormField(
      controller: provider.floorPriceController,
      onChanged: provider.updateFloorPrice,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      validator: (value) => formValidatorNotEmpty(value, "Floor Price"),
      decoration: InputDecoration(
        label: const Text(
          "Floor Price",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _NFT extends BaseComponent {
  const _NFT({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    final model = ref.watch(createWebListingProvider);

    final nft = model.nft;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) {
              return const Icon(Icons.file_present_outlined);
            },
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NFT: ${model.smartContractUid}"),
                Text(
                  nft.identifier,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          NftSelector(
            labelOverride: "Select NFT",
            onSelect: (nft) {
              if (nft.isListed(ref)) {
                Toast.error("This NFT is already listed. Please choose another");
                provider.clearNft();
                return;
              }
              provider.updateNFT(nft.id);
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _showDatePicker(BuildContext context, WidgetRef ref, bool isStartDate) async {
  final _provider = ref.read(createWebListingProvider.notifier);
  final _d = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      const Duration(days: 365 * 100),
    ),
  );

  if (_d != null) {
    _provider.updateDate(_d, isStartDate);
    if (isStartDate) {
      _provider.updateDate(_d.add(Duration(days: 7)), false);
    }
  }
}

class _StartDate extends BaseComponent {
  const _StartDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    return TextFormField(
      controller: provider.startDateController,
      onTap: () {
        _showDatePicker(context, ref, true);
      },
      decoration: InputDecoration(
        label: const Text(
          "Start Date",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: () {
            _showDatePicker(context, ref, true);
          },
        ),
      ),
    );
  }
}

class _EndDate extends BaseComponent {
  const _EndDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(createWebListingProvider.notifier);
    final model = ref.read(createWebListingProvider);
    return TextFormField(
      controller: provider.endDateController,
      validator: (String? val) {
        if (model.endDate.isBefore(model.startDate) || model.endDate.isAtSameMomentAs(model.startDate)) {
          return 'The end date must be set and it must be a later date than the start date';
        }
        return null;
      },
      onTap: () {
        _showDatePicker(context, ref, false);
      },
      decoration: InputDecoration(
        label: const Text(
          "End Date",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: () {
            _showDatePicker(context, ref, false);
          },
        ),
      ),
    );
  }
}
