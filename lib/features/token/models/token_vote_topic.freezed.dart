// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_vote_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenVoteTopic _$TokenVoteTopicFromJson(Map<String, dynamic> json) {
  return _TokenVoteTopic.fromJson(json);
}

/// @nodoc
mixin _$TokenVoteTopic {
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicUID")
  String get topicUid => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicName")
  String get topicName => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicDescription")
  String get topicDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "MinimumVoteRequirement")
  int get minimumVoteRequirement => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenHolderCount")
  int get tokenHolderCount => throw _privateConstructorUsedError;
  @JsonKey(name: "TopicCreateDate")
  int get topicCreateDate => throw _privateConstructorUsedError;
  @JsonKey(name: "VotingEndDate")
  int get votingEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: "BlockHeight")
  int get blockHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteYes")
  int get voteYes => throw _privateConstructorUsedError;
  @JsonKey(name: "VoteNo")
  int get voteNo => throw _privateConstructorUsedError;
  @JsonKey(name: "TotalVotes")
  double get totalVotes => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentVotesYes")
  double get percentVotesYes => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentVotesNo")
  double get percentVotesNo => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentInFavor")
  double get percentInFavor => throw _privateConstructorUsedError;
  @JsonKey(name: "PercentAgainst")
  double get percentAgainst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenVoteTopicCopyWith<TokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenVoteTopicCopyWith<$Res> {
  factory $TokenVoteTopicCopyWith(
          TokenVoteTopic value, $Res Function(TokenVoteTopic) then) =
      _$TokenVoteTopicCopyWithImpl<$Res, TokenVoteTopic>;
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "TopicUID") String topicUid,
      @JsonKey(name: "TopicName") String topicName,
      @JsonKey(name: "TopicDescription") String topicDescription,
      @JsonKey(name: "MinimumVoteRequirement") int minimumVoteRequirement,
      @JsonKey(name: "TokenHolderCount") int tokenHolderCount,
      @JsonKey(name: "TopicCreateDate") int topicCreateDate,
      @JsonKey(name: "VotingEndDate") int votingEndDate,
      @JsonKey(name: "BlockHeight") int blockHeight,
      @JsonKey(name: "VoteYes") int voteYes,
      @JsonKey(name: "VoteNo") int voteNo,
      @JsonKey(name: "TotalVotes") double totalVotes,
      @JsonKey(name: "PercentVotesYes") double percentVotesYes,
      @JsonKey(name: "PercentVotesNo") double percentVotesNo,
      @JsonKey(name: "PercentInFavor") double percentInFavor,
      @JsonKey(name: "PercentAgainst") double percentAgainst});
}

