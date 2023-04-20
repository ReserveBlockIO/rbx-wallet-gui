import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  const Node._();

  factory Node({
    @JsonKey(name: 'Address') required String address,
    @JsonKey(name: 'UniqueName') required String uniqueName,
    @JsonKey(name: 'ConnectionId') required String connectionId,
    @JsonKey(name: 'IpAddress') required String ipAddress,
    @JsonKey(name: 'WalletVersion') required String? walletVersion,
    @JsonKey(name: 'ConnectDate') required DateTime connectDate,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  String get connectDateFormatted {
    return DateFormat('MM/dd – HH:mm').format(connectDate);
  }
}
