import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  bool? isSuccessful;
  String? message;
  _Data? data;
  String? responseCode;

  UserResponse({
    this.isSuccessful,
    this.message,
    this.data,
    this.responseCode,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        isSuccessful: json["isSuccessful"],
        message: json["message"],
        data: json["data"] == null ? null : _Data.fromJson(json["data"]),
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data?.toJson(),
        "responseCode": responseCode,
      };
}

class _Data {
  String? accessToken;
  String? refreshToken;
  int? tokenExpiryTimeStamp;
  User? user;

  _Data({
    this.accessToken,
    this.refreshToken,
    this.tokenExpiryTimeStamp,
    this.user,
  });

  factory _Data.fromJson(Map<String, dynamic> json) => _Data(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        tokenExpiryTimeStamp: json["tokenExpiryTimeStamp"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "tokenExpiryTimeStamp": tokenExpiryTimeStamp,
        "user": user?.toJson(),
      };
}

class User {
  String? fullName;
  String? country;
  String? currency;
  String? language;
  String? profileUrl;
  String? bannerUrl;
  bool? active;
  DateTime? createdAt;
  dynamic updatedAt;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  User({
    this.fullName,
    this.country,
    this.currency,
    this.language,
    this.profileUrl,
    this.bannerUrl,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"] ?? '',
        country: json["country"] ?? '',
        currency: json["currency"] ?? '',
        language: json["language"] ?? '',
        profileUrl: json["profileUrl"] ?? '',
        bannerUrl: json["bannerUrl"] ?? '',
        active: json["active"] ?? false,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] ?? '',
        id: json["userId"] ?? json['id']??"",
        userName: json["userName"] ?? '',
        normalizedUserName: json["normalizedUserName"] ?? '',
        email: json["email"] ?? '',
        normalizedEmail: json["normalizedEmail"] ?? '',
        emailConfirmed: json["emailConfirmed"] ?? false,
        passwordHash: json["passwordHash"] ?? '',
        securityStamp: json["securityStamp"] ?? '',
        concurrencyStamp: json["concurrencyStamp"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
        twoFactorEnabled: json["twoFactorEnabled"] ?? false,
        lockoutEnd: json["lockoutEnd"] ?? '',
        lockoutEnabled: json["lockoutEnabled"] ?? false,
        accessFailedCount: json["accessFailedCount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "country": country,
        "currency": currency,
        "language": language,
        "profileUrl": profileUrl,
        "bannerUrl": bannerUrl,
        "active": active,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt,
        "id": id,
        "userName": userName,
        "normalizedUserName": normalizedUserName,
        "email": email,
        "normalizedEmail": normalizedEmail,
        "emailConfirmed": emailConfirmed,
        "passwordHash": passwordHash,
        "securityStamp": securityStamp,
        "concurrencyStamp": concurrencyStamp,
        "phoneNumber": phoneNumber,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "twoFactorEnabled": twoFactorEnabled,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "accessFailedCount": accessFailedCount,
      };
}