/// @nodoc
class _$TokenVoteTopicCopyWithImpl<$Res, $Val extends TokenVoteTopic>
    implements $TokenVoteTopicCopyWith<$Res> {
  _$TokenVoteTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? tokenHolderCount = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
    Object? blockHeight = null,
    Object? voteYes = null,
    Object? voteNo = null,
    Object? totalVotes = null,
    Object? percentVotesYes = null,
    Object? percentVotesNo = null,
    Object? percentInFavor = null,
    Object? percentAgainst = null,
  }) {
    return _then(_value.copyWith(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      tokenHolderCount: null == tokenHolderCount
          ? _value.tokenHolderCount
          : tokenHolderCount // ignore: cast_nullable_to_non_nullable
              as int,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as int,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as int,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      voteYes: null == voteYes
          ? _value.voteYes
          : voteYes // ignore: cast_nullable_to_non_nullable
              as int,
      voteNo: null == voteNo
          ? _value.voteNo
          : voteNo // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesYes: null == percentVotesYes
          ? _value.percentVotesYes
          : percentVotesYes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesNo: null == percentVotesNo
          ? _value.percentVotesNo
          : percentVotesNo // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: null == percentInFavor
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: null == percentAgainst
          ? _value.percentAgainst
          : percentAgainst // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenVoteTopicCopyWith<$Res>
    implements $TokenVoteTopicCopyWith<$Res> {
  factory _$$_TokenVoteTopicCopyWith(
          _$_TokenVoteTopic value, $Res Function(_$_TokenVoteTopic) then) =
      __$$_TokenVoteTopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SmartContractUID") String smartContractUid,
      @JsonKey(name: "TopicUID") String topicUid,
      @JsonKey(name: "TopicName") String topicName,
      @JsonKey(name: "TopicDescription") String topicDescription,
      @JsonKey(name: "MinimumVoteRequirement") int minimumVoteRequirement,
      @JsonKey(name: "TokenHolderCount") int tokenHolderCount,
      @JsonKey(name: "TopicCreateDate") int topicCreateDate,
      @JsonKey(name: "VotingEndDate") int votingEndDate,
      @JsonKey(name: "BlockHeight") int blockHeight,
      @JsonKey(name: "VoteYes") int voteYes,
      @JsonKey(name: "VoteNo") int voteNo,
      @JsonKey(name: "TotalVotes") double totalVotes,
      @JsonKey(name: "PercentVotesYes") double percentVotesYes,
      @JsonKey(name: "PercentVotesNo") double percentVotesNo,
      @JsonKey(name: "PercentInFavor") double percentInFavor,
      @JsonKey(name: "PercentAgainst") double percentAgainst});
}

/// @nodoc
class __$$_TokenVoteTopicCopyWithImpl<$Res>
    extends _$TokenVoteTopicCopyWithImpl<$Res, _$_TokenVoteTopic>
    implements _$$_TokenVoteTopicCopyWith<$Res> {
  __$$_TokenVoteTopicCopyWithImpl(
      _$_TokenVoteTopic _value, $Res Function(_$_TokenVoteTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? tokenHolderCount = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
    Object? blockHeight = null,
    Object? voteYes = null,
    Object? voteNo = null,
    Object? totalVotes = null,
    Object? percentVotesYes = null,
    Object? percentVotesNo = null,
    Object? percentInFavor = null,
    Object? percentAgainst = null,
  }) {
    return _then(_$_TokenVoteTopic(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as int,
      tokenHolderCount: null == tokenHolderCount
          ? _value.tokenHolderCount
          : tokenHolderCount // ignore: cast_nullable_to_non_nullable
              as int,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as int,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as int,
      blockHeight: null == blockHeight
          ? _value.blockHeight
          : blockHeight // ignore: cast_nullable_to_non_nullable
              as int,
      voteYes: null == voteYes
          ? _value.voteYes
          : voteYes // ignore: cast_nullable_to_non_nullable
              as int,
      voteNo: null == voteNo
          ? _value.voteNo
          : voteNo // ignore: cast_nullable_to_non_nullable
              as int,
      totalVotes: null == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesYes: null == percentVotesYes
          ? _value.percentVotesYes
          : percentVotesYes // ignore: cast_nullable_to_non_nullable
              as double,
      percentVotesNo: null == percentVotesNo
          ? _value.percentVotesNo
          : percentVotesNo // ignore: cast_nullable_to_non_nullable
              as double,
      percentInFavor: null == percentInFavor
          ? _value.percentInFavor
          : percentInFavor // ignore: cast_nullable_to_non_nullable
              as double,
      percentAgainst: null == percentAgainst
          ? _value.percentAgainst
          : percentAgainst // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenVoteTopic extends _TokenVoteTopic {
  _$_TokenVoteTopic(
      {@JsonKey(name: "SmartContractUID")
          required this.smartContractUid,
      @JsonKey(name: "TopicUID")
          required this.topicUid,
      @JsonKey(name: "TopicName")
          required this.topicName,
      @JsonKey(name: "TopicDescription")
          required this.topicDescription,
      @JsonKey(name: "MinimumVoteRequirement")
          required this.minimumVoteRequirement,
      @JsonKey(name: "TokenHolderCount")
          required this.tokenHolderCount,
      @JsonKey(name: "TopicCreateDate")
          required this.topicCreateDate,
      @JsonKey(name: "VotingEndDate")
          required this.votingEndDate,
      @JsonKey(name: "BlockHeight")
          required this.blockHeight,
      @JsonKey(name: "VoteYes")
          required this.voteYes,
      @JsonKey(name: "VoteNo")
          required this.voteNo,
      @JsonKey(name: "TotalVotes")
          required this.totalVotes,
      @JsonKey(name: "PercentVotesYes")
          required this.percentVotesYes,
      @JsonKey(name: "PercentVotesNo")
          required this.percentVotesNo,
      @JsonKey(name: "PercentInFavor")
          required this.percentInFavor,
      @JsonKey(name: "PercentAgainst")
          required this.percentAgainst})
      : super._();

  factory _$_TokenVoteTopic.fromJson(Map<String, dynamic> json) =>
      _$$_TokenVoteTopicFromJson(json);

  @override
  @JsonKey(name: "SmartContractUID")
  final String smartContractUid;
  @override
  @JsonKey(name: "TopicUID")
  final String topicUid;
  @override
  @JsonKey(name: "TopicName")
  final String topicName;
  @override
  @JsonKey(name: "TopicDescription")
  final String topicDescription;
  @override
  @JsonKey(name: "MinimumVoteRequirement")
  final int minimumVoteRequirement;
  @override
  @JsonKey(name: "TokenHolderCount")
  final int tokenHolderCount;
  @override
  @JsonKey(name: "TopicCreateDate")
  final int topicCreateDate;
  @override
  @JsonKey(name: "VotingEndDate")
  final int votingEndDate;
  @override
  @JsonKey(name: "BlockHeight")
  final int blockHeight;
  @override
  @JsonKey(name: "VoteYes")
  final int voteYes;
  @override
  @JsonKey(name: "VoteNo")
  final int voteNo;
  @override
  @JsonKey(name: "TotalVotes")
  final double totalVotes;
  @override
  @JsonKey(name: "PercentVotesYes")
  final double percentVotesYes;
  @override
  @JsonKey(name: "PercentVotesNo")
  final double percentVotesNo;
  @override
  @JsonKey(name: "PercentInFavor")
  final double percentInFavor;
  @override
  @JsonKey(name: "PercentAgainst")
  final double percentAgainst;

  @override
  String toString() {
    return 'TokenVoteTopic(smartContractUid: $smartContractUid, topicUid: $topicUid, topicName: $topicName, topicDescription: $topicDescription, minimumVoteRequirement: $minimumVoteRequirement, tokenHolderCount: $tokenHolderCount, topicCreateDate: $topicCreateDate, votingEndDate: $votingEndDate, blockHeight: $blockHeight, voteYes: $voteYes, voteNo: $voteNo, totalVotes: $totalVotes, percentVotesYes: $percentVotesYes, percentVotesNo: $percentVotesNo, percentInFavor: $percentInFavor, percentAgainst: $percentAgainst)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenVoteTopic &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.topicUid, topicUid) ||
                other.topicUid == topicUid) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.topicDescription, topicDescription) ||
                other.topicDescription == topicDescription) &&
            (identical(other.minimumVoteRequirement, minimumVoteRequirement) ||
                other.minimumVoteRequirement == minimumVoteRequirement) &&
            (identical(other.tokenHolderCount, tokenHolderCount) ||
                other.tokenHolderCount == tokenHolderCount) &&
            (identical(other.topicCreateDate, topicCreateDate) ||
                other.topicCreateDate == topicCreateDate) &&
            (identical(other.votingEndDate, votingEndDate) ||
                other.votingEndDate == votingEndDate) &&
            (identical(other.blockHeight, blockHeight) ||
                other.blockHeight == blockHeight) &&
            (identical(other.voteYes, voteYes) || other.voteYes == voteYes) &&
            (identical(other.voteNo, voteNo) || other.voteNo == voteNo) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes) &&
            (identical(other.percentVotesYes, percentVotesYes) ||
                other.percentVotesYes == percentVotesYes) &&
            (identical(other.percentVotesNo, percentVotesNo) ||
                other.percentVotesNo == percentVotesNo) &&
            (identical(other.percentInFavor, percentInFavor) ||
                other.percentInFavor == percentInFavor) &&
            (identical(other.percentAgainst, percentAgainst) ||
                other.percentAgainst == percentAgainst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      smartContractUid,
      topicUid,
      topicName,
      topicDescription,
      minimumVoteRequirement,
      tokenHolderCount,
      topicCreateDate,
      votingEndDate,
      blockHeight,
      voteYes,
      voteNo,
      totalVotes,
      percentVotesYes,
      percentVotesNo,
      percentInFavor,
      percentAgainst);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenVoteTopicCopyWith<_$_TokenVoteTopic> get copyWith =>
      __$$_TokenVoteTopicCopyWithImpl<_$_TokenVoteTopic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenVoteTopicToJson(
      this,
    );
  }
}

