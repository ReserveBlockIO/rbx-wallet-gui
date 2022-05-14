import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/utils/files.dart';

class FileSelector extends StatelessWidget {
  final bool transparentBackground;
  final String? title;
  final Function(Asset? asset) onChange;
  final Asset? asset;
  final bool readOnly;
  const FileSelector({
    Key? key,
    this.transparentBackground = false,
    this.title,
    required this.onChange,
    this.asset,
    this.readOnly = false,
  }) : super(key: key);

  Future<void> _handleUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
      return;
    }

    File file = File(result.files.single.path!);

    final filePath = file.path;

    final name = filePath.split("/").last;
    final extension = name.split(".").last;
    final fileSize = (await File(filePath).readAsBytes()).length;

    final asset = Asset(
      id: "00000000-0000-0000-0000-000000000000",
      name: name,
      location: filePath,
      extension: extension,
      fileSize: fileSize,
    );

    onChange(asset);
  }

  @override
  Widget build(BuildContext context) {
    String? _title = asset != null ? asset!.fileName : title;
    String? _subtitle = asset != null ? "Type: ${asset!.fileType}" : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: transparentBackground ? Colors.transparent : null,
          child: ListTile(
            tileColor: transparentBackground ? Colors.transparent : null,
            leading: Builder(
              builder: (context) {
                if (asset != null && asset!.isImage) {
                  return Image.file(
                    asset!.file,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  );
                }
                return Icon(Icons.file_present_outlined);
              },
            ),
            title: Text(_title ?? ""),
            subtitle: Text(_subtitle ?? ""),
            trailing: asset == null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton(
                        label: "Choose",
                        icon: Icons.upload,
                        onPressed: readOnly ? null : _handleUpload,
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton(
                        label: "Reveal",
                        icon: Icons.folder_open,
                        onPressed: () {
                          openFile(asset!.location);
                        },
                      ),
                      SizedBox(width: 6),
                      AppButton(
                        label: "Replace",
                        icon: Icons.upload,
                        onPressed: readOnly ? null : _handleUpload,
                      ),
                      SizedBox(width: 6),
                      AppButton(
                        label: "Remove",
                        icon: Icons.delete,
                        variant: AppColorVariant.Danger,
                        onPressed: readOnly
                            ? null
                            : () {
                                onChange(null);
                              },
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
