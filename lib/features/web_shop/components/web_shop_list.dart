import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rbx_wallet/features/web_shop/components/web_shop_list_tile.dart';
import 'package:rbx_wallet/features/web_shop/providers/web_shop_full_list_provider.dart';

import '../../../core/base_component.dart';

import '../providers/web_shop_search_provider.dart';

class WebShopListContainer extends ConsumerStatefulWidget {
  const WebShopListContainer({
    Key? key,
  }) : super(key: key);

  @override
  _WebShopListContainerState createState() => _WebShopListContainerState();
}

class _WebShopListContainerState extends ConsumerState<WebShopListContainer> {
  late final int shopId;

  @override
  void initState() {
    super.initState();

    ref.read(webShopFullListProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    return WebShopList();
  }
}

class WebShopList extends BaseComponent {
  const WebShopList({
    Key? key,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final shops = ref.watch(webShopFullListProvider);

    final searchQuery = ref.watch(webShopSearchProvider).toLowerCase();

    final filteredShops = searchQuery.isEmpty
        ? [...shops]
        : shops.where((s) {
            if (s.url.replaceAll("rbx://", "").toLowerCase().contains(searchQuery)) {
              return true;
            }

            if (s.name.toLowerCase().contains(searchQuery)) {
              return true;
            }

            if (s.ownerAddress.toLowerCase().contains(searchQuery)) {
              return true;
            }
            return false;
          }).toList();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: ref.read(webShopSearchProvider.notifier).controller,
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  hintText: "Search for auction house...",
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: searchQuery.isEmpty ? Colors.white10 : Colors.white,
                    ),
                    onPressed: () {
                      ref.read(webShopSearchProvider.notifier).clear();
                    },
                  ),
                ),
                onChanged: (val) {
                  ref.read(webShopSearchProvider.notifier).update(val);
                },
                onFieldSubmitted: (val) {},
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: filteredShops.length,
                itemBuilder: (context, index) {
                  final s = filteredShops[index];
                  return WebShopTile(
                    s,
                    requiresAuth: false,
                  );
                })),
      ],
    );
  }
}
