import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:rbx_wallet/features/voting/models/adj_vote.dart';

import '../../core/models/value_label.dart';
import '../../core/providers/session_provider.dart';
import 'models/new_topic.dart';
import 'models/topic.dart';

bool currentWalletIsValidating(WidgetRef ref) {
  return ref.read(sessionProvider).currentWallet?.isValidating == true;
}

String voteTopicCategoryToString(BuildContext context, VoteTopicCategory category) {
  switch (category) {
    case VoteTopicCategory.General:
      return "General";
    case VoteTopicCategory.CodeChange:
      return "Code Change";
    case VoteTopicCategory.AddDeveloper:
      return "Add Developer";
    case VoteTopicCategory.RemoveDeveloper:
      return "Remove Developer";
    case VoteTopicCategory.NetworkChange:
      return "Network Change";
    case VoteTopicCategory.AdjVoteIn:
      return "Adj Vote In";
    case VoteTopicCategory.AdjVoteOut:
      return "Adj Vote Out";
    case VoteTopicCategory.ValidatorChange:
      return "Validator Change";
    case VoteTopicCategory.BlockModify:
      return "Block Modify";
    case VoteTopicCategory.TransactionModify:
      return "Transaction Modify";
    case VoteTopicCategory.BalanceCorrection:
      return "Balance Correction";
    case VoteTopicCategory.HackOrExploitCorrection:
      return "Hack or Exploit Correction";
    case VoteTopicCategory.Other:
      return "Other";
  }
}

List<ValueLabel<VoteTopicCategory>> voteTopicCategoryValueLabels(BuildContext context) {
  return VoteTopicCategory.values.map((v) => ValueLabel<VoteTopicCategory>(v, voteTopicCategoryToString(context, v))).toList();
}

String votingDaysToString(BuildContext context, VotingDays value) {
  switch (value) {
    case VotingDays.Thirty:
      return "30 Days";
    case VotingDays.Sixty:
      return "60 Days";
    case VotingDays.Ninety:
      return "90 Days";
    case VotingDays.OneHundredEighty:
      return "180 Days";
  }
}

List<ValueLabel<VotingDays>> votingDaysValueLabels(BuildContext context) {
  return VotingDays.values.map((v) => ValueLabel<VotingDays>(v, votingDaysToString(context, v))).toList();
}

String providerToString(BuildContext context, Provider provider) {
  switch (provider) {
    case Provider.onlineCloudVPS:
      return "Online Cloud VPS";
    case Provider.onlineDedicated:
      return "Online Dedicated";
    case Provider.localDedicated:
      return "Local Dedicated";
    case Provider.homeMachine:
      return "Home Machine";
    case Provider.officeMachine:
      return "Office Machine";
  }
}

String osToString(BuildContext context, OS os) {
  switch (os) {
    case OS.linux:
      return "Linux";
    case OS.windows:
      return "Windows";
    case OS.mac:
      return "Mac";
  }
}

String hdSizeSpecifierToString(BuildContext context, HDSizeSpecifier size) {
  switch (size) {
    case HDSizeSpecifier.gb:
      return "GB";
    case HDSizeSpecifier.tb:
      return "TB";
    case HDSizeSpecifier.pb:
      return "PB";
  }
}

List<ValueLabel<Provider>> providerValueLabels(BuildContext context) {
  return Provider.values.map((v) => ValueLabel<Provider>(v, providerToString(context, v))).toList();
}

List<ValueLabel<OS>> osValueLabels(BuildContext context) {
  return OS.values.map((v) => ValueLabel<OS>(v, osToString(context, v))).toList();
}

List<ValueLabel<HDSizeSpecifier>> hdSizeSpecifierValueLabels(BuildContext context) {
  return HDSizeSpecifier.values.map((v) => ValueLabel<HDSizeSpecifier>(v, hdSizeSpecifierToString(context, v))).toList();
}
