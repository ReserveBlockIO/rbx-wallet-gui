import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_address.freezed.dart';
part 'web_address.g.dart';

@freezed
abstract class WebAddress with _$WebAddress {
  const WebAddress._();

  factory WebAddress({
    required String address,
    required double balance,
    String? adnr,
  }) = _WebAddress;

  factory WebAddress.fromJson(Map<String, dynamic> json) => _$WebAddressFromJson(json);
}
