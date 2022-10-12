import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_container.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/help_button.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/create_smart_contract_provider.dart';

class PrimaryAssetFormGroup extends BaseComponent {
  const PrimaryAssetFormGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(createSmartContractProvider.notifier);
    final _model = ref.watch(createSmartContractProvider);

    return FormGroupContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const FormGroupHeader(
            "Asset",
            helpType: HelpType.primaryAsset,
          ),
          FileSelector(
            readOnly: _model.isCompiled,
            asset: _model.primaryAsset,
            onChange: _provider.setPrimaryAsset,
            title: "Asset",
            // withAuthorName: true,
          ),
          // if (_model.primaryAsset == null)
          //   Text(
          //     "This is currently ${_model.primaryAssetRequired ? 'REQUIRED' : 'OPTIONAL'} due to the feature(s) you have enabled.",
          //     style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
          //   ),
        ],
      ),
    );
  }
}
