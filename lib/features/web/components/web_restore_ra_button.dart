import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:rbx_wallet/core/storage.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/keygen/models/ra_keypair.dart';
import 'package:rbx_wallet/features/keygen/services/keygen_service.dart'
    if (dart.library.io) 'package:rbx_wallet/features/keygen/services/keygen_service_mock.dart';
import 'package:rbx_wallet/utils/toast.dart';

class WebRestoreRaButton extends BaseComponent {
  const WebRestoreRaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "Restore Reserve Account",
      icon: Icons.refresh,
      type: AppButtonType.Text,
      variant: AppColorVariant.Light,
      onPressed: () async {
        final confirmed = await ConfirmDialog.show(
          title: "Restore Reserve Account",
          body:
              "Importing an existing Reserve Account will replace the current one tied to your login. To revert you can logout and login again.\n\nContinue?",
        );

        if (confirmed != true) {
          return;
        }

        final restoreCode = await PromptModal.show(
          contextOverride: context,
          title: "Restore Code",
          body: "Paste in your RESTORE CODE to import your existing Reserve Account.",
          validator: (v) => null,
          labelText: "Restore Code",
        );

        if (restoreCode == null) {
          return;
        }

        final data = utf8.decode(base64.decode(restoreCode));

        final primaryPrivateKey = data.split("//")[0];

        final tempKeypair = await KeygenService.importReserveAccountPrivateKey(primaryPrivateKey);

        final recoveryPrivateKey = data.split("//")[1];

        final recoveryKeypair = await KeygenService.importPrivateKey(recoveryPrivateKey);

        final raKeypair = RaKeypair(
          private: tempKeypair.private,
          address: tempKeypair.address,
          public: tempKeypair.public,
          recoveryPrivate: recoveryKeypair.private,
          recoveryAddress: recoveryKeypair.address,
          recoveryPublic: recoveryKeypair.public,
          restoreCode: restoreCode,
        );

        ref.read(webSessionProvider.notifier).setRaKeypair(raKeypair);

        final rememberMe = singleton<Storage>().getBool(Storage.REMEMBER_ME) ?? false;
        if (rememberMe) {
          singleton<Storage>().setMap(Storage.WEB_RA_KEYPAIR, raKeypair.toJson());
        }

        Toast.message("Reserve Account restored");
      },
    );
  }
}
