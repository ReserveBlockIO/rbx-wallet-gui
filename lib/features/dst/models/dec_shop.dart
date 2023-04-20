import 'package:freezed_annotation/freezed_annotation.dart';

part 'dec_shop.freezed.dart';
part 'dec_shop.g.dart';

@freezed
class DecShop with _$DecShop {
  const DecShop._();

  factory DecShop({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "UniqueId") required String uuid,
    @JsonKey(name: "Name") required String name, //* submit   // * updating when published
    @JsonKey(name: "DecShopURL") required String url, //* submit  // * updating when published
    @JsonKey(name: "Description") required String description, //* submit  // * updating when published
    @JsonKey(name: "OwnerAddress") String? ownerAddress, //* submit
    @JsonKey(name: "HostingType") required int type, //* submit
    @JsonKey(name: "IP") @Default("") String ip, //* submit IF self hosted  // * updating
    @JsonKey(name: "Port") @Default(0) int port, //* submit IF self hosted  // * updating
    @JsonKey(name: "OriginalBlockHeight") required double originalBlockHeight,
    @JsonKey(name: "OriginalTXHash") String? originaTxHash,
    @JsonKey(name: "LatestBlockHeight") required double latestBlockHeight,
    @JsonKey(name: "LatestTXHash") String? lastestTxHash,
    @JsonKey(name: "UpdateTimestamp") required double updateTimestamp,
    @JsonKey(name: "AutoUpdateNetworkDNS") required bool autoUpdateNetworkDns, //* submit  // * updating when published
    @JsonKey(name: "NeedsPublishToNetwork") required bool needsPublishToNetwork,
    @JsonKey(name: "IsOffline") required bool isOffline, // * updating when published
    @JsonKey(name: "IsPublished") required bool isPublished,
  }) = _DecShop;

  factory DecShop.fromJson(Map<String, dynamic> json) => _$DecShopFromJson(json);

  factory DecShop.empty() => DecShop(
        id: 0,
        uuid: '',
        name: '',
        description: '',
        url: '',
        ownerAddress: '',
        type: 0,
        originalBlockHeight: 0,
        latestBlockHeight: 0,
        needsPublishToNetwork: true,
        autoUpdateNetworkDns: true,
        isOffline: false,
        updateTimestamp: 0,
        isPublished: false,
      );

  bool get updateWillCost {
    if (updateTimestamp == 0) {
      return false;
    }

    final currentTimeStamp = (DateTime.now().millisecondsSinceEpoch / 1000);
    if ((currentTimeStamp - updateTimestamp) <= (60 * 60 * 24)) {
      return true;
    }

    return false;
  }
}
