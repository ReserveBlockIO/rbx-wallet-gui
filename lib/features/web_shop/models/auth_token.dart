import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

@freezed
class AuthToken with _$AuthToken {
  const AuthToken._();

  factory AuthToken({
    required String message,
    required String token,
    required String address,
    @JsonKey(name: "expires_at") required DateTime expiresAt,
    required String signature,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
}
