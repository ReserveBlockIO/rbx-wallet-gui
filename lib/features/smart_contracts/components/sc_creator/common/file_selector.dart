import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

class FileSelector extends StatelessWidget {
  final bool transparentBackground;
  final String? title;
  const FileSelector({
    Key? key,
    this.transparentBackground = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: transparentBackground ? Colors.transparent : null,
          child: ListTile(
            tileColor: transparentBackground ? Colors.transparent : null,
            leading: Icon(Icons.file_present_outlined),
            title: Text(title ?? "FileName.jpg"),
            subtitle: Text("Type: Image"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  label: "Reveal",
                  icon: Icons.folder_open,
                  onPressed: () {},
                ),
                SizedBox(width: 6),
                AppButton(
                  label: "Replace",
                  icon: Icons.upload,
                  onPressed: () {},
                ),
                SizedBox(width: 6),
                AppButton(
                  label: "Remove",
                  icon: Icons.delete,
                  variant: AppColorVariant.Danger,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
