// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dec_shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DecShop _$DecShopFromJson(Map<String, dynamic> json) {
  return _DecShop.fromJson(json);
}

/// @nodoc
mixin _$DecShop {
  @JsonKey(name: "Id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "UniqueId")
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name =>
      throw _privateConstructorUsedError; //* submit   // * updating when published
  @JsonKey(name: "DecShopURL")
  String get url =>
      throw _privateConstructorUsedError; //* submit  // * updating when published
  @JsonKey(name: "ThirdPartyBaseURL")
  String? get thirdPartyBaseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "ThirdPartyAPIURL")
  String? get thirdParyApiUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String get description =>
      throw _privateConstructorUsedError; //* submit  // * updating when published
  @JsonKey(name: "OwnerAddress")
  String? get ownerAddress => throw _privateConstructorUsedError; //* submit
  @JsonKey(name: "HostingType")
  int get type => throw _privateConstructorUsedError; //* submit
  @JsonKey(name: "IP")
  String get ip =>
      throw _privateConstructorUsedError; //* submit IF self hosted  // * updating
  @JsonKey(name: "Port")
  int get port =>
      throw _privateConstructorUsedError; //* submit IF self hosted  // * updating
  @JsonKey(name: "STUNServerGroup")
  int get stunServerGroup => throw _privateConstructorUsedError;
  @JsonKey(name: "OriginalBlockHeight")
  double get originalBlockHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "OriginalTXHash")
  String? get originaTxHash => throw _privateConstructorUsedError;
  @JsonKey(name: "LatestBlockHeight")
  double get latestBlockHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "LatestTXHash")
  String? get lastestTxHash => throw _privateConstructorUsedError;
  @JsonKey(name: "UpdateTimestamp")
  double get updateTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: "AutoUpdateNetworkDNS")
  bool get autoUpdateNetworkDns =>
      throw _privateConstructorUsedError; //* submit  // * updating when published
  @JsonKey(name: "NeedsPublishToNetwork")
  bool get needsPublishToNetwork => throw _privateConstructorUsedError;
  @JsonKey(name: "IsOffline")
  bool get isOffline =>
      throw _privateConstructorUsedError; // * updating when published
  @JsonKey(name: "IsPublished")
  bool get isPublished => throw _privateConstructorUsedError;
  @JsonKey(name: "CollectionCount")
  int get collectionCount => throw _privateConstructorUsedError;
  @JsonKey(name: "ListingCount")
  int get listingCount => throw _privateConstructorUsedError;
  @JsonKey(name: "AuctionCount")
  int get auctionCount => throw _privateConstructorUsedError;
  @JsonKey(name: "IsIPDifferent")
  bool get ipIsDifferent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DecShopCopyWith<DecShop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecShopCopyWith<$Res> {
  factory $DecShopCopyWith(DecShop value, $Res Function(DecShop) then) =
      _$DecShopCopyWithImpl<$Res, DecShop>;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "UniqueId") String uuid,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "DecShopURL") String url,
      @JsonKey(name: "ThirdPartyBaseURL") String? thirdPartyBaseUrl,
      @JsonKey(name: "ThirdPartyAPIURL") String? thirdParyApiUrl,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "OwnerAddress") String? ownerAddress,
      @JsonKey(name: "HostingType") int type,
      @JsonKey(name: "IP") String ip,
      @JsonKey(name: "Port") int port,
      @JsonKey(name: "STUNServerGroup") int stunServerGroup,
      @JsonKey(name: "OriginalBlockHeight") double originalBlockHeight,
      @JsonKey(name: "OriginalTXHash") String? originaTxHash,
      @JsonKey(name: "LatestBlockHeight") double latestBlockHeight,
      @JsonKey(name: "LatestTXHash") String? lastestTxHash,
      @JsonKey(name: "UpdateTimestamp") double updateTimestamp,
      @JsonKey(name: "AutoUpdateNetworkDNS") bool autoUpdateNetworkDns,
      @JsonKey(name: "NeedsPublishToNetwork") bool needsPublishToNetwork,
      @JsonKey(name: "IsOffline") bool isOffline,
      @JsonKey(name: "IsPublished") bool isPublished,
      @JsonKey(name: "CollectionCount") int collectionCount,
      @JsonKey(name: "ListingCount") int listingCount,
      @JsonKey(name: "AuctionCount") int auctionCount,
      @JsonKey(name: "IsIPDifferent") bool ipIsDifferent});
}

