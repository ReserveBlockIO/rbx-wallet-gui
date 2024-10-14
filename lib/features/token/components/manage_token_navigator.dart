import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/token_list_provider.dart';
import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';

class ManageTokenNavigator extends BaseComponent {
  const ManageTokenNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TokenListModel _model = ref.watch(tokenListProvider);

    final hasNextPage = kIsWeb ? true : _model.data.canLoadMore;
    final hasPrevPage = _model.data.page > 1;
    final canSearch = _model.search.isNotEmpty;
    final canClearSearch = _model.search.isNotEmpty;

    final searchController = ref.read(tokenListProvider.notifier).searchController;

    void handleSearch() {
      ref.read(tokenListProvider.notifier).load(1);
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
              ref.read(tokenListProvider.notifier).setSearch(val);
            },
            style: TextStyle(color: _model.search == _model.currentSearch ? Colors.white : Colors.white70),
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: const Icon(
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
                            ref.read(tokenListProvider.notifier).clearSearch();
                            ref.read(tokenListProvider.notifier).load(1);
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              label: "Prev Page",
              onPressed: hasPrevPage
                  ? () {
                      ref.read(tokenListProvider.notifier).load(_model.data.page - 1);
                    }
                  : null,
            ),
            const SizedBox(
              width: 8,
            ),
            AppButton(
              label: "Next Page",
              onPressed: hasNextPage
                  ? () {
                      ref.read(tokenListProvider.notifier).load(_model.data.page + 1);
                    }
                  : null,
            ),
            IconButton(
                onPressed: () {
                  ref.read(tokenListProvider.notifier).reloadCurrentPage();
                },
                icon: const Icon(Icons.refresh))
          ],
        )
      ],
    );
  }
}
