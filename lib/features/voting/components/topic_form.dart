import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/components/dropdowns.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/voting/models/new_topic.dart';
import 'package:rbx_wallet/features/voting/models/topic.dart';
import 'package:rbx_wallet/features/voting/providers/topic_form_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class TopicForm extends BaseComponent {
  const TopicForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(topicFormProvider.notifier);
    final model = ref.watch(topicFormProvider);
    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                    DropdownButton<VoteTopicCategory>(
                      value: model.category,
                      focusColor: Colors.transparent,
                      items: provider.categoryOptions(context).map((item) {
                        return DropdownMenuItem<VoteTopicCategory>(
                          value: item.value,
                          child: Text(item.label),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        provider.setCategory(val);
                      },
                      isExpanded: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Voting Ends",
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                    DropdownButton<VotingDays>(
                      focusColor: Colors.transparent,
                      value: model.votingEndDays,
                      items: provider.votingDaysOptions(context).map((item) {
                        return DropdownMenuItem<VotingDays>(
                          value: item.value,
                          child: Text(item.label),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val == null) {
                          return;
                        }
                        provider.setVotingEndDays(val);
                      },
                      isExpanded: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextFormField(
            controller: provider.nameController,
            validator: provider.nameValidator,
            decoration: InputDecoration(
              label: Text("Topic Name"),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                  RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
            ],
            maxLength: 128,
          ),
          TextFormField(
            controller: provider.descriptionController,
            validator: provider.descriptionValidator,
            decoration: InputDecoration(label: Text("Topic Description")),
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                  RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
            ],
            minLines: 3,
            maxLines: 6,
            maxLength: 1600,
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                label: "Cancel",
                type: AppButtonType.Text,
                variant: AppColorVariant.Light,
                onPressed: () async {
                  final confirmed = await ConfirmDialog.show(title: "Discard", body: "Are you sure you want to discard this new topic?");

                  if (confirmed == true) {
                    provider.clear();
                    AutoRouter.of(context).pop();
                  }
                },
              ),
              AppButton(
                label: "Create Topic",
                onPressed: () async {
                  final confirmed = await ConfirmDialog.show(
                    title: "Create Topic",
                    body: "There is a 1 RBX cost to create a topic.",
                    confirmText: "Create",
                    cancelText: "Cancel",
                  );
                  if (confirmed != true) {
                    return;
                  }
                  final success = await provider.submit();
                  if (success == null) return;

                  if (success == true) {
                    Toast.message("Topic created");
                    AutoRouter.of(context).pop();
                  } else {
                    Toast.error();
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