/// @nodoc
class _$DecShopCopyWithImpl<$Res, $Val extends DecShop>
    implements $DecShopCopyWith<$Res> {
  _$DecShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? url = null,
    Object? thirdPartyBaseUrl = freezed,
    Object? thirdParyApiUrl = freezed,
    Object? description = null,
    Object? ownerAddress = freezed,
    Object? type = null,
    Object? ip = null,
    Object? port = null,
    Object? stunServerGroup = null,
    Object? originalBlockHeight = null,
    Object? originaTxHash = freezed,
    Object? latestBlockHeight = null,
    Object? lastestTxHash = freezed,
    Object? updateTimestamp = null,
    Object? autoUpdateNetworkDns = null,
    Object? needsPublishToNetwork = null,
    Object? isOffline = null,
    Object? isPublished = null,
    Object? collectionCount = null,
    Object? listingCount = null,
    Object? auctionCount = null,
    Object? ipIsDifferent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thirdPartyBaseUrl: freezed == thirdPartyBaseUrl
          ? _value.thirdPartyBaseUrl
          : thirdPartyBaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thirdParyApiUrl: freezed == thirdParyApiUrl
          ? _value.thirdParyApiUrl
          : thirdParyApiUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: freezed == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      stunServerGroup: null == stunServerGroup
          ? _value.stunServerGroup
          : stunServerGroup // ignore: cast_nullable_to_non_nullable
              as int,
      originalBlockHeight: null == originalBlockHeight
          ? _value.originalBlockHeight
          : originalBlockHeight // ignore: cast_nullable_to_non_nullable
              as double,
      originaTxHash: freezed == originaTxHash
          ? _value.originaTxHash
          : originaTxHash // ignore: cast_nullable_to_non_nullable
              as String?,
      latestBlockHeight: null == latestBlockHeight
          ? _value.latestBlockHeight
          : latestBlockHeight // ignore: cast_nullable_to_non_nullable
              as double,
      lastestTxHash: freezed == lastestTxHash
          ? _value.lastestTxHash
          : lastestTxHash // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTimestamp: null == updateTimestamp
          ? _value.updateTimestamp
          : updateTimestamp // ignore: cast_nullable_to_non_nullable
              as double,
      autoUpdateNetworkDns: null == autoUpdateNetworkDns
          ? _value.autoUpdateNetworkDns
          : autoUpdateNetworkDns // ignore: cast_nullable_to_non_nullable
              as bool,
      needsPublishToNetwork: null == needsPublishToNetwork
          ? _value.needsPublishToNetwork
          : needsPublishToNetwork // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionCount: null == collectionCount
          ? _value.collectionCount
          : collectionCount // ignore: cast_nullable_to_non_nullable
              as int,
      listingCount: null == listingCount
          ? _value.listingCount
          : listingCount // ignore: cast_nullable_to_non_nullable
              as int,
      auctionCount: null == auctionCount
          ? _value.auctionCount
          : auctionCount // ignore: cast_nullable_to_non_nullable
              as int,
      ipIsDifferent: null == ipIsDifferent
          ? _value.ipIsDifferent
          : ipIsDifferent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DecShopCopyWith<$Res> implements $DecShopCopyWith<$Res> {
  factory _$$_DecShopCopyWith(
          _$_DecShop value, $Res Function(_$_DecShop) then) =
      __$$_DecShopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") int id,
      @JsonKey(name: "UniqueId") String uuid,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "DecShopURL") String url,
      @JsonKey(name: "ThirdPartyBaseURL") String? thirdPartyBaseUrl,
      @JsonKey(name: "ThirdPartyAPIURL") String? thirdParyApiUrl,
      @JsonKey(name: "Description") String description,
      @JsonKey(name: "OwnerAddress") String? ownerAddress,
      @JsonKey(name: "HostingType") int type,
      @JsonKey(name: "IP") String ip,
      @JsonKey(name: "Port") int port,
      @JsonKey(name: "STUNServerGroup") int stunServerGroup,
      @JsonKey(name: "OriginalBlockHeight") double originalBlockHeight,
      @JsonKey(name: "OriginalTXHash") String? originaTxHash,
      @JsonKey(name: "LatestBlockHeight") double latestBlockHeight,
      @JsonKey(name: "LatestTXHash") String? lastestTxHash,
      @JsonKey(name: "UpdateTimestamp") double updateTimestamp,
      @JsonKey(name: "AutoUpdateNetworkDNS") bool autoUpdateNetworkDns,
      @JsonKey(name: "NeedsPublishToNetwork") bool needsPublishToNetwork,
      @JsonKey(name: "IsOffline") bool isOffline,
      @JsonKey(name: "IsPublished") bool isPublished,
      @JsonKey(name: "CollectionCount") int collectionCount,
      @JsonKey(name: "ListingCount") int listingCount,
      @JsonKey(name: "AuctionCount") int auctionCount,
      @JsonKey(name: "IsIPDifferent") bool ipIsDifferent});
}

