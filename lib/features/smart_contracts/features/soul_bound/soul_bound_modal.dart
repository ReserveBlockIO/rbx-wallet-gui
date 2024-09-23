import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base_component.dart';
import '../../../../core/providers/web_session_provider.dart';
import '../../../wallet/providers/wallet_list_provider.dart';
import '../../components/sc_creator/common/form_group_header.dart';
import '../../components/sc_creator/common/help_button.dart';
import '../../components/sc_creator/common/modal_bottom_actions.dart';
import '../../components/sc_creator/common/modal_container.dart';
import 'sould_bound_form_provider.dart';

class SoulBoundModal extends BaseComponent {
  const SoulBoundModal({Key? key}) : super(key: key);

  Future<void> chooseAddress(BuildContext context, WidgetRef ref, TextEditingController controller) async {
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
      controller.text = address;
    }
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(soulBoundFormProvider.notifier);

    final GlobalKey<FormState> _formKey = GlobalKey();

    return ModalContainer(
      children: [
        buildHeader(),
        Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: buildOwnerAddress(_provider, ref, context),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: buildBeneficiaryAddress(_provider, ref, context),
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
    final _provider = ref.read(soulBoundFormProvider.notifier);

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
              buildOwnerAddress(_provider, ref, context),
              buildBeneficiaryAddress(_provider, ref, context),
            ],
          ),
        ),
        buildBottomActions(_formKey, _provider, context)
      ],
    );
  }

  FormGroupHeader buildHeader() {
    return const FormGroupHeader(
      "Soul Bound",
    );
  }

  ModalBottomActions buildBottomActions(GlobalKey<FormState> _formKey, SoulBoundFormProvider _provider, BuildContext context) {
    return ModalBottomActions(
      onConfirm: () {
        if (!_formKey.currentState!.validate()) return;

        _provider.complete();
        Navigator.of(context).pop();
      },
    );
  }

  TextFormField buildOwnerAddress(SoulBoundFormProvider _provider, WidgetRef ref, BuildContext context) {
    return TextFormField(
      controller: _provider.ownerAddressController,
      decoration: InputDecoration(
          label: const Text("Owner Address"),
          labelStyle: const TextStyle(color: Colors.white),
          suffixIcon: kIsWeb
              ? IconButton(
                  onPressed: () {
                    final address = ref.read(webSessionProvider).keypair?.address;

                    if (address != null) {
                      _provider.ownerAddressController.text = address;
                    }
                  },
                  icon: const Icon(Icons.import_export))
              : IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.folderOpen,
                    size: 16,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    chooseAddress(context, ref, _provider.ownerAddressController);
                  },
                ),
          prefixIcon: const HelpButton(HelpType.royaltyAddress, subtle: true)),
      validator: _provider.ownerAddressValidator,
    );
  }

  TextFormField buildBeneficiaryAddress(SoulBoundFormProvider _provider, WidgetRef ref, BuildContext context) {
    return TextFormField(
      controller: _provider.beneficiaryAddressController,
      decoration: InputDecoration(
          label: const Text("Beneficary Address (Optional)"),
          labelStyle: const TextStyle(color: Colors.white),
          suffixIcon: kIsWeb
              ? IconButton(
                  onPressed: () {
                    final address = ref.read(webSessionProvider).keypair?.address;

                    if (address != null) {
                      _provider.beneficiaryAddressController.text = address;
                    }
                  },
                  icon: const Icon(Icons.import_export))
              : IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.folderOpen,
                    size: 16,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    chooseAddress(context, ref, _provider.beneficiaryAddressController);
                  },
                ),
          prefixIcon: const HelpButton(HelpType.royaltyAddress, subtle: true)),
      validator: _provider.beneficiaryAddressValidator,
    );
  }
}
