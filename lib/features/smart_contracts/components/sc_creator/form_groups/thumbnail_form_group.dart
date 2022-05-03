import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_sc_provider.dart';

class ThumbnailAssetFormGroup extends BaseComponent {
  const ThumbnailAssetFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createScProvider.notifier);
    final _model = ref.watch(createScProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [FormGroupHeader("Thumbnail"), FileSelector()],
      ),
    );
  }
}
