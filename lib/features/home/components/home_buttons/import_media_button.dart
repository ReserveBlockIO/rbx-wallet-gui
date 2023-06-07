import 'package:flutter/material.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../../core/utils.dart';
import '../../../../utils/toast.dart';
import '../../../smart_contracts/components/sc_creator/common/modal_container.dart';

class ImportMediaButton extends BaseComponent {
  const ImportMediaButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cliStarted = ref.watch(sessionProvider).cliStarted;

    return AppButton(
      label: "Import Media",
      icon: Icons.cloud_download_outlined,
      onPressed: !cliStarted
          ? null
          : () async {
              final success = await importMedia(context, ref);

              if (success) {
                Toast.message("Media Imported Successfully");
              } else {
                Toast.error("Could not import media");
              }
            },
    );
  }
}