/// @nodoc
class __$$_DecShopCopyWithImpl<$Res>
    extends _$DecShopCopyWithImpl<$Res, _$_DecShop>
    implements _$$_DecShopCopyWith<$Res> {
  __$$_DecShopCopyWithImpl(_$_DecShop _value, $Res Function(_$_DecShop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? url = null,
    Object? thirdPartyBaseUrl = freezed,
    Object? thirdParyApiUrl = freezed,
    Object? description = null,
    Object? ownerAddress = freezed,
    Object? type = null,
    Object? ip = null,
    Object? port = null,
    Object? stunServerGroup = null,
    Object? originalBlockHeight = null,
    Object? originaTxHash = freezed,
    Object? latestBlockHeight = null,
    Object? lastestTxHash = freezed,
    Object? updateTimestamp = null,
    Object? autoUpdateNetworkDns = null,
    Object? needsPublishToNetwork = null,
    Object? isOffline = null,
    Object? isPublished = null,
    Object? collectionCount = null,
    Object? listingCount = null,
    Object? auctionCount = null,
    Object? ipIsDifferent = null,
  }) {
    return _then(_$_DecShop(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thirdPartyBaseUrl: freezed == thirdPartyBaseUrl
          ? _value.thirdPartyBaseUrl
          : thirdPartyBaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thirdParyApiUrl: freezed == thirdParyApiUrl
          ? _value.thirdParyApiUrl
          : thirdParyApiUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAddress: freezed == ownerAddress
          ? _value.ownerAddress
          : ownerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      stunServerGroup: null == stunServerGroup
          ? _value.stunServerGroup
          : stunServerGroup // ignore: cast_nullable_to_non_nullable
              as int,
      originalBlockHeight: null == originalBlockHeight
          ? _value.originalBlockHeight
          : originalBlockHeight // ignore: cast_nullable_to_non_nullable
              as double,
      originaTxHash: freezed == originaTxHash
          ? _value.originaTxHash
          : originaTxHash // ignore: cast_nullable_to_non_nullable
              as String?,
      latestBlockHeight: null == latestBlockHeight
          ? _value.latestBlockHeight
          : latestBlockHeight // ignore: cast_nullable_to_non_nullable
              as double,
      lastestTxHash: freezed == lastestTxHash
          ? _value.lastestTxHash
          : lastestTxHash // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTimestamp: null == updateTimestamp
          ? _value.updateTimestamp
          : updateTimestamp // ignore: cast_nullable_to_non_nullable
              as double,
      autoUpdateNetworkDns: null == autoUpdateNetworkDns
          ? _value.autoUpdateNetworkDns
          : autoUpdateNetworkDns // ignore: cast_nullable_to_non_nullable
              as bool,
      needsPublishToNetwork: null == needsPublishToNetwork
          ? _value.needsPublishToNetwork
          : needsPublishToNetwork // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionCount: null == collectionCount
          ? _value.collectionCount
          : collectionCount // ignore: cast_nullable_to_non_nullable
              as int,
      listingCount: null == listingCount
          ? _value.listingCount
          : listingCount // ignore: cast_nullable_to_non_nullable
              as int,
      auctionCount: null == auctionCount
          ? _value.auctionCount
          : auctionCount // ignore: cast_nullable_to_non_nullable
              as int,
      ipIsDifferent: null == ipIsDifferent
          ? _value.ipIsDifferent
          : ipIsDifferent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DecShop extends _DecShop {
  _$_DecShop(
      {@JsonKey(name: "Id")
          required this.id,
      @JsonKey(name: "UniqueId")
          required this.uuid,
      @JsonKey(name: "Name")
          required this.name,
      @JsonKey(name: "DecShopURL")
          required this.url,
      @JsonKey(name: "ThirdPartyBaseURL")
          this.thirdPartyBaseUrl,
      @JsonKey(name: "ThirdPartyAPIURL")
          this.thirdParyApiUrl,
      @JsonKey(name: "Description")
          required this.description,
      @JsonKey(name: "OwnerAddress")
          this.ownerAddress,
      @JsonKey(name: "HostingType")
          required this.type,
      @JsonKey(name: "IP")
          this.ip = "NA",
      @JsonKey(name: "Port")
          this.port = 0,
      @JsonKey(name: "STUNServerGroup")
          this.stunServerGroup = 1,
      @JsonKey(name: "OriginalBlockHeight")
          required this.originalBlockHeight,
      @JsonKey(name: "OriginalTXHash")
          this.originaTxHash,
      @JsonKey(name: "LatestBlockHeight")
          required this.latestBlockHeight,
      @JsonKey(name: "LatestTXHash")
          this.lastestTxHash,
      @JsonKey(name: "UpdateTimestamp")
          required this.updateTimestamp,
      @JsonKey(name: "AutoUpdateNetworkDNS")
          required this.autoUpdateNetworkDns,
      @JsonKey(name: "NeedsPublishToNetwork")
          required this.needsPublishToNetwork,
      @JsonKey(name: "IsOffline")
          required this.isOffline,
      @JsonKey(name: "IsPublished")
          required this.isPublished,
      @JsonKey(name: "CollectionCount")
          this.collectionCount = 0,
      @JsonKey(name: "ListingCount")
          this.listingCount = 0,
      @JsonKey(name: "AuctionCount")
          this.auctionCount = 0,
      @JsonKey(name: "IsIPDifferent")
          required this.ipIsDifferent})
      : super._();

  factory _$_DecShop.fromJson(Map<String, dynamic> json) =>
      _$$_DecShopFromJson(json);

  @override
  @JsonKey(name: "Id")
  final int id;
  @override
  @JsonKey(name: "UniqueId")
  final String uuid;
  @override
  @JsonKey(name: "Name")
  final String name;
//* submit   // * updating when published
  @override
  @JsonKey(name: "DecShopURL")
  final String url;
//* submit  // * updating when published
  @override
  @JsonKey(name: "ThirdPartyBaseURL")
  final String? thirdPartyBaseUrl;
  @override
  @JsonKey(name: "ThirdPartyAPIURL")
  final String? thirdParyApiUrl;
  @override
  @JsonKey(name: "Description")
  final String description;
//* submit  // * updating when published
  @override
  @JsonKey(name: "OwnerAddress")
  final String? ownerAddress;
//* submit
  @override
  @JsonKey(name: "HostingType")
  final int type;
//* submit
  @override
  @JsonKey(name: "IP")
  final String ip;
//* submit IF self hosted  // * updating
  @override
  @JsonKey(name: "Port")
  final int port;
//* submit IF self hosted  // * updating
  @override
  @JsonKey(name: "STUNServerGroup")
  final int stunServerGroup;
  @override
  @JsonKey(name: "OriginalBlockHeight")
  final double originalBlockHeight;
  @override
  @JsonKey(name: "OriginalTXHash")
  final String? originaTxHash;
  @override
  @JsonKey(name: "LatestBlockHeight")
  final double latestBlockHeight;
  @override
  @JsonKey(name: "LatestTXHash")
  final String? lastestTxHash;
  @override
  @JsonKey(name: "UpdateTimestamp")
  final double updateTimestamp;
  @override
  @JsonKey(name: "AutoUpdateNetworkDNS")
  final bool autoUpdateNetworkDns;
//* submit  // * updating when published
  @override
  @JsonKey(name: "NeedsPublishToNetwork")
  final bool needsPublishToNetwork;
  @override
  @JsonKey(name: "IsOffline")
  final bool isOffline;
// * updating when published
  @override
  @JsonKey(name: "IsPublished")
  final bool isPublished;
  @override
  @JsonKey(name: "CollectionCount")
  final int collectionCount;
  @override
  @JsonKey(name: "ListingCount")
  final int listingCount;
  @override
  @JsonKey(name: "AuctionCount")
  final int auctionCount;
  @override
  @JsonKey(name: "IsIPDifferent")
  final bool ipIsDifferent;

  @override
  String toString() {
    return 'DecShop(id: $id, uuid: $uuid, name: $name, url: $url, thirdPartyBaseUrl: $thirdPartyBaseUrl, thirdParyApiUrl: $thirdParyApiUrl, description: $description, ownerAddress: $ownerAddress, type: $type, ip: $ip, port: $port, stunServerGroup: $stunServerGroup, originalBlockHeight: $originalBlockHeight, originaTxHash: $originaTxHash, latestBlockHeight: $latestBlockHeight, lastestTxHash: $lastestTxHash, updateTimestamp: $updateTimestamp, autoUpdateNetworkDns: $autoUpdateNetworkDns, needsPublishToNetwork: $needsPublishToNetwork, isOffline: $isOffline, isPublished: $isPublished, collectionCount: $collectionCount, listingCount: $listingCount, auctionCount: $auctionCount, ipIsDifferent: $ipIsDifferent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DecShop &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thirdPartyBaseUrl, thirdPartyBaseUrl) ||
                other.thirdPartyBaseUrl == thirdPartyBaseUrl) &&
            (identical(other.thirdParyApiUrl, thirdParyApiUrl) ||
                other.thirdParyApiUrl == thirdParyApiUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerAddress, ownerAddress) ||
                other.ownerAddress == ownerAddress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.stunServerGroup, stunServerGroup) ||
                other.stunServerGroup == stunServerGroup) &&
            (identical(other.originalBlockHeight, originalBlockHeight) ||
                other.originalBlockHeight == originalBlockHeight) &&
            (identical(other.originaTxHash, originaTxHash) ||
                other.originaTxHash == originaTxHash) &&
            (identical(other.latestBlockHeight, latestBlockHeight) ||
                other.latestBlockHeight == latestBlockHeight) &&
            (identical(other.lastestTxHash, lastestTxHash) ||
                other.lastestTxHash == lastestTxHash) &&
            (identical(other.updateTimestamp, updateTimestamp) ||
                other.updateTimestamp == updateTimestamp) &&
            (identical(other.autoUpdateNetworkDns, autoUpdateNetworkDns) ||
                other.autoUpdateNetworkDns == autoUpdateNetworkDns) &&
            (identical(other.needsPublishToNetwork, needsPublishToNetwork) ||
                other.needsPublishToNetwork == needsPublishToNetwork) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.collectionCount, collectionCount) ||
                other.collectionCount == collectionCount) &&
            (identical(other.listingCount, listingCount) ||
                other.listingCount == listingCount) &&
            (identical(other.auctionCount, auctionCount) ||
                other.auctionCount == auctionCount) &&
            (identical(other.ipIsDifferent, ipIsDifferent) ||
                other.ipIsDifferent == ipIsDifferent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        uuid,
        name,
        url,
        thirdPartyBaseUrl,
        thirdParyApiUrl,
        description,
        ownerAddress,
        type,
        ip,
        port,
        stunServerGroup,
        originalBlockHeight,
        originaTxHash,
        latestBlockHeight,
        lastestTxHash,
        updateTimestamp,
        autoUpdateNetworkDns,
        needsPublishToNetwork,
        isOffline,
        isPublished,
        collectionCount,
        listingCount,
        auctionCount,
        ipIsDifferent
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DecShopCopyWith<_$_DecShop> get copyWith =>
      __$$_DecShopCopyWithImpl<_$_DecShop>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DecShopToJson(
      this,
    );
  }
}

