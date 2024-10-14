import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/explorer_service.dart';
import '../models/token_vote_topic.dart';

final webTokenTopicDetailProvider = FutureProvider.family<WebTokenVoteTopic?, String>((ref, String topicId) async {
  return ExplorerService().retrieveTokenVotingTopic(topicId);
});
