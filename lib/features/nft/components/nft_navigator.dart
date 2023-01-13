import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../providers/minted_nft_list_provider.dart';
import '../providers/nft_list_provider.dart';

class NftNavigator extends BaseComponent {
  const NftNavigator({
    Key? key,
    required this.minted,
  }) : super(key: key);

  final bool minted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NftListModel _model = ref.watch(minted ? mintedNftListProvider : nftListProvider);

    final hasNextPage = _model.data.canLoadMore;
    final hasPrevPage = _model.data.page > 1;
    final canSearch = _model.search.isNotEmpty;
    final canClearSearch = _model.search.isNotEmpty;

    final searchController = minted ? ref.read(mintedNftListProvider.notifier).searchController : ref.read(nftListProvider.notifier).searchController;

    void handleSearch() {
      if (minted) {
        ref.read(mintedNftListProvider.notifier).load(1);
      } else {
        ref.read(nftListProvider.notifier).load(1);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            controller: searchController,
            onFieldSubmitted: (_) {
              handleSearch();
            },
            onChanged: (val) {
              if (minted) {
                ref.read(mintedNftListProvider.notifier).setSearch(val);
              } else {
                ref.read(nftListProvider.notifier).setSearch(val);
              }
            },
            style: TextStyle(color: _model.search == _model.currentSearch ? Colors.white : Colors.white70),
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: canSearch ? Colors.white : Colors.white12,
                    ),
                    onPressed: canSearch ? handleSearch : null,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: canClearSearch ? Colors.white : Colors.white12,
                    ),
                    onPressed: canClearSearch
                        ? () {
                            if (minted) {
                              ref.read(mintedNftListProvider.notifier).clearSearch();
                              ref.read(mintedNftListProvider.notifier).load(1);
                            } else {
                              ref.read(nftListProvider.notifier).clearSearch();
                              ref.read(nftListProvider.notifier).load(1);
                            }
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              label: "Prev Page",
              onPressed: hasPrevPage
                  ? () {
                      if (minted) {
                        ref.read(mintedNftListProvider.notifier).load(_model.data.page - 1);
                      } else {
                        ref.read(nftListProvider.notifier).load(_model.data.page - 1);
                      }
                    }
                  : null,
            ),
            SizedBox(
              width: 8,
            ),
            AppButton(
              label: "Next Page",
              onPressed: hasNextPage
                  ? () {
                      if (minted) {
                        ref.read(mintedNftListProvider.notifier).load(_model.data.page + 1);
                      } else {
                        ref.read(nftListProvider.notifier).load(_model.data.page + 1);
                      }
                    }
                  : null,
            ),
            IconButton(
                onPressed: () {
                  if (minted) {
                    ref.read(mintedNftListProvider.notifier).reloadCurrentPage();
                  } else {
                    ref.read(nftListProvider.notifier).reloadCurrentPage();
                  }
                },
                icon: Icon(Icons.refresh))
          ],
        )
      ],
    );
  }
}