abstract class _DecShop extends DecShop {
  factory _DecShop(
      {@JsonKey(name: "Id")
          required final int id,
      @JsonKey(name: "UniqueId")
          required final String uuid,
      @JsonKey(name: "Name")
          required final String name,
      @JsonKey(name: "DecShopURL")
          required final String url,
      @JsonKey(name: "ThirdPartyBaseURL")
          final String? thirdPartyBaseUrl,
      @JsonKey(name: "ThirdPartyAPIURL")
          final String? thirdParyApiUrl,
      @JsonKey(name: "Description")
          required final String description,
      @JsonKey(name: "OwnerAddress")
          final String? ownerAddress,
      @JsonKey(name: "HostingType")
          required final int type,
      @JsonKey(name: "IP")
          final String ip,
      @JsonKey(name: "Port")
          final int port,
      @JsonKey(name: "STUNServerGroup")
          final int stunServerGroup,
      @JsonKey(name: "OriginalBlockHeight")
          required final double originalBlockHeight,
      @JsonKey(name: "OriginalTXHash")
          final String? originaTxHash,
      @JsonKey(name: "LatestBlockHeight")
          required final double latestBlockHeight,
      @JsonKey(name: "LatestTXHash")
          final String? lastestTxHash,
      @JsonKey(name: "UpdateTimestamp")
          required final double updateTimestamp,
      @JsonKey(name: "AutoUpdateNetworkDNS")
          required final bool autoUpdateNetworkDns,
      @JsonKey(name: "NeedsPublishToNetwork")
          required final bool needsPublishToNetwork,
      @JsonKey(name: "IsOffline")
          required final bool isOffline,
      @JsonKey(name: "IsPublished")
          required final bool isPublished,
      @JsonKey(name: "CollectionCount")
          final int collectionCount,
      @JsonKey(name: "ListingCount")
          final int listingCount,
      @JsonKey(name: "AuctionCount")
          final int auctionCount,
      @JsonKey(name: "IsIPDifferent")
          required final bool ipIsDifferent}) = _$_DecShop;
  _DecShop._() : super._();

