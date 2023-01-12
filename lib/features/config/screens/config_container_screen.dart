import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_screen.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/config/providers/config_form_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/configuration_form_group.dart';

class ConfigContainerScreen extends BaseScreen {
  const ConfigContainerScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(configFormProvider.notifier);
    return AppBar(
      title: Text("Configure the CLI"),
      leading: IconButton(
        onPressed: () async {
          final confirmed = await ConfirmDialog.show(
            title: "Are you sure you want to close the configuration screen?",
            body: "All unsaved changes will be lost.",
            cancelText: "Cancel",
            confirmText: "Continue",
          );

          if (confirmed == true) {
            AutoRouter.of(context).pop();
            provider.clear();
            ref.refresh(configFormProvider);
          }
        },
        icon: const Icon(Icons.close),
      ),
      actions: [
        IconButton(
            onPressed: () {
              launchUrl(Uri.parse('https://github.com/ReserveBlockIO/ReserveBlock-Core/blob/main/ConfigSetup.md'));
            },
            icon: Icon(Icons.file_copy_rounded))
      ],
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    final provider = ref.read(configFormProvider.notifier);
    return Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ConfigurationFormGroup(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF040f26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      label: 'Save',
                      variant: AppColorVariant.Success,
                      onPressed: () {
                        provider.submit(context).then((value) {
                          if (value) ref.refresh(configFormProvider);
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
