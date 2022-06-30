import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

class ModalBottomActions extends StatelessWidget {
  final String confirmText;
  final bool showConfirm;
  final Function() onConfirm;
  final Function()? onCancel;
  const ModalBottomActions({
    Key? key,
    this.confirmText = "Save",
    required this.onConfirm,
    this.onCancel,
    this.showConfirm = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Cancel",
              type: AppButtonType.Text,
              variant: AppColorVariant.Info,
              onPressed: () {
                if (onCancel != null) onCancel!();
                Navigator.of(context).pop();
              },
            ),
            if (showConfirm)
              AppButton(
                label: confirmText,
                icon: Icons.check,
                onPressed: onConfirm,
              ),
          ],
        ),
      ],
    );
  }
}
