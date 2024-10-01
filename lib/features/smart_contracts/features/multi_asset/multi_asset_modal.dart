import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base_component.dart';
import '../../components/sc_creator/common/file_selector.dart';
import '../../components/sc_creator/common/form_group_header.dart';
import '../../components/sc_creator/common/modal_bottom_actions.dart';
import '../../components/sc_creator/common/modal_container.dart';
import 'multi_asset_provider.dart';

class MultiAssetModal extends BaseComponent {
  const MultiAssetModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.read(multiAssetFormProvider.notifier);
    final _model = ref.watch(multiAssetFormProvider);

    return ModalContainer(children: [
      const FormGroupHeader(
        "Assets",
      ),
      ListView.builder(
        shrinkWrap: true,
        itemCount: _model.assets.length + 1,
        itemBuilder: (context, index) {
          final isLast = index >= _model.assets.length;
          final a = isLast ? null : _model.assets[index];

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
      ),
      ModalBottomActions(
        onConfirm: () {
          // if (_model.assets.isEmpty) {
          //   Navigator.of(context).pop();
          //   _provider.clear();

          //   return;
          // }

          _provider.complete();
          Navigator.of(context).pop();
        },
      )
    ]);
  }
}
