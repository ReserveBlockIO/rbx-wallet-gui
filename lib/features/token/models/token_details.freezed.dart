// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenDetails _$TokenDetailsFromJson(Map<String, dynamic> json) {
  return _TokenDetails.fromJson(json);
}

/// @nodoc
mixin _$TokenDetails {
  @JsonKey(name: "TokenName")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenTicker")
  String get ticker => throw _privateConstructorUsedError;
  @JsonKey(name: "StartingSupply")
  double get startingSupply => throw _privateConstructorUsedError;
  @JsonKey(name: "CurrentSupply")
  double get currentSupply => throw _privateConstructorUsedError;
  @JsonKey(name: "DecimalPlaces")
  int get decimalPlaces => throw _privateConstructorUsedError;
  @JsonKey(name: "IsPaused")
  bool get isPaused => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenBurnable")
  bool get burnable => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenVoting")
  bool get voting => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenMintable")
  bool get mintable => throw _privateConstructorUsedError;
  @JsonKey(name: "ContractOwner")
  String get contractOwner => throw _privateConstructorUsedError;
  @JsonKey(name: "AddressBlackList")
  List<String>? get addressBlackList => throw _privateConstructorUsedError;
  @JsonKey(name: "TokenTopicList")
  List<TokenVoteTopic> get topicList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenDetailsCopyWith<TokenDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDetailsCopyWith<$Res> {
  factory $TokenDetailsCopyWith(
          TokenDetails value, $Res Function(TokenDetails) then) =
      _$TokenDetailsCopyWithImpl<$Res, TokenDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "TokenName") String name,
      @JsonKey(name: "TokenTicker") String ticker,
      @JsonKey(name: "StartingSupply") double startingSupply,
      @JsonKey(name: "CurrentSupply") double currentSupply,
      @JsonKey(name: "DecimalPlaces") int decimalPlaces,
      @JsonKey(name: "IsPaused") bool isPaused,
      @JsonKey(name: "TokenBurnable") bool burnable,
      @JsonKey(name: "TokenVoting") bool voting,
      @JsonKey(name: "TokenMintable") bool mintable,
      @JsonKey(name: "ContractOwner") String contractOwner,
      @JsonKey(name: "AddressBlackList") List<String>? addressBlackList,
      @JsonKey(name: "TokenTopicList") List<TokenVoteTopic> topicList});
}

/// @nodoc
class _$TokenDetailsCopyWithImpl<$Res, $Val extends TokenDetails>
    implements $TokenDetailsCopyWith<$Res> {
  _$TokenDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? startingSupply = null,
    Object? currentSupply = null,
    Object? decimalPlaces = null,
    Object? isPaused = null,
    Object? burnable = null,
    Object? voting = null,
    Object? mintable = null,
    Object? contractOwner = null,
    Object? addressBlackList = freezed,
    Object? topicList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      startingSupply: null == startingSupply
          ? _value.startingSupply
          : startingSupply // ignore: cast_nullable_to_non_nullable
              as double,
      currentSupply: null == currentSupply
          ? _value.currentSupply
          : currentSupply // ignore: cast_nullable_to_non_nullable
              as double,
      decimalPlaces: null == decimalPlaces
          ? _value.decimalPlaces
          : decimalPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      burnable: null == burnable
          ? _value.burnable
          : burnable // ignore: cast_nullable_to_non_nullable
              as bool,
      voting: null == voting
          ? _value.voting
          : voting // ignore: cast_nullable_to_non_nullable
              as bool,
      mintable: null == mintable
          ? _value.mintable
          : mintable // ignore: cast_nullable_to_non_nullable
              as bool,
      contractOwner: null == contractOwner
          ? _value.contractOwner
          : contractOwner // ignore: cast_nullable_to_non_nullable
              as String,
      addressBlackList: freezed == addressBlackList
          ? _value.addressBlackList
          : addressBlackList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      topicList: null == topicList
          ? _value.topicList
          : topicList // ignore: cast_nullable_to_non_nullable
              as List<TokenVoteTopic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenDetailsCopyWith<$Res>
    implements $TokenDetailsCopyWith<$Res> {
  factory _$$_TokenDetailsCopyWith(
          _$_TokenDetails value, $Res Function(_$_TokenDetails) then) =
      __$$_TokenDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "TokenName") String name,
      @JsonKey(name: "TokenTicker") String ticker,
      @JsonKey(name: "StartingSupply") double startingSupply,
      @JsonKey(name: "CurrentSupply") double currentSupply,
      @JsonKey(name: "DecimalPlaces") int decimalPlaces,
      @JsonKey(name: "IsPaused") bool isPaused,
      @JsonKey(name: "TokenBurnable") bool burnable,
      @JsonKey(name: "TokenVoting") bool voting,
      @JsonKey(name: "TokenMintable") bool mintable,
      @JsonKey(name: "ContractOwner") String contractOwner,
      @JsonKey(name: "AddressBlackList") List<String>? addressBlackList,
      @JsonKey(name: "TokenTopicList") List<TokenVoteTopic> topicList});
}

