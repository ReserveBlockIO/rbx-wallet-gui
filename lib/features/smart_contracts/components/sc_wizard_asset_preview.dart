import 'package:flutter/material.dart';

import '../models/bulk_smart_contract_entry.dart';

class ScWizardAssetPreview extends StatelessWidget {
  const ScWizardAssetPreview({
    Key? key,
    required this.entry,
    this.small = false,
  }) : super(key: key);

  final BulkSmartContractEntry entry;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final asset = entry.primaryAsset;
    if (asset == null) return const SizedBox.shrink();

    if (asset.isImage) {
      return Image.file(
        asset.file,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (small) {
      return const Icon(Icons.file_present_outlined);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(asset.fileName),
          const SizedBox(height: 8),
          const Icon(Icons.file_present_outlined),
        ],
      ),
    );
  }
}
