import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/theme/components.dart';

import '../../../../../core/base_component.dart';
import '../../../../../core/theme/colors.dart';
import '../../../providers/create_smart_contract_provider.dart';
import '../common/file_selector.dart';
import '../common/form_group_container.dart';
import '../common/form_group_header.dart';
import '../common/help_button.dart';

class PrimaryAssetFormGroup extends BaseComponent {
  const PrimaryAssetFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createSmartContractProvider.notifier);
    final _model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: AppCard(
        padding: 4,
        color: AppColors.getGray(ColorShade.s300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: const FormGroupHeader(
                "Asset",
                helpType: HelpType.primaryAsset,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FileSelector(
              readOnly: _model.isCompiled,
              asset: _model.primaryAsset,
              onChange: _provider.setPrimaryAsset,
              title: "Asset",
              transparentBackground: true,

              // withAuthorName: true,
            ),
            // if (_model.primaryAsset == null)
            //   Text(
            //     "This is currently ${_model.primaryAssetRequired ? 'REQUIRED' : 'OPTIONAL'} due to the feature(s) you have enabled.",
            //     style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
            //   ),
          ],
        ),
      ),
    );
  }
}