/// @nodoc
class __$$_TokenDetailsCopyWithImpl<$Res>
    extends _$TokenDetailsCopyWithImpl<$Res, _$_TokenDetails>
    implements _$$_TokenDetailsCopyWith<$Res> {
  __$$_TokenDetailsCopyWithImpl(
      _$_TokenDetails _value, $Res Function(_$_TokenDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? startingSupply = null,
    Object? currentSupply = null,
    Object? decimalPlaces = null,
    Object? isPaused = null,
    Object? burnable = null,
    Object? voting = null,
    Object? mintable = null,
    Object? contractOwner = null,
    Object? addressBlackList = freezed,
    Object? topicList = null,
  }) {
    return _then(_$_TokenDetails(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      startingSupply: null == startingSupply
          ? _value.startingSupply
          : startingSupply // ignore: cast_nullable_to_non_nullable
              as double,
      currentSupply: null == currentSupply
          ? _value.currentSupply
          : currentSupply // ignore: cast_nullable_to_non_nullable
              as double,
      decimalPlaces: null == decimalPlaces
          ? _value.decimalPlaces
          : decimalPlaces // ignore: cast_nullable_to_non_nullable
              as int,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      burnable: null == burnable
          ? _value.burnable
          : burnable // ignore: cast_nullable_to_non_nullable
              as bool,
      voting: null == voting
          ? _value.voting
          : voting // ignore: cast_nullable_to_non_nullable
              as bool,
      mintable: null == mintable
          ? _value.mintable
          : mintable // ignore: cast_nullable_to_non_nullable
              as bool,
      contractOwner: null == contractOwner
          ? _value.contractOwner
          : contractOwner // ignore: cast_nullable_to_non_nullable
              as String,
      addressBlackList: freezed == addressBlackList
          ? _value._addressBlackList
          : addressBlackList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      topicList: null == topicList
          ? _value._topicList
          : topicList // ignore: cast_nullable_to_non_nullable
              as List<TokenVoteTopic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenDetails extends _TokenDetails {
  const _$_TokenDetails(
      {@JsonKey(name: "TokenName")
          this.name = "",
      @JsonKey(name: "TokenTicker")
          this.ticker = "",
      @JsonKey(name: "StartingSupply")
          required this.startingSupply,
      @JsonKey(name: "CurrentSupply")
          required this.currentSupply,
      @JsonKey(name: "DecimalPlaces")
          required this.decimalPlaces,
      @JsonKey(name: "IsPaused")
          required this.isPaused,
      @JsonKey(name: "TokenBurnable")
          required this.burnable,
      @JsonKey(name: "TokenVoting")
          required this.voting,
      @JsonKey(name: "TokenMintable")
          required this.mintable,
      @JsonKey(name: "ContractOwner")
          required this.contractOwner,
      @JsonKey(name: "AddressBlackList")
          final List<String>? addressBlackList,
      @JsonKey(name: "TokenTopicList")
          final List<TokenVoteTopic> topicList = const []})
      : _addressBlackList = addressBlackList,
        _topicList = topicList,
        super._();

  factory _$_TokenDetails.fromJson(Map<String, dynamic> json) =>
      _$$_TokenDetailsFromJson(json);

  @override
  @JsonKey(name: "TokenName")
  final String name;
  @override
  @JsonKey(name: "TokenTicker")
  final String ticker;
  @override
  @JsonKey(name: "StartingSupply")
  final double startingSupply;
  @override
  @JsonKey(name: "CurrentSupply")
  final double currentSupply;
  @override
  @JsonKey(name: "DecimalPlaces")
  final int decimalPlaces;
  @override
  @JsonKey(name: "IsPaused")
  final bool isPaused;
  @override
  @JsonKey(name: "TokenBurnable")
  final bool burnable;
  @override
  @JsonKey(name: "TokenVoting")
  final bool voting;
  @override
  @JsonKey(name: "TokenMintable")
  final bool mintable;
  @override
  @JsonKey(name: "ContractOwner")
  final String contractOwner;
  final List<String>? _addressBlackList;
  @override
  @JsonKey(name: "AddressBlackList")
  List<String>? get addressBlackList {
    final value = _addressBlackList;
    if (value == null) return null;
    if (_addressBlackList is EqualUnmodifiableListView)
      return _addressBlackList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TokenVoteTopic> _topicList;
  @override
  @JsonKey(name: "TokenTopicList")
  List<TokenVoteTopic> get topicList {
    if (_topicList is EqualUnmodifiableListView) return _topicList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topicList);
  }

  @override
  String toString() {
    return 'TokenDetails(name: $name, ticker: $ticker, startingSupply: $startingSupply, currentSupply: $currentSupply, decimalPlaces: $decimalPlaces, isPaused: $isPaused, burnable: $burnable, voting: $voting, mintable: $mintable, contractOwner: $contractOwner, addressBlackList: $addressBlackList, topicList: $topicList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenDetails &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.startingSupply, startingSupply) ||
                other.startingSupply == startingSupply) &&
            (identical(other.currentSupply, currentSupply) ||
                other.currentSupply == currentSupply) &&
            (identical(other.decimalPlaces, decimalPlaces) ||
                other.decimalPlaces == decimalPlaces) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.burnable, burnable) ||
                other.burnable == burnable) &&
            (identical(other.voting, voting) || other.voting == voting) &&
            (identical(other.mintable, mintable) ||
                other.mintable == mintable) &&
            (identical(other.contractOwner, contractOwner) ||
                other.contractOwner == contractOwner) &&
            const DeepCollectionEquality()
                .equals(other._addressBlackList, _addressBlackList) &&
            const DeepCollectionEquality()
                .equals(other._topicList, _topicList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      ticker,
      startingSupply,
      currentSupply,
      decimalPlaces,
      isPaused,
      burnable,
      voting,
      mintable,
      contractOwner,
      const DeepCollectionEquality().hash(_addressBlackList),
      const DeepCollectionEquality().hash(_topicList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenDetailsCopyWith<_$_TokenDetails> get copyWith =>
      __$$_TokenDetailsCopyWithImpl<_$_TokenDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenDetailsToJson(
      this,
    );
  }
}

abstract class _TokenDetails extends TokenDetails {
  const factory _TokenDetails(
      {@JsonKey(name: "TokenName")
          final String name,
      @JsonKey(name: "TokenTicker")
          final String ticker,
      @JsonKey(name: "StartingSupply")
          required final double startingSupply,
      @JsonKey(name: "CurrentSupply")
          required final double currentSupply,
      @JsonKey(name: "DecimalPlaces")
          required final int decimalPlaces,
      @JsonKey(name: "IsPaused")
          required final bool isPaused,
      @JsonKey(name: "TokenBurnable")
          required final bool burnable,
      @JsonKey(name: "TokenVoting")
          required final bool voting,
      @JsonKey(name: "TokenMintable")
          required final bool mintable,
      @JsonKey(name: "ContractOwner")
          required final String contractOwner,
      @JsonKey(name: "AddressBlackList")
          final List<String>? addressBlackList,
      @JsonKey(name: "TokenTopicList")
          final List<TokenVoteTopic> topicList}) = _$_TokenDetails;
  const _TokenDetails._() : super._();

  factory _TokenDetails.fromJson(Map<String, dynamic> json) =
      _$_TokenDetails.fromJson;

  @override
  @JsonKey(name: "TokenName")
  String get name;
  @override
  @JsonKey(name: "TokenTicker")
  String get ticker;
  @override
  @JsonKey(name: "StartingSupply")
  double get startingSupply;
  @override
  @JsonKey(name: "CurrentSupply")
  double get currentSupply;
  @override
  @JsonKey(name: "DecimalPlaces")
  int get decimalPlaces;
  @override
  @JsonKey(name: "IsPaused")
  bool get isPaused;
  @override
  @JsonKey(name: "TokenBurnable")
  bool get burnable;
  @override
  @JsonKey(name: "TokenVoting")
  bool get voting;
  @override
  @JsonKey(name: "TokenMintable")
  bool get mintable;
  @override
  @JsonKey(name: "ContractOwner")
  String get contractOwner;
  @override
  @JsonKey(name: "AddressBlackList")
  List<String>? get addressBlackList;
  @override
  @JsonKey(name: "TokenTopicList")
  List<TokenVoteTopic> get topicList;
  @override
  @JsonKey(ignore: true)
  _$$_TokenDetailsCopyWith<_$_TokenDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
