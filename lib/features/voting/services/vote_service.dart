import 'dart:convert';

import '../../../core/services/base_service.dart';
import '../models/vote.dart';

class VoteService extends BaseService {
  VoteService() : super(apiBasePathOverride: "/voapi/VOV1");

  Future<List<Vote>> _list(String path) async {
    try {
      final response = await getText(path);
      final items = jsonDecode(response);

      final List<Vote> votes = [];
      for (final item in items) {
        votes.add(Vote.fromJson(item));
      }
      return votes;
    } catch (e, st) {
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
      final url = "/CastTopicVote/$topicUid/${yes ? 1 : 0}";
      print(url);
      final response = await getText(url, cleanPath: false);
      print(response);
      return true;
    } catch (e, st) {
      print(e);
      print(st);
      return false;
    }
  }

  Future<bool> castVoteYes(String topicUid) async {
    return _castVote(topicUid, true);
  }

  Future<bool> castVoteNo(String topicUid) async {
    return _castVote(topicUid, false);
  }
}
