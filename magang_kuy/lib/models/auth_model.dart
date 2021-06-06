part of 'models.dart';

// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

class AuthModel {
  AuthModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.email,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  String email;

  factory AuthModel.fromRawJson(String str) =>
      AuthModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "email": email,
      };
}
