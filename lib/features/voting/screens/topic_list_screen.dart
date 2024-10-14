import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/back_to_home_button.dart';

import '../../../core/app_router.gr.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../components/topic_grid.dart';
import '../components/topic_list.dart';
import '../components/topic_search_modal.dart';
import '../providers/topic_list_provider.dart';
import '../providers/topic_list_view_provider.dart';
import '../providers/topic_search_provider.dart';
import '../services/topic_service.dart';
import '../utils.dart';

class TopicListScreen extends BaseScreen {
  const TopicListScreen({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.black87,
          horizontalPadding: 0,
          verticalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(topicListViewProvider.notifier);
    final isGrid = ref.watch(topicListViewProvider);
    return AppBar(
      title: const Text("Validator Voting Topics"),
      backgroundColor: Colors.black54,
      leading: BackToHomeButton(),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
              label: "Create Topic",
              variant: AppColorVariant.Light,
              onPressed: () async {
                if (!currentWalletIsValidating(ref)) {
                  Toast.error("Your active account must be a validator to create a topic.");
                  return;
                }

                final myTopics = await TopicService().mine();
                final activeTopics = myTopics.where((t) => t.isActive).toList();
                if (activeTopics.isNotEmpty) {
                  Toast.error("Only one active topic per address is allowed.");
                  return;
                }

                final balance = ref.read(sessionProvider).currentWallet?.balance;
                if (balance == null) {
                  Toast.error("A balance is required");
                  return;
                }

                if (balance < 1002) {
                  Toast.error("Balance will not be sufficent to validate due to the cost of creating a topic (1 VFX + fee)");
                  return;
                }

                AutoRouter.of(context).push(const CreateTopicScreenRoute());
              },
            ),
            IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const TopicSearchModal();
                    });
                ref.read(topicSearchProvider.notifier).clear();
              },
              icon: const Icon(Icons.search),
            ),
            if (!isGrid)
              IconButton(
                onPressed: () {
                  provider.setGrid();
                },
                icon: const Icon(Icons.grid_on, color: Colors.white),
              ),
            if (isGrid)
              IconButton(
                onPressed: () {
                  provider.setList();
                },
                icon: const Icon(Icons.list_outlined, color: Colors.white),
              ),
          ],
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isGrid = ref.watch(topicListViewProvider);

    return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                child: Text("Active"),
              ),
              Tab(
                child: Text("Inactive"),
              ),
              Tab(
                child: Text("Voted"),
              ),
              Tab(
                child: Text("Not Voted"),
              ),
              Tab(
                child: Text("All"),
              ),
              Tab(
                child: Text("My Topics"),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TopicListType.Active,
                TopicListType.Inactive,
                TopicListType.VotedOn,
                TopicListType.NotVotedOn,
                TopicListType.All,
                TopicListType.Mine
              ].map((type) {
                return isGrid
                    ? TopicGrid(
                        type: type,
                      )
                    : TopicList(
                        type: type,
                      );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
