// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_fungible_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebFungibleToken _$WebFungibleTokenFromJson(Map<String, dynamic> json) {
  return _WebFungibleToken.fromJson(json);
}

/// @nodoc
mixin _$WebFungibleToken {
  @JsonKey(name: "sc_identifier")
  String get smartContractId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ticker => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_address")
  String get ownerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "can_mint")
  bool get canMint => throw _privateConstructorUsedError;
  @JsonKey(name: "can_burn")
  bool get canBurn => throw _privateConstructorUsedError;
  @JsonKey(name: "can_vote")
  bool get canVote => throw _privateConstructorUsedError;
  @JsonKey(name: "is_paused")
  bool get isPaused => throw _privateConstructorUsedError;
  @JsonKey(name: "circulating_supply")
  double get circulatingSupply => throw _privateConstructorUsedError;
  @JsonKey(name: "initial_supply")
  double get initialSupply => throw _privateConstructorUsedError;
  @JsonKey(name: "banned_addresses")
  List<String> get bannedAddresses => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebFungibleTokenCopyWith<WebFungibleToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebFungibleTokenCopyWith<$Res> {
  factory $WebFungibleTokenCopyWith(
          WebFungibleToken value, $Res Function(WebFungibleToken) then) =
      _$WebFungibleTokenCopyWithImpl<$Res, WebFungibleToken>;
  @useResult
  $Res call(
      {@JsonKey(name: "sc_identifier") String smartContractId,
      String name,
      String ticker,
      @JsonKey(name: "owner_address") String ownerAddress,
      @JsonKey(name: "image_url") String? imageUrl,
      @JsonKey(name: "can_mint") bool canMint,
      @JsonKey(name: "can_burn") bool canBurn,
      @JsonKey(name: "can_vote") bool canVote,
      @JsonKey(name: "is_paused") bool isPaused,
      @JsonKey(name: "circulating_supply") double circulatingSupply,
      @JsonKey(name: "initial_supply") double initialSupply,
      @JsonKey(name: "banned_addresses") List<String> bannedAddresses,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$WebFungibleTokenCopyWithImpl<$Res, $Val extends WebFungibleToken>
    implements $WebFungibleTokenCopyWith<$Res> {
  _$WebFungibleTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractId = null,
    Object? name = null,
    Object? ticker = null,
    Object? ownerAddress = null,
    Object? imageUrl = freezed,
    Object? canMint = null,
    Object? canBurn = null,
    Object? canVote = null,
    Object? isPaused = null,
    Object? circulatingSupply = null,
    Object? initialSupply = null,
    Object? bannedAddresses = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      smartContractId: null == smartContractId
          ? _value.smartContractId
          : smartContractId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      canMint: null == canMint
          ? _value.canMint
          : canMint // ignore: cast_nullable_to_non_nullable
              as bool,
      canBurn: null == canBurn
          ? _value.canBurn
          : canBurn // ignore: cast_nullable_to_non_nullable
              as bool,
      canVote: null == canVote
          ? _value.canVote
          : canVote // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      circulatingSupply: null == circulatingSupply
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as double,
      initialSupply: null == initialSupply
          ? _value.initialSupply
          : initialSupply // ignore: cast_nullable_to_non_nullable
              as double,
      bannedAddresses: null == bannedAddresses
          ? _value.bannedAddresses
          : bannedAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WebFungibleTokenCopyWith<$Res>
    implements $WebFungibleTokenCopyWith<$Res> {
  factory _$$_WebFungibleTokenCopyWith(
          _$_WebFungibleToken value, $Res Function(_$_WebFungibleToken) then) =
      __$$_WebFungibleTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "sc_identifier") String smartContractId,
      String name,
      String ticker,
      @JsonKey(name: "owner_address") String ownerAddress,
      @JsonKey(name: "image_url") String? imageUrl,
      @JsonKey(name: "can_mint") bool canMint,
      @JsonKey(name: "can_burn") bool canBurn,
      @JsonKey(name: "can_vote") bool canVote,
      @JsonKey(name: "is_paused") bool isPaused,
      @JsonKey(name: "circulating_supply") double circulatingSupply,
      @JsonKey(name: "initial_supply") double initialSupply,
      @JsonKey(name: "banned_addresses") List<String> bannedAddresses,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$_WebFungibleTokenCopyWithImpl<$Res>
    extends _$WebFungibleTokenCopyWithImpl<$Res, _$_WebFungibleToken>
    implements _$$_WebFungibleTokenCopyWith<$Res> {
  __$$_WebFungibleTokenCopyWithImpl(
      _$_WebFungibleToken _value, $Res Function(_$_WebFungibleToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartContractId = null,
    Object? name = null,
    Object? ticker = null,
    Object? ownerAddress = null,
    Object? imageUrl = freezed,
    Object? canMint = null,
    Object? canBurn = null,
    Object? canVote = null,
    Object? isPaused = null,
    Object? circulatingSupply = null,
    Object? initialSupply = null,
    Object? bannedAddresses = null,
    Object? createdAt = null,
  }) {
    return _then(_$_WebFungibleToken(
      smartContractId: null == smartContractId
          ? _value.smartContractId
          : smartContractId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: null == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      canMint: null == canMint
          ? _value.canMint
          : canMint // ignore: cast_nullable_to_non_nullable
              as bool,
      canBurn: null == canBurn
          ? _value.canBurn
          : canBurn // ignore: cast_nullable_to_non_nullable
              as bool,
      canVote: null == canVote
          ? _value.canVote
          : canVote // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaused: null == isPaused
          ? _value.isPaused
          : isPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      circulatingSupply: null == circulatingSupply
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as double,
      initialSupply: null == initialSupply
          ? _value.initialSupply
          : initialSupply // ignore: cast_nullable_to_non_nullable
              as double,
      bannedAddresses: null == bannedAddresses
          ? _value._bannedAddresses
          : bannedAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebFungibleToken extends _WebFungibleToken {
  const _$_WebFungibleToken(
      {@JsonKey(name: "sc_identifier")
          required this.smartContractId,
      required this.name,
      required this.ticker,
      @JsonKey(name: "owner_address")
          required this.ownerAddress,
      @JsonKey(name: "image_url")
          this.imageUrl,
      @JsonKey(name: "can_mint")
          required this.canMint,
      @JsonKey(name: "can_burn")
          required this.canBurn,
      @JsonKey(name: "can_vote")
          required this.canVote,
      @JsonKey(name: "is_paused")
          required this.isPaused,
      @JsonKey(name: "circulating_supply")
          required this.circulatingSupply,
      @JsonKey(name: "initial_supply")
          required this.initialSupply,
      @JsonKey(name: "banned_addresses")
          required final List<String> bannedAddresses,
      @JsonKey(name: "created_at")
          required this.createdAt})
      : _bannedAddresses = bannedAddresses,
        super._();

  factory _$_WebFungibleToken.fromJson(Map<String, dynamic> json) =>
      _$$_WebFungibleTokenFromJson(json);

  @override
  @JsonKey(name: "sc_identifier")
  final String smartContractId;
  @override
  final String name;
  @override
  final String ticker;
  @override
  @JsonKey(name: "owner_address")
  final String ownerAddress;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "can_mint")
  final bool canMint;
  @override
  @JsonKey(name: "can_burn")
  final bool canBurn;
  @override
  @JsonKey(name: "can_vote")
  final bool canVote;
  @override
  @JsonKey(name: "is_paused")
  final bool isPaused;
  @override
  @JsonKey(name: "circulating_supply")
  final double circulatingSupply;
  @override
  @JsonKey(name: "initial_supply")
  final double initialSupply;
  final List<String> _bannedAddresses;
  @override
  @JsonKey(name: "banned_addresses")
  List<String> get bannedAddresses {
    if (_bannedAddresses is EqualUnmodifiableListView) return _bannedAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bannedAddresses);
  }

  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'WebFungibleToken(smartContractId: $smartContractId, name: $name, ticker: $ticker, ownerAddress: $ownerAddress, imageUrl: $imageUrl, canMint: $canMint, canBurn: $canBurn, canVote: $canVote, isPaused: $isPaused, circulatingSupply: $circulatingSupply, initialSupply: $initialSupply, bannedAddresses: $bannedAddresses, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WebFungibleToken &&
            (identical(other.smartContractId, smartContractId) ||
                other.smartContractId == smartContractId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.canMint, canMint) || other.canMint == canMint) &&
            (identical(other.canBurn, canBurn) || other.canBurn == canBurn) &&
            (identical(other.canVote, canVote) || other.canVote == canVote) &&
            (identical(other.isPaused, isPaused) ||
                other.isPaused == isPaused) &&
            (identical(other.circulatingSupply, circulatingSupply) ||
                other.circulatingSupply == circulatingSupply) &&
            (identical(other.initialSupply, initialSupply) ||
                other.initialSupply == initialSupply) &&
            const DeepCollectionEquality()
                .equals(other._bannedAddresses, _bannedAddresses) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      smartContractId,
      name,
      ticker,
      ownerAddress,
      imageUrl,
      canMint,
      canBurn,
      canVote,
      isPaused,
      circulatingSupply,
      initialSupply,
      const DeepCollectionEquality().hash(_bannedAddresses),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WebFungibleTokenCopyWith<_$_WebFungibleToken> get copyWith =>
      __$$_WebFungibleTokenCopyWithImpl<_$_WebFungibleToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebFungibleTokenToJson(
      this,
    );
  }
}

abstract class _WebFungibleToken extends WebFungibleToken {
  const factory _WebFungibleToken(
      {@JsonKey(name: "sc_identifier")
          required final String smartContractId,
      required final String name,
      required final String ticker,
      @JsonKey(name: "owner_address")
          required final String ownerAddress,
      @JsonKey(name: "image_url")
          final String? imageUrl,
      @JsonKey(name: "can_mint")
          required final bool canMint,
      @JsonKey(name: "can_burn")
          required final bool canBurn,
      @JsonKey(name: "can_vote")
          required final bool canVote,
      @JsonKey(name: "is_paused")
          required final bool isPaused,
      @JsonKey(name: "circulating_supply")
          required final double circulatingSupply,
      @JsonKey(name: "initial_supply")
          required final double initialSupply,
      @JsonKey(name: "banned_addresses")
          required final List<String> bannedAddresses,
      @JsonKey(name: "created_at")
          required final DateTime createdAt}) = _$_WebFungibleToken;
  const _WebFungibleToken._() : super._();

  factory _WebFungibleToken.fromJson(Map<String, dynamic> json) =
      _$_WebFungibleToken.fromJson;

  @override
  @JsonKey(name: "sc_identifier")
  String get smartContractId;
  @override
  String get name;
  @override
  String get ticker;
  @override
  @JsonKey(name: "owner_address")
  String get ownerAddress;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "can_mint")
  bool get canMint;
  @override
  @JsonKey(name: "can_burn")
  bool get canBurn;
  @override
  @JsonKey(name: "can_vote")
  bool get canVote;
  @override
  @JsonKey(name: "is_paused")
  bool get isPaused;
  @override
  @JsonKey(name: "circulating_supply")
  double get circulatingSupply;
  @override
  @JsonKey(name: "initial_supply")
  double get initialSupply;
  @override
  @JsonKey(name: "banned_addresses")
  List<String> get bannedAddresses;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_WebFungibleTokenCopyWith<_$_WebFungibleToken> get copyWith =>
      throw _privateConstructorUsedError;
}
