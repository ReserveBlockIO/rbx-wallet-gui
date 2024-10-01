import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/theme/app_theme.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/dropdowns.dart';
import '../../../../core/providers/web_session_provider.dart';
import '../../../wallet/providers/wallet_list_provider.dart';
import '../../components/sc_creator/common/form_group_header.dart';
import '../../components/sc_creator/common/help_button.dart';
import '../../components/sc_creator/common/modal_bottom_actions.dart';
import '../../components/sc_creator/common/modal_container.dart';
import 'royalty.dart';
import 'royalty_form_provider.dart';

class RoyaltyModal extends BaseComponent {
  const RoyaltyModal({Key? key}) : super(key: key);

  Future<void> chooseAddress(BuildContext context, WidgetRef ref) async {
    final _provider = ref.read(royaltyFormProvider.notifier);

    final wallets = ref.read(walletListProvider);

    final address = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Choose an address"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white60),
                ),
              )
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: wallets
                  .map(
                    (w) => TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(w.address);
                      },
                      child: Text(
                        w.fullLabel,
                        style: const TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        });
    if (address != null) {
      _provider.addressController.text = address;
    }
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(royaltyFormProvider.notifier);
    final _model = ref.watch(royaltyFormProvider);

    final GlobalKey<FormState> _formKey = GlobalKey();

    return ModalContainer(
      children: [
        buildHeader(),
        Form(
          key: _formKey,
          child: Row(
            children: [
              // buildRoyaltyType(_model, _provider),
              // const SizedBox(width: 32),
              Expanded(
                child: buildAmount(_provider, _model),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: buildAddress(_provider, ref, context),
              ),
            ],
          ),
        ),
        buildBottomActions(_formKey, _provider, context)
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(royaltyFormProvider.notifier);
    final _model = ref.watch(royaltyFormProvider);

    final GlobalKey<FormState> _formKey = GlobalKey();

    return ModalContainer(
      children: [
        buildHeader(),
        const SizedBox(height: 16),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // buildRoyaltyType(_model, _provider),
              // const SizedBox(height: 16),
              buildAmount(_provider, _model),
              const SizedBox(width: 16),
              buildAddress(_provider, ref, context),
            ],
          ),
        ),
        buildBottomActions(_formKey, _provider, context)
      ],
    );
  }

  FormGroupHeader buildHeader() {
    return const FormGroupHeader(
      "Royalty",
    );
  }

  ModalBottomActions buildBottomActions(GlobalKey<FormState> _formKey, RoyaltyFormProvider _provider, BuildContext context) {
    return ModalBottomActions(
      onConfirm: () {
        if (!_formKey.currentState!.validate()) return;

        _provider.complete();
        Navigator.of(context).pop();
      },
    );
  }

  TextFormField buildAddress(RoyaltyFormProvider _provider, WidgetRef ref, BuildContext context) {
    return TextFormField(
      controller: _provider.addressController,
      decoration: InputDecoration(
          label: const Text("Address"),
          labelStyle: const TextStyle(color: Colors.white),
          suffixIcon: kIsWeb
              ? AppButton(
                  label: "Use My Address",
                  variant: AppColorVariant.Light,
                  type: AppButtonType.Text,
                  underlined: true,
                  onPressed: () {
                    final address = ref.read(webSessionProvider).keypair?.address;

                    if (address != null) {
                      _provider.addressController.text = address;
                    }
                  },
                )
              : IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.folderOpen,
                    size: 16,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    chooseAddress(context, ref);
                  },
                ),
          prefixIcon: const HelpButton(HelpType.royaltyAddress, subtle: true)),
      validator: _provider.addressValidator,
    );
  }

  TextFormField buildAmount(RoyaltyFormProvider _provider, Royalty _model) {
    return TextFormField(
      controller: _provider.amountController,
      decoration: InputDecoration(
          label: const Text("Percentage"),
          labelStyle: const TextStyle(color: Colors.white),
          suffix: Text(_model.type == RoyaltyType.percent ? "%" : "VFX"),
          prefixIcon: HelpButton(_model.type == RoyaltyType.percent ? HelpType.royaltyPercent : HelpType.royaltyFlat, subtle: true)),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      validator: _provider.amountValidator,
    );
  }

  AppDropdown<RoyaltyType> buildRoyaltyType(Royalty _model, RoyaltyFormProvider _provider) {
    return AppDropdown<RoyaltyType>(
      label: "Royalty Type",
      selectedValue: _model.type,
      selectedLabel: _model.typeLabel,
      onChange: (val) {
        _provider.updateType(val);
      },
      options: Royalty.allTypes()
          .map(
            (type) => AppDropdownOption<RoyaltyType>(
              value: type,
              label: Royalty.typeToString(type),
            ),
          )
          .toList(),
    );
  }
}
