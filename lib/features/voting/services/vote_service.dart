import 'dart:convert';

import 'package:rbx_wallet/core/services/base_service.dart';
import 'package:rbx_wallet/features/voting/models/vote.dart';

class VoteService extends BaseService {
  VoteService() : super(apiBasePathOverride: "/voapi/VOV1");

  Future<List<Vote>> _list(String path) async {
    try {
      final response = await getText(path);
      final items = jsonDecode(response);

      final List<Vote> topics = [];
      for (final item in items) {
        topics.add(Vote.fromJson(item));
      }
      return items;
    } catch (e, st) {
      print(e);
      print(st);
      return [];
    }
  }

  Future<List<Vote>> mine() async {
    return await _list("/GetMyVotes");
  }

  Future<List<Vote>> topic(String topicUid) async {
    return await _list("/GetTopicVotes/$topicUid");
  }

  Future<bool> _castVote(String topicUid, bool yes) async {
    try {
      await getText("/CastTopicVote/$topicUid/${yes ? 1 : 0}");
      return true;
    } catch (e, st) {
      print(e);
      print(st);
      return false;
    }
  }

  Future<bool> caseVoteYes(String topicUid) async {
    return _castVote(topicUid, true);
  }

  Future<bool> caseVoteNo(String topicUid) async {
    return _castVote(topicUid, false);
  }
}
