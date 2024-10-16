import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base_component.dart';
import '../../../../core/components/buttons.dart';
import '../../../../core/providers/session_provider.dart';
import '../../../mother/models/mother_child.dart';
import '../../../mother/services/mother_service.dart';
import '../../../mother/components/mother_modal.dart';

class MotherButton extends BaseComponent {
  const MotherButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton(
      label: "MOTHER",
      icon: Icons.hub_outlined,
      onPressed: ref.watch(sessionProvider.select((v) => v.cliStarted))
          ? () async {
              final data = await MotherService().getHost();
              final List<MotherChild> children = data != null ? await MotherService().getChildren() : [];

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => MotherModal(data, children),
              );
            }
          : null,
    );
  }
}
