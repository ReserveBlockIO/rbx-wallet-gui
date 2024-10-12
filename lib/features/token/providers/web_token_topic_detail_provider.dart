import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/services/explorer_service.dart';
import 'package:rbx_wallet/features/token/models/token_vote_topic.dart';

final webTokenTopicDetailProvider = FutureProvider.family<WebTokenVoteTopic?, String>((ref, String topicId) async {
  return ExplorerService().retrieveTokenVotingTopic(topicId);
});
