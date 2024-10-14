import 'package:flutter/material.dart';
import '../../core/models/value_label.dart';
import 'models/new_token_topic.dart';

String tokenVotingDaysToString(BuildContext context, TokenVotingDays value) {
  switch (value) {
    case TokenVotingDays.Thirty:
      return "30 Days";
    case TokenVotingDays.Sixty:
      return "60 Days";
    case TokenVotingDays.Ninety:
      return "90 Days";
    case TokenVotingDays.OneHundredEighty:
      return "180 Days";
  }
}

List<ValueLabel<TokenVotingDays>> tokenVotingDaysValueLabels(BuildContext context) {
  return TokenVotingDays.values.map((v) => ValueLabel<TokenVotingDays>(v, tokenVotingDaysToString(context, v))).toList();
}