abstract class _TokenVoteTopic extends TokenVoteTopic {
  factory _TokenVoteTopic(
      {@JsonKey(name: "SmartContractUID")
          required final String smartContractUid,
      @JsonKey(name: "TopicUID")
          required final String topicUid,
      @JsonKey(name: "TopicName")
          required final String topicName,
      @JsonKey(name: "TopicDescription")
          required final String topicDescription,
      @JsonKey(name: "MinimumVoteRequirement")
          required final int minimumVoteRequirement,
      @JsonKey(name: "TokenHolderCount")
          required final int tokenHolderCount,
      @JsonKey(name: "TopicCreateDate")
          required final int topicCreateDate,
      @JsonKey(name: "VotingEndDate")
          required final int votingEndDate,
      @JsonKey(name: "BlockHeight")
          required final int blockHeight,
      @JsonKey(name: "VoteYes")
          required final int voteYes,
      @JsonKey(name: "VoteNo")
          required final int voteNo,
      @JsonKey(name: "TotalVotes")
          required final double totalVotes,
      @JsonKey(name: "PercentVotesYes")
          required final double percentVotesYes,
      @JsonKey(name: "PercentVotesNo")
          required final double percentVotesNo,
      @JsonKey(name: "PercentInFavor")
          required final double percentInFavor,
      @JsonKey(name: "PercentAgainst")
          required final double percentAgainst}) = _$_TokenVoteTopic;
  _TokenVoteTopic._() : super._();

