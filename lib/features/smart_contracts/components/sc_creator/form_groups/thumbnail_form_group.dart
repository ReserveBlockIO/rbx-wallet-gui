import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/base_component.dart';
import '../../../../asset/asset.dart';
import '../../../providers/create_smart_contract_provider.dart';
import '../common/file_selector.dart';
import '../common/form_group_container.dart';
import '../common/form_group_header.dart';
import '../common/help_button.dart';

class ThumbnailAssetFormGroup extends BaseComponent {
  const ThumbnailAssetFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Thumbnail",
            helpType: HelpType.unknown,
          ),
          FileSelector(
            readOnly: _model.isCompiled,
            onChange: (Asset? asset) {},
          )
        ],
      ),
    );
  }
}
