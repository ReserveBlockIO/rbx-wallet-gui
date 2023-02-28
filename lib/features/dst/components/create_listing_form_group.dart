import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/features/dst/components/nft_selector.dart';
import 'package:rbx_wallet/features/dst/providers/store_form_provider.dart';

import '../../../core/base_component.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_header.dart';
import '../providers/listing_form_provider.dart';

class CreateListingFormGroup extends BaseComponent {
  const CreateListingFormGroup({Key? key}) : super(key: key);

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider);
    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Create Listing",
          ),
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: _NFT()),
                  Flexible(child: _StartDate()),
                  Flexible(child: _EndDate()),
                  Flexible(child: _EnableBuyNow()),
                  if (model.enableBuyNow) Flexible(child: _BuyNow()),
                  Flexible(child: _EnableAuction()),
                  if (model.enableAuction) ...[
                    Flexible(child: _FloorPrice()),
                    Flexible(child: _ReservePrice()),
                  ],
                ],
              ),
            ),
          )),
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
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider).enableBuyNow;

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
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider).enableAuction;

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
    final provider = ref.read(listingFormProvider.notifier);
    return TextFormField(
      controller: provider.buyNowController,
      onChanged: provider.updateBuyNow,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
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
    final provider = ref.read(listingFormProvider.notifier);
    return TextFormField(
      controller: provider.floorPriceController,
      onChanged: provider.updateFloorPrice,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) => formValidatorNotEmpty(value, "Floor Price"),
      decoration: InputDecoration(
        label: const Text(
          "Floor  Price",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _ReservePrice extends BaseComponent {
  const _ReservePrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(listingFormProvider.notifier);
    return TextFormField(
      controller: provider.reservePriceController,
      onChanged: provider.updateReservePrice,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) => formValidatorNotEmpty(value, "Reserve Price"),
      decoration: InputDecoration(
        label: const Text(
          "Reserve Price",
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
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("NFT: ${model.smartContractUid}"),
          NftSelector(onSelect: (nft) {
            provider.updateNFT(nft);
          }),
        ],
      ),
    );
  }
}

Future<void> _showDatePicker(BuildContext context, WidgetRef ref, bool isStartDate) async {
  final _provider = ref.read(listingFormProvider.notifier);
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
  }
}

class _StartDate extends BaseComponent {
  const _StartDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(listingFormProvider.notifier);
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
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.read(listingFormProvider);
    return TextFormField(
      controller: provider.endDateController,
      validator: (String? val) {
        print("Start: ${model.startDate} End: ${model.endDate}");
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