  factory _TokenVoteTopic.fromJson(Map<String, dynamic> json) =
      _$_TokenVoteTopic.fromJson;

  @override
  @JsonKey(name: "SmartContractUID")
  String get smartContractUid;
  @override
  @JsonKey(name: "TopicUID")
  String get topicUid;
  @override
  @JsonKey(name: "TopicName")
  String get topicName;
  @override
  @JsonKey(name: "TopicDescription")
  String get topicDescription;
  @override
  @JsonKey(name: "MinimumVoteRequirement")
  int get minimumVoteRequirement;
  @override
  @JsonKey(name: "TokenHolderCount")
  int get tokenHolderCount;
  @override
  @JsonKey(name: "TopicCreateDate")
  int get topicCreateDate;
  @override
  @JsonKey(name: "VotingEndDate")
  int get votingEndDate;
  @override
  @JsonKey(name: "BlockHeight")
  int get blockHeight;
  @override
  @JsonKey(name: "VoteYes")
  int get voteYes;
  @override
  @JsonKey(name: "VoteNo")
  int get voteNo;
  @override
  @JsonKey(name: "TotalVotes")
  double get totalVotes;
  @override
  @JsonKey(name: "PercentVotesYes")
  double get percentVotesYes;
  @override
  @JsonKey(name: "PercentVotesNo")
  double get percentVotesNo;
  @override
  @JsonKey(name: "PercentInFavor")
  double get percentInFavor;
  @override
  @JsonKey(name: "PercentAgainst")
  double get percentAgainst;
  @override
  @JsonKey(ignore: true)
  _$$_TokenVoteTopicCopyWith<_$_TokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

WebTokenVoteTopic _$WebTokenVoteTopicFromJson(Map<String, dynamic> json) {
  return _WebTokenVoteTopic.fromJson(json);
}

/// @nodoc
mixin _$WebTokenVoteTopic {
  @JsonKey(name: "sc_identifier")
  String get smartContractUid => throw _privateConstructorUsedError;
  @JsonKey(name: "topic_id")
  String get topicUid => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get topicName => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get topicDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "vote_requirement")
  double get minimumVoteRequirement =>
      throw _privateConstructorUsedError; // @JsonKey(name: "TokenHolderCount") required int tokenHolderCount,
  @JsonKey(name: "created_at")
  DateTime get topicCreateDate => throw _privateConstructorUsedError;
  @JsonKey(name: "voting_ends_at")
  DateTime get votingEndDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebTokenVoteTopicCopyWith<WebTokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebTokenVoteTopicCopyWith<$Res> {
  factory $WebTokenVoteTopicCopyWith(
          WebTokenVoteTopic value, $Res Function(WebTokenVoteTopic) then) =
      _$WebTokenVoteTopicCopyWithImpl<$Res, WebTokenVoteTopic>;
  @useResult
  $Res call(
      {@JsonKey(name: "sc_identifier") String smartContractUid,
      @JsonKey(name: "topic_id") String topicUid,
      @JsonKey(name: "name") String topicName,
      @JsonKey(name: "description") String topicDescription,
      @JsonKey(name: "vote_requirement") double minimumVoteRequirement,
      @JsonKey(name: "created_at") DateTime topicCreateDate,
      @JsonKey(name: "voting_ends_at") DateTime votingEndDate});
}

/// @nodoc
class _$WebTokenVoteTopicCopyWithImpl<$Res, $Val extends WebTokenVoteTopic>
    implements $WebTokenVoteTopicCopyWith<$Res> {
  _$WebTokenVoteTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
  }) {
    return _then(_value.copyWith(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebTokenVoteTopicCopyWith<$Res>
    implements $WebTokenVoteTopicCopyWith<$Res> {
  factory _$$_WebTokenVoteTopicCopyWith(_$_WebTokenVoteTopic value,
          $Res Function(_$_WebTokenVoteTopic) then) =
      __$$_WebTokenVoteTopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "sc_identifier") String smartContractUid,
      @JsonKey(name: "topic_id") String topicUid,
      @JsonKey(name: "name") String topicName,
      @JsonKey(name: "description") String topicDescription,
      @JsonKey(name: "vote_requirement") double minimumVoteRequirement,
      @JsonKey(name: "created_at") DateTime topicCreateDate,
      @JsonKey(name: "voting_ends_at") DateTime votingEndDate});
}

