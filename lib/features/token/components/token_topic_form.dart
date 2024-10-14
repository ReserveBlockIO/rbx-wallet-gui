import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/new_token_topic.dart';

import '../../../core/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/dialogs.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/toast.dart';
import '../../encrypt/utils.dart';
import '../providers/token_topic_form_provider.dart';

class TokenTopicForm extends BaseComponent {
  final String scId;
  final String address;
  const TokenTopicForm({
    Key? key,
    required this.scId,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final family = "$scId||$address";
    final provider = ref.read(tokenTopicFormProvider(family).notifier);
    final model = ref.watch(tokenTopicFormProvider(family));
    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: TextFormField(
                        controller: provider.nameController,
                        validator: provider.nameValidator,
                        decoration: const InputDecoration(
                          label: Text("Topic Name"),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                            RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                          )
                        ],
                        maxLength: 128,
                        buildCounter: (context, {int? currentLength, int? maxLength, bool? isFocused}) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "128 character limit",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                "$currentLength/$maxLength",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          );
                        }),
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
                      DropdownButton<TokenVotingDays>(
                        focusColor: Colors.transparent,
                        value: model.votingEndDays,
                        items: provider.votingDaysOptions(context).map((item) {
                          return DropdownMenuItem<TokenVotingDays>(
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
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: provider.descriptionController,
              validator: provider.descriptionValidator,
              decoration: const InputDecoration(
                label: Text("Topic Description"),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
              ],
              minLines: 3,
              maxLines: 6,

              // maxLength: 1600,
              buildCounter: (context, {int? currentLength, int? maxLength, bool? isFocused}) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1,600 character limit including provided links",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "$currentLength/1600",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                );
              },
            ),
            TextFormField(
              controller: provider.miniumVotesController,
              validator: provider.minimumVotesValidator,
              decoration: const InputDecoration(
                label: Text("Minimum Token Requirement"),
                helperText: "The minimum token balance required to vote.",
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
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
                    if (!await passwordRequiredGuard(context, ref)) return;
                    final confirmed = await ConfirmDialog.show(
                      title: "Create Topic",
                      body: "Are you sure you want to create this token topic?",
                      confirmText: "Create",
                      cancelText: "Cancel",
                    );

                    if (confirmed != true) {
                      return;
                    }
                    final success = await provider.submit();
                    if (success == null) return;

                    if (success == true) {
                      Toast.message("Token Topic Created");
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
      ),
    );
  }
}
