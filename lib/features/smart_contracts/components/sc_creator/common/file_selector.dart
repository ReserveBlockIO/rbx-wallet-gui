import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/validation.dart';

class FileSelector extends StatelessWidget {
  final bool transparentBackground;
  final String? title;
  final Function(Asset? asset) onChange;
  final Asset? asset;
  final bool readOnly;
  final bool withAuthorName;
  final bool allowReplace;
  const FileSelector({
    Key? key,
    this.transparentBackground = false,
    this.title,
    required this.onChange,
    this.asset,
    this.readOnly = false,
    this.withAuthorName = true,
    this.allowReplace = true,
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

    Asset asset = Asset(
      id: "00000000-0000-0000-0000-000000000000",
      name: name,
      authorName: "",
      location: filePath,
      extension: extension,
      fileSize: fileSize,
    );
    if (withAuthorName) {
      final authorName = await PromptModal.show(
          title: "Creator Name",
          validator: (value) => formValidatorNotEmpty(value, "Name"),
          labelText: "Name",
          allowCancel: false,
          confirmText: "Save");

      if (authorName != null) {
        asset = asset.copyWith(authorName: authorName);
      }
    }

    onChange(asset);
  }

  @override
  Widget build(BuildContext context) {
    String? _title = asset != null ? asset!.fileName : title;
    String? _subtitle = asset != null ? "Type: ${asset!.fileType}" : null;

    if (asset != null &&
        asset!.authorName != null &&
        asset!.authorName!.isNotEmpty) {
      _title = "$_title (Author: ${asset!.authorName})";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
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
                      if (allowReplace)
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: AppButton(
                            label: "Replace",
                            icon: Icons.upload,
                            onPressed: readOnly ? null : _handleUpload,
                          ),
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
