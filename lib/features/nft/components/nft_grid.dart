import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/breakpoints.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/features/nft/components/nft_card.dart';
import 'package:rbx_wallet/features/nft/providers/minted_nft_list_provider.dart';
import 'package:rbx_wallet/features/nft/providers/nft_list_provider.dart';

class NftGrid extends BaseComponent {
  final bool minted;
  const NftGrid({
    Key? key,
    this.minted = false,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final NftListModel _model = ref.watch(minted ? mintedNftListProvider : nftListProvider);
    // final searchController = ref.read(minted ? mintedNftListProvider.notifier : nftListProvider.notifier).searchController;
    final hasNextPage = _model.data.canLoadMore;
    final hasPrevPage = _model.data.page > 1;
    final canSearch = _model.search.isNotEmpty;
    final canClearSearch = _model.search.isNotEmpty;

    void handleSearch() {
      if (minted) {
        ref.read(mintedNftListProvider.notifier).load(1);
      } else {
        ref.read(nftListProvider.notifier).load(1);
      }
    }

    final searchController = minted ? ref.read(mintedNftListProvider.notifier).searchController : ref.read(nftListProvider.notifier).searchController;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
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
          ),
        ),
        Expanded(
          child: Builder(builder: (context) {
            if (_model.data.results.isEmpty) {
              return Center(
                child: Text(minted ? "No minted NFTs with management capabilities." : "No NFTs found."),
              );
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: BreakPoints.useMobileLayout(context) ? 1 : 3,
                childAspectRatio: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _model.data.results.length,
              itemBuilder: (context, index) {
                final nft = _model.data.results[index];
                return NftCard(
                  nft,
                  manageOnPress: minted,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
