import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/components.dart';
import 'nft_selector.dart';
import '../../../utils/toast.dart';

import '../../../core/base_component.dart';
import '../../../utils/validation.dart';
import '../../smart_contracts/components/sc_creator/common/form_group_container.dart';
import '../providers/listing_form_provider.dart';

class CreateListingFormGroup extends BaseComponent {
  const CreateListingFormGroup({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider);
    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: AppCard(
              child: Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: _NFT(),
                      ),
                    ),
                    if (model.isAuction && model.auctionStarted && model.exists)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          "Auction has started so the dates & times can't be updated.",
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                      ),
                    SizedBox(height: 16),
                    Flexible(child: _EnableGallery()),
                    SizedBox(height: 16),
                    Flexible(child: _EnableBuyNow()),
                    if (model.enableBuyNow) Flexible(child: _BuyNow()),
                    SizedBox(height: 16),
                    Flexible(child: _EnableAuction()),
                    if (model.enableAuction) ...[
                      Flexible(child: _FloorPrice()),
                      Flexible(child: _EnableReservePrice()),
                      if (model.enableReservePrice) Flexible(child: _ReservePrice()),
                      if (model.isAuction && model.auctionStarted && model.exists)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "Auction has started so the pricing can't be updated.",
                            style: Theme.of(context).textTheme.bodySmall,
                          )),
                        ),
                      Flexible(child: _StartDate()),
                      Flexible(child: _EndDate()),
                    ],
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _EnableGallery extends BaseComponent {
  const _EnableGallery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider.select((v) => v.galleryOnly));

    return Row(
      children: [
        Checkbox(
            value: model,
            onChanged: (val) {
              if (val != null) {
                provider.updateGalleryOnly(val);
              }
            }),
        GestureDetector(
          onTap: () {
            provider.updateGalleryOnly(!model);
          },
          child: const Text("Gallery Only?"),
        ),
      ],
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
    final model = ref.watch(listingFormProvider.select((v) => v.enableBuyNow));

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
    final model = ref.watch(listingFormProvider.select((v) => v.enableAuction));

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

class _EnableReservePrice extends BaseComponent {
  const _EnableReservePrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(listingFormProvider.notifier);
    final model = ref.watch(listingFormProvider.select((v) => v.enableReservePrice));

    return Row(
      children: [
        Checkbox(
            value: model,
            onChanged: (val) {
              if (val != null) {
                provider.updateEnableReservePrice(val);
              }
            }),
        GestureDetector(
          onTap: () {
            provider.updateEnableReservePrice(!model);
          },
          child: const Text("Add Reserve Price"),
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
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      validator: (value) => formValidatorNotEmpty(value, "Buy Now"),
      decoration: InputDecoration(
        suffixText: "VFX",
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
    final model = ref.read(listingFormProvider);
    return TextFormField(
      readOnly: model.auctionStarted && model.exists,
      controller: provider.floorPriceController,
      onChanged: provider.updateFloorPrice,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      validator: (value) => formValidatorNotEmpty(value, "Floor Price"),
      decoration: InputDecoration(
        suffixText: "VFX",
        label: const Text(
          "Floor Price",
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
    final model = ref.read(listingFormProvider);
    return TextFormField(
      readOnly: model.auctionStarted && model.exists,
      controller: provider.reservePriceController,
      onChanged: provider.updateReservePrice,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      validator: (value) => formValidatorNotEmpty(value, "Reserve Price"),
      decoration: InputDecoration(
        suffixText: "VFX",
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

    if (model.nft == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("NFT:"),
            NftSelector(onSelect: (nft) {
              if (nft.isListed(ref)) {
                Toast.error("This NFT is already listed. Please choose another");
                provider.clearNft();

                return;
              }

              provider.updateNFT(nft);
            }),
          ],
        ),
      );
    }

    final nft = model.nft!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: FutureBuilder(
              future: model.thumbnail(),
              builder: (context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                }

                return SizedBox();
              },
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NFT: ${nft.name}"),
                Text(
                  nft.id,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          NftSelector(
            disabled: model.exists,
            labelOverride: "Replace NFT",
            onSelect: (nft) {
              if (nft.isListed(ref)) {
                Toast.error("This NFT is already listed. Please choose another");
                provider.clearNft();
                return;
              }
              provider.updateNFT(nft);
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _showDatePicker(BuildContext context, WidgetRef ref, bool isStartDate) async {
  final _provider = ref.read(listingFormProvider.notifier);
  final _model = ref.read(listingFormProvider);

  if (_model.isAuction && _model.auctionStarted && _model.exists) {
    Toast.error('The auction has already started.');
    return;
  }
  final _d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 100),
      ),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Color(0xFF82e4fb),
                    onPrimary: Color(0xFF031745),
                  )),
          child: child!,
        );
      });

  if (_d != null) {
    _provider.updateDate(_d, isStartDate);
  }
}

Future<void> _showTimePicker(BuildContext context, WidgetRef ref, bool isStartDate) async {
  final _provider = ref.read(listingFormProvider.notifier);
  final _model = ref.read(listingFormProvider);

  final initialDateTime = isStartDate ? _model.startDate : _model.endDate;
  if (_model.isAuction && _model.auctionStarted && _model.exists) {
    Toast.error('The auction has already started.');
    return;
  }

  final t = await showTimePicker(
    context: context,
    initialEntryMode: TimePickerEntryMode.input,
    initialTime: TimeOfDay(hour: initialDateTime.hour, minute: initialDateTime.minute),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.dark().copyWith(
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Color(0xFF82e4fb),
                  onPrimary: Color(0xFF031745),
                )),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? const SizedBox(),
        ),
      );
    },
  );

  print(t);

  if (t != null) {
    _provider.updateTime(t, isStartDate);
  }
}

class _StartDate extends BaseComponent {
  const _StartDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(listingFormProvider.notifier);
    final _model = ref.read(listingFormProvider);

    final disabled = _model.isAuction && _model.auctionStarted && _model.exists;

    return IgnorePointer(
      ignoring: disabled,
      child: Opacity(
        opacity: disabled ? 0.5 : 1,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
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
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextFormField(
                controller: provider.startTimeController,
                onTap: () {
                  _showTimePicker(context, ref, true);
                },
                decoration: InputDecoration(
                  label: const Text(
                    "Start Time",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.hourglass_bottom),
                    onPressed: () {
                      _showTimePicker(context, ref, true);
                    },
                  ),
                ),
              ),
            ),
          ],
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
    final disabled = model.isAuction && model.auctionStarted && model.exists;

    return IgnorePointer(
      ignoring: disabled,
      child: Opacity(
        opacity: disabled ? 0.5 : 1,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: provider.endDateController,
                validator: (String? val) {
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
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextFormField(
                controller: provider.endTimeController,
                onTap: () {
                  _showTimePicker(context, ref, false);
                },
                decoration: InputDecoration(
                  label: const Text(
                    "End Time",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.hourglass_bottom),
                    onPressed: () {
                      _showTimePicker(context, ref, false);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
