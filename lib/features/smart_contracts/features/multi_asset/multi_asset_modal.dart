import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/file_selector.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/form_group_header.dart';
import 'package:rbx_wallet/features/smart_contracts/components/sc_creator/common/modal_container.dart';
import 'package:rbx_wallet/features/smart_contracts/features/multi_asset/multi_asset_provider.dart';

class MultiAssetModal extends BaseComponent {
  const MultiAssetModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(multiAssetFormProvider.notifier);
    final _model = ref.watch(multiAssetFormProvider);

    return ModalContainer(children: [
      FormGroupHeader("Assets"),
      ListView.builder(
        shrinkWrap: true,
        itemCount: _model.length + 1,
        itemBuilder: (context, index) {
          final isLast = index >= _model.length;
          final a = isLast ? null : _model[index];

          return FileSelector(
              transparentBackground: true,
              title: "Choose a File",
              asset: a,
              allowReplace: false,
              onChange: (asset) {
                if (asset != null) {
                  _provider.addAsset(asset);
                } else {
                  _provider.removeAsset(index);
                }
              });
        },
      )
    ]);
  }
}
