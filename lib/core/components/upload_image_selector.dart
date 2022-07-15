import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/services/transaction_service.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadImageSelector extends BaseComponent {
  final bool transparentBackground;
  final String? title;
  final Function(String? url) onChange;
  final String? url;
  final bool readOnly;
  final bool withAuthorName;
  final bool allowReplace;
  const UploadImageSelector({
    Key? key,
    this.transparentBackground = false,
    this.title,
    required this.onChange,
    this.url,
    this.readOnly = false,
    this.withAuthorName = false,
    this.allowReplace = true,
  }) : super(key: key);

  Future<void> _handleUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png', 'gif']);

    if (result == null) {
      return;
    }

    File? file;
    String? url;

    final bytes = result.files.single.bytes;
    if (bytes == null) {
      return;
    }

    final ext = result.files.single.extension;

    url = await TransactionService().uploadImage(bytes, ext);

    onChange(url);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _IconPreview(
              url: url,
            ),
            const SizedBox(height: 16),
            url == null
                ? buildChooseFileButton()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildReplaceButton(),
                      const SizedBox(height: 8),
                      buildRemoveButton(),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  @override
  Widget desktopBody(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          color: transparentBackground ? Colors.transparent : null,
          child: ListTile(
            tileColor: transparentBackground ? Colors.transparent : null,
            leading: _IconPreview(url: url),
            trailing: url == null
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
                      buildRemoveButton(),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  AppButton buildRemoveButton() {
    return AppButton(
      label: "Remove",
      icon: Icons.delete,
      variant: AppColorVariant.Danger,
      onPressed: readOnly
          ? null
          : () {
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
        if (url != null) {
          launchUrl(Uri.parse(url!));
        }
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
    required this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    final size = BreakPoints.useMobileLayout(context) ? 64.0 : 32.0;

    return Builder(
      builder: (context) {
        if (url != null) {
          return Image.network(
            url!,
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
