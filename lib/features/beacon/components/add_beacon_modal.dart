import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../providers/add_beacon_form_provider.dart';
import '../providers/beacon_list_provider.dart';

class AddBeaconModal extends BaseComponent {
  const AddBeaconModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(addBeaconFormProvider.notifier);
    return ModalContainer(
      withClose: true,
      withDecor: false,
      children: [
        const Text("Add Beacon"),
        Text(
          "Add an existing beacon to foreign nodes to use that relay instead of default ones on the VFX network. Configure your wallet to use a remote beacon for media transferring rather than using the default VFX network beacons. You will need to know the IP address of the remote beacon. If that beacon is using the non-default port, provide that as well. The beacon name is a friendly name visible only to you.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Form(
          key: provider.formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: provider.nameController,
                  validator: provider.nameValidator,
                  decoration: const InputDecoration(
                    label: Text("Beacon Name"),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextFormField(
                  controller: provider.ipController,
                  validator: provider.ipAddressValidator,
                  decoration: const InputDecoration(
                    label: Text("IP Address"),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 240,
                child: TextFormField(
                  controller: provider.portController,
                  decoration: const InputDecoration(label: Text("Port (leave blank for default)")),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Cancel",
              type: AppButtonType.Text,
              variant: AppColorVariant.Light,
              onPressed: () {
                provider.clear();
                Navigator.of(context).pop();
              },
            ),
            AppButton(
              label: "Add",
              variant: AppColorVariant.Success,
              onPressed: () async {
                final success = await provider.submit();

                if (success == null) {
                  return;
                }

                ref.read(beaconListProvider.notifier).refresh();
                Navigator.of(context).pop();
              },
            )
          ],
        )
      ],
    );
  }
}