/// @nodoc
class __$$_WebTokenVoteTopicCopyWithImpl<$Res>
    extends _$WebTokenVoteTopicCopyWithImpl<$Res, _$_WebTokenVoteTopic>
    implements _$$_WebTokenVoteTopicCopyWith<$Res> {
  __$$_WebTokenVoteTopicCopyWithImpl(
      _$_WebTokenVoteTopic _value, $Res Function(_$_WebTokenVoteTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractUid = null,
    Object? topicUid = null,
    Object? topicName = null,
    Object? topicDescription = null,
    Object? minimumVoteRequirement = null,
    Object? topicCreateDate = null,
    Object? votingEndDate = null,
  }) {
    return _then(_$_WebTokenVoteTopic(
      smartContractUid: null == smartContractUid
          ? _value.smartContractUid
          : smartContractUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicUid: null == topicUid
          ? _value.topicUid
          : topicUid // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      topicDescription: null == topicDescription
          ? _value.topicDescription
          : topicDescription // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVoteRequirement: null == minimumVoteRequirement
          ? _value.minimumVoteRequirement
          : minimumVoteRequirement // ignore: cast_nullable_to_non_nullable
              as double,
      topicCreateDate: null == topicCreateDate
          ? _value.topicCreateDate
          : topicCreateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      votingEndDate: null == votingEndDate
          ? _value.votingEndDate
          : votingEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebTokenVoteTopic extends _WebTokenVoteTopic {
  _$_WebTokenVoteTopic(
      {@JsonKey(name: "sc_identifier") required this.smartContractUid,
      @JsonKey(name: "topic_id") required this.topicUid,
      @JsonKey(name: "name") required this.topicName,
      @JsonKey(name: "description") required this.topicDescription,
      @JsonKey(name: "vote_requirement") required this.minimumVoteRequirement,
      @JsonKey(name: "created_at") required this.topicCreateDate,
      @JsonKey(name: "voting_ends_at") required this.votingEndDate})
      : super._();

  factory _$_WebTokenVoteTopic.fromJson(Map<String, dynamic> json) =>
      _$$_WebTokenVoteTopicFromJson(json);

  @override
  @JsonKey(name: "sc_identifier")
  final String smartContractUid;
  @override
  @JsonKey(name: "topic_id")
  final String topicUid;
  @override
  @JsonKey(name: "name")
  final String topicName;
  @override
  @JsonKey(name: "description")
  final String topicDescription;
  @override
  @JsonKey(name: "vote_requirement")
  final double minimumVoteRequirement;
// @JsonKey(name: "TokenHolderCount") required int tokenHolderCount,
  @override
  @JsonKey(name: "created_at")
  final DateTime topicCreateDate;
  @override
  @JsonKey(name: "voting_ends_at")
  final DateTime votingEndDate;

  @override
  String toString() {
    return 'WebTokenVoteTopic(smartContractUid: $smartContractUid, topicUid: $topicUid, topicName: $topicName, topicDescription: $topicDescription, minimumVoteRequirement: $minimumVoteRequirement, topicCreateDate: $topicCreateDate, votingEndDate: $votingEndDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebTokenVoteTopic &&
            (identical(other.smartContractUid, smartContractUid) ||
                other.smartContractUid == smartContractUid) &&
            (identical(other.topicUid, topicUid) ||
                other.topicUid == topicUid) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.topicDescription, topicDescription) ||
                other.topicDescription == topicDescription) &&
            (identical(other.minimumVoteRequirement, minimumVoteRequirement) ||
                other.minimumVoteRequirement == minimumVoteRequirement) &&
            (identical(other.topicCreateDate, topicCreateDate) ||
                other.topicCreateDate == topicCreateDate) &&
            (identical(other.votingEndDate, votingEndDate) ||
                other.votingEndDate == votingEndDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      smartContractUid,
      topicUid,
      topicName,
      topicDescription,
      minimumVoteRequirement,
      topicCreateDate,
      votingEndDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebTokenVoteTopicCopyWith<_$_WebTokenVoteTopic> get copyWith =>
      __$$_WebTokenVoteTopicCopyWithImpl<_$_WebTokenVoteTopic>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebTokenVoteTopicToJson(
      this,
    );
  }
}

abstract class _WebTokenVoteTopic extends WebTokenVoteTopic {
  factory _WebTokenVoteTopic(
      {@JsonKey(name: "sc_identifier")
          required final String smartContractUid,
      @JsonKey(name: "topic_id")
          required final String topicUid,
      @JsonKey(name: "name")
          required final String topicName,
      @JsonKey(name: "description")
          required final String topicDescription,
      @JsonKey(name: "vote_requirement")
          required final double minimumVoteRequirement,
      @JsonKey(name: "created_at")
          required final DateTime topicCreateDate,
      @JsonKey(name: "voting_ends_at")
          required final DateTime votingEndDate}) = _$_WebTokenVoteTopic;
  _WebTokenVoteTopic._() : super._();

  factory _WebTokenVoteTopic.fromJson(Map<String, dynamic> json) =
      _$_WebTokenVoteTopic.fromJson;

  @override
  @JsonKey(name: "sc_identifier")
  String get smartContractUid;
  @override
  @JsonKey(name: "topic_id")
  String get topicUid;
  @override
  @JsonKey(name: "name")
  String get topicName;
  @override
  @JsonKey(name: "description")
  String get topicDescription;
  @override
  @JsonKey(name: "vote_requirement")
  double get minimumVoteRequirement;
  @override // @JsonKey(name: "TokenHolderCount") required int tokenHolderCount,
  @JsonKey(name: "created_at")
  DateTime get topicCreateDate;
  @override
  @JsonKey(name: "voting_ends_at")
  DateTime get votingEndDate;
  @override
  @JsonKey(ignore: true)
  _$$_WebTokenVoteTopicCopyWith<_$_WebTokenVoteTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
