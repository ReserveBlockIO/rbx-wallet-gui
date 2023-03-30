import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/api_token_manager.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/env.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/files.dart';
import '../../../utils/toast.dart';
import '../../easter/secret_button.dart';
import '../components/configuration_form_group.dart';
import '../providers/config_form_provider.dart';

class ConfigContainerScreen extends BaseScreen {
  const ConfigContainerScreen({Key? key}) : super(key: key, verticalPadding: 0, horizontalPadding: 0);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(configFormProvider.notifier);
    return AppBar(
      title: const Text("CLI Configuration"),
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
        AppButton(
          onPressed: () async {
            final p = await configPath();
            openFile(File(p));
          },
          label: "Open Config",
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          icon: Icons.launch,
        ),
        AppButton(
          onPressed: () {
            launchUrl(Uri.parse('https://github.com/ReserveBlockIO/ReserveBlock-Core/blob/main/ConfigSetup.md'));
          },
          label: "View Docs",
          type: AppButtonType.Text,
          variant: AppColorVariant.Light,
          icon: Icons.launch,
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(configFormProvider.notifier);
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              color: Theme.of(context).colorScheme.warning,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text("Warning: These are advanced options. Proceed with caution.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        if (kDebugMode)
          Builder(builder: (context) {
            final token = singleton<ApiTokenManager>().get();
            return SelectableText(token);
          }),
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
        Align(
          alignment: Alignment.bottomLeft,
          child: SecretButton(
            onPressed: () {
              launchUrlString("${Env.apiBaseUrl}/snake");
            },
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
                  onPressed: () async {
                    final shouldRestart = await provider.submit();
                    if (!shouldRestart) {
                      Toast.message("CLI restart is required for changes to propagate.");
                    }
                    AutoRouter.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
