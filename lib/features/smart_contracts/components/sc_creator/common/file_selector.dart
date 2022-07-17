import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/asset/asset.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/validation.dart';

class FileSelector extends BaseComponent {
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
    this.withAuthorName = false,
    this.allowReplace = true,
  }) : super(key: key);

  Future<void> _handleUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
      return;
    }

    File? file;
    Asset? asset;

    if (kIsWeb) {
      final bytes = result.files.single.bytes;
      if (bytes == null) {
        return;
      }

      final ext = result.files.single.extension;
      final filename = result.files.single.name;

      final webAsset = await TransactionService().uploadAsset(bytes, filename, ext);

      if (webAsset == null) return;
      asset = Asset(
        id: '00000000-0000-0000-0000-000000000000',
        location: webAsset.location,
        extension: webAsset.extension,
        fileSize: result.files.single.bytes!.length,
        bytes: bytes,
        name: webAsset.filename,
      );
    } else {
      file = File(result.files.single.path!);
      final filePath = file.path;

      final slash = Platform.isWindows ? "\\" : "/";
      final name = filePath.split(slash).last;
      final extension = name.split(".").last;
      final fileSize = (await File(filePath).readAsBytes()).length;

      print(filePath);
      print("-----");

      asset = Asset(
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
    }

    onChange(asset);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    String? _title = asset != null ? asset!.fileName : title;
    String? _subtitle = asset != null ? "Type: ${asset!.fileType}" : null;

    if (asset != null && asset!.authorName != null && asset!.authorName!.isNotEmpty) {
      _title = "$_title (Author: ${asset!.authorName})";
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _IconPreview(
              asset: asset,
            ),
            const SizedBox(height: 8),
            if (_title != null)
              Text(
                _title,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            if (_subtitle != null) Text(_subtitle, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 16),
            asset == null
                ? buildChooseFileButton()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildReplaceButton(),
                      const SizedBox(height: 8),
                      buildRemoveButton(context),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    String? _title = asset != null ? asset!.fileName : title;
    String? _subtitle = asset != null ? "Type: ${asset!.fileType}" : null;

    if (asset != null && asset!.authorName != null && asset!.authorName!.isNotEmpty) {
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
            leading: _IconPreview(asset: asset),
            title: Text(_title ?? ""),
            subtitle: Text(_subtitle ?? ""),
            trailing: asset == null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildChooseFileButton(),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!kIsWeb) buildRevealButton(),
                      if (allowReplace) buildReplaceButton(),
                      const SizedBox(width: 6),
                      buildRemoveButton(context),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget buildRemoveButton(BuildContext context) {
    return TextButton(
      child: Text(
        "Remove",
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      onPressed: () {
        onChange(null);
      },
    );
  }

  Padding buildReplaceButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: AppButton(
        label: "Replace",
        icon: Icons.upload,
        onPressed: readOnly ? null : _handleUpload,
      ),
    );
  }

  AppButton buildRevealButton() {
    return AppButton(
      label: "Reveal",
      icon: Icons.folder_open,
      onPressed: () {
        openFile(asset!.file);
      },
    );
  }

  AppButton buildChooseFileButton() {
    return AppButton(
      label: "Choose File",
      icon: Icons.upload,
      onPressed: readOnly ? null : _handleUpload,
    );
  }
}

class _IconPreview extends StatelessWidget {
  const _IconPreview({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final Asset? asset;

  @override
  Widget build(BuildContext context) {
    final size = BreakPoints.useMobileLayout(context) ? 64.0 : 32.0;

    return Builder(
      builder: (context) {
        if (asset != null && asset!.isImage) {
          if (kIsWeb && asset!.bytes != null) {
            return Image.memory(
              asset!.bytes!,
              width: size,
              height: size,
              fit: BoxFit.cover,
            );
          }
          return Image.file(
            asset!.file,
            width: size,
            height: size,
            fit: BoxFit.cover,
          );
        }
        return const Icon(Icons.file_present_outlined);
      },
    );
  }
}
