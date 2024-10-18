import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/app_theme.dart';
import 'web_collection_list_tile.dart';
import '../providers/web_collection_form_provider.dart';
import '../providers/web_shop_detail_provider.dart';
import '../screens/my_create_collection_container_screen.dart';

import '../../../core/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../models/web_collection.dart';
import '../providers/web_collection_list_provider.dart';

class WebMyCollectionList extends BaseComponent {
  final int shopId;
  const WebMyCollectionList(
    this.shopId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.read(webCollectionListProvider(shopId).notifier);

    return InfiniteList<WebCollection>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, collection, index) => WebCollectionTile(
        collection,
      ),
      emptyText: "No Collections",
      emptyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Now you can create collections and then add listings to them.",
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            _CreateCollectionButton(
              buttonType: AppButtonType.Elevated,
              shopId: shopId,
            ),
          ],
        ),
      ),
      onRefresh: listProvider.refresh,
    );
  }
}

class _CreateCollectionButton extends BaseComponent {
  final int shopId;
  final AppButtonType buttonType;
  const _CreateCollectionButton({
    required this.shopId,
    this.buttonType = AppButtonType.Elevated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.read(webShopDetailProvider(shopId)).value;

    if (shop == null) {
      return SizedBox();
    }

    return AppButton(
      label: 'Create Collection',
      icon: Icons.add,
      type: buttonType,
      variant: AppColorVariant.Success,
      onPressed: () async {
        ref.read(webCollectionFormProvider.notifier).clear(shop);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyCreateCollectionContainerScreen()));
      },
    );
  }
}
