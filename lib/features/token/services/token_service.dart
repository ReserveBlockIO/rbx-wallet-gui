import 'dart:convert';

import '../../../utils/toast.dart';

import '../../../core/services/base_service.dart';
import '../models/new_token_topic.dart';
import '../models/token_vote.dart';

class TokenService extends BaseService {
  TokenService() : super(apiBasePathOverride: "/tkapi/TKV2");

  Future<bool> mint({
    required String scId,
    required String fromAddress,
    required double amount,
  }) async {
    try {
      final response = await getText("/TokenMint/$scId/$fromAddress/$amount", cleanPath: false, inspect: true);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error minting token");
      print(e);
      return false;
    }
  }

  Future<bool> transfer({
    required String scId,
    required String fromAddress,
    required String toAddress,
    required double amount,
  }) async {
    try {
      final response = await getText("/TransferToken/$scId/$fromAddress/$toAddress/$amount", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error transferring token");
      print(e);
      return false;
    }
  }

  Future<bool> burn({
    required String scId,
    required String fromAddress,
    required double amount,
  }) async {
    try {
      final response = await getText("/BurnToken/$scId/$fromAddress/$amount", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error burning token");
      print(e);
      return false;
    }
  }

  Future<bool> pause({
    required String scId,
    required String fromAddress,
  }) async {
    try {
      final path = "/PauseTokenContract/$scId/$fromAddress";
      final response = await getText(path, cleanPath: false, inspect: true);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error pausing/unpausing token");
      print(e);
      return false;
    }
  }

  Future<bool> changeOwnership({
    required String scId,
    required String fromAddress,
    required String toAddress,
  }) async {
    try {
      final response = await getText("/ChangeTokenContractOwnership/$scId/$fromAddress/$toAddress", cleanPath: false, inspect: true);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error changing ownership");
      print(e);
      return false;
    }
  }

  Future<bool> banAddress({
    required String scId,
    required String fromAddress,
    required String banAddress,
  }) async {
    try {
      final response = await getText("/BanAddress/$scId/$fromAddress/$banAddress", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error banning address");
      print(e);
      return false;
    }
  }

  Future<bool> createTopic(NewTokenTopic topic) async {
    try {
      final response = await postJson('/CreateTokenTopic', cleanPath: false, params: topic.toJson());

      final data = response['data'];

      if (data['Success'] == true) {
        return true;
      }

      Toast.error(data['Message']);

      return false;
    } catch (e) {
      print("Error creating topic");
      Toast.error("Error creating topic");
      print(e);
      return false;
    }
  }

  Future<bool> castVote({
    required String scId,
    required String fromAddress,
    required String topicUid,
    required bool yes,
  }) async {
    try {
      final path = "/CastTokenTopicVote/$scId/$fromAddress/$topicUid/${yes ? 1 : 0}";
      print(path);
      final response = await getText(path, cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true) {
        return true;
      }
      Toast.error(data['Message']);
      return false;
    } catch (e) {
      Toast.error("Error banning address");
      print(e);
      return false;
    }
  }

  Future<TokenVote?> getVote(String topicUid) async {
    try {
      final response = await getText("/GetVoteByTopic/$topicUid", cleanPath: false);
      final data = jsonDecode(response);
      print(data);

      if (data['Success'] == true && data['VoteList'] != null) {
        return TokenVote.fromJson(data['VoteList']);
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<TokenVote>> listVotes(String topicUid) async {
    try {
      final response = await getText("/GetTokenOwnerVoteList/$topicUid", cleanPath: false);
      final data = jsonDecode(response);
      print(data);

      if (data['Success'] == true && data['VoteList'] != null) {
        final List<TokenVote> votes = [];
        for (final v in data['VoteList']) {
          votes.add(TokenVote.fromJson(v));
        }
        return votes;
      }

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<TokenVote>> listAddressVotes(String address) async {
    try {
      final response = await getText("/GetVotesByAddress/$address", cleanPath: false);
      final data = jsonDecode(response);

      if (data['Success'] == true && data['VoteList'] != null) {
        final List<TokenVote> votes = [];
        for (final v in data['VoteList']) {
          votes.add(TokenVote.fromJson(v));
        }
        return votes;
      }

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
