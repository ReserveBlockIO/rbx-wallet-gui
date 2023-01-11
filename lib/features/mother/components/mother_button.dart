import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/features/mother/components/mother_modal.dart';
import 'package:rbx_wallet/features/mother/services/mother_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MotherButton extends BaseComponent {
  const MotherButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "MOTHER",
      onPressed: () async {
        final data = await MotherService().getHost();

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => MotherModal(data),
        );

        // MONITOR TX HASHES & ADDRESSES EXPO REMOTE
      },
    );
  }
}