  factory _DecShop.fromJson(Map<String, dynamic> json) = _$_DecShop.fromJson;

  @override
  @JsonKey(name: "Id")
  int get id;
  @override
  @JsonKey(name: "UniqueId")
  String get uuid;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override //* submit   // * updating when published
  @JsonKey(name: "DecShopURL")
  String get url;
  @override //* submit  // * updating when published
  @JsonKey(name: "ThirdPartyBaseURL")
  String? get thirdPartyBaseUrl;
  @override
  @JsonKey(name: "ThirdPartyAPIURL")
  String? get thirdParyApiUrl;
  @override
  @JsonKey(name: "Description")
  String get description;
  @override //* submit  // * updating when published
  @JsonKey(name: "OwnerAddress")
  String? get ownerAddress;
  @override //* submit
  @JsonKey(name: "HostingType")
  int get type;
  @override //* submit
  @JsonKey(name: "IP")
  String get ip;
  @override //* submit IF self hosted  // * updating
  @JsonKey(name: "Port")
  int get port;
  @override //* submit IF self hosted  // * updating
  @JsonKey(name: "STUNServerGroup")
  int get stunServerGroup;
  @override
  @JsonKey(name: "OriginalBlockHeight")
  double get originalBlockHeight;
  @override
  @JsonKey(name: "OriginalTXHash")
  String? get originaTxHash;
  @override
  @JsonKey(name: "LatestBlockHeight")
  double get latestBlockHeight;
  @override
  @JsonKey(name: "LatestTXHash")
  String? get lastestTxHash;
  @override
  @JsonKey(name: "UpdateTimestamp")
  double get updateTimestamp;
  @override
  @JsonKey(name: "AutoUpdateNetworkDNS")
  bool get autoUpdateNetworkDns;
  @override //* submit  // * updating when published
  @JsonKey(name: "NeedsPublishToNetwork")
  bool get needsPublishToNetwork;
  @override
  @JsonKey(name: "IsOffline")
  bool get isOffline;
  @override // * updating when published
  @JsonKey(name: "IsPublished")
  bool get isPublished;
  @override
  @JsonKey(name: "CollectionCount")
  int get collectionCount;
  @override
  @JsonKey(name: "ListingCount")
  int get listingCount;
  @override
  @JsonKey(name: "AuctionCount")
  int get auctionCount;
  @override
  @JsonKey(name: "IsIPDifferent")
  bool get ipIsDifferent;
  @override
  @JsonKey(ignore: true)
  _$$_DecShopCopyWith<_$_DecShop> get copyWith =>
      throw _privateConstructorUsedError;
}
