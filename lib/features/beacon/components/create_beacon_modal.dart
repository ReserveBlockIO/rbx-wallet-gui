import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/session_provider.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/beacon/providers/beacon_form_provider.dart';
import 'package:rbx_wallet/features/beacon/providers/beacon_list_provider.dart';
import 'package:rbx_wallet/features/global_loader/global_loading_provider.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CreateBeaconModal extends BaseComponent {
  const CreateBeaconModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(beaconFormProvider.notifier);
    final model = ref.watch(beaconFormProvider);
    return ModalContainer(
      withClose: true,
      withDecor: false,
      children: [
        Text("Create Beacon"),
        Text(
          "Create a beacon if you want to be the owner of the relay of assets. Setup your wallet as a beacon to partipate in media transferring on the RBX network. The name is a friendly name only visible to you. You can configure a specific port or just use the default setting. You can also configure whether your beacon is private and how long assets should remain cached.",
          style: Theme.of(context).textTheme.caption,
        ),
        Form(
          key: provider.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: provider.nameController,
                      validator: provider.nameValidator,
                      decoration: InputDecoration(
                        label: Text("Beacon Name"),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 240,
                    child: TextFormField(
                      controller: provider.portController,
                      decoration: InputDecoration(label: Text("Port (leave blank for default)")),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 240,
                    child: TextFormField(
                      controller: provider.periodController,
                      decoration: InputDecoration(label: Text("Days to retain files (0 for unlimited)")),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: model.isBeaconPrivate,
                onChanged: provider.setIsPrivate,
                title: Text("Make Private"),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: model.autoDeleteAfterDownload,
                onChanged: provider.setAutoDelete,
                title: Text("Auto Delete After Download"),
              )
            ],
          ),
        ),
        SizedBox(
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
              label: "Create",
              variant: AppColorVariant.Success,
              onPressed: () async {
                final success = await provider.submit();

                if (success == null) {
                  return;
                }

                final confirmed = await ConfirmDialog.show(
                  title: "Beacon Created",
                  body: "A CLI restart is required for this to take affect.\n\nRestart Now?",
                  confirmText: "Restart",
                  cancelText: "Later",
                );

                if (confirmed == true) {
                  ref.read(globalLoadingProvider.notifier).start();
                  await ref.read(sessionProvider.notifier).restartCli();
                  ref.read(beaconListProvider.notifier).refresh();
                  ref.read(globalLoadingProvider.notifier).complete();
                }
                Navigator.of(context).pop();
              },
            )
          ],
        )
      ],
    );
  }
}
