import 'dart:convert';

UserEventsResponse userEventsResponseFromJson(String str) =>
    UserEventsResponse.fromJson(json.decode(str));

String userEventsResponseToJson(UserEventsResponse data) =>
    json.encode(data.toJson());

class UserEventsResponse {
  bool isSuccessful;
  String message;
  Data data;
  String responseCode;

  UserEventsResponse({
    required this.isSuccessful,
    required this.message,
    required this.data,
    required this.responseCode,
  });

  factory UserEventsResponse.fromJson(Map<String, dynamic> json) =>
      UserEventsResponse(
        isSuccessful: json["isSuccessful"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data.toJson(),
        "responseCode": responseCode,
      };
}

class Data {
  int pageSize;
  int currentPage;
  int totalPages;
  int totalRecords;
  List<UserEventRecord> records;

  Data({
    required this.pageSize,
    required this.currentPage,
    required this.totalPages,
    required this.totalRecords,
    required this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageSize: json["pageSize"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        totalRecords: json["totalRecords"],
        records: List<UserEventRecord>.from(
            json["records"].map((x) => UserEventRecord.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalRecords": totalRecords,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class UserEventRecord {
  String userId;
  String? userName;
  String? phoneNumber;
  String? fullName;
  String? email;
  String? country;
  String? currency;
  String? language;
  String? profileUrl;
  String? bannerUrl;
  String? ticketId;
  bool isActive;
  bool isValidated;

  UserEventRecord({
    required this.userId,
    this.userName,
    this.phoneNumber,
    this.fullName,
    this.email,
    this.country,
    this.currency,
    this.profileUrl,
    this.bannerUrl,
    this.language,
    this.ticketId,
    required this.isActive,
    required this.isValidated,
  });

  factory UserEventRecord.fromJson(Map<String, dynamic> json) =>
      UserEventRecord(
        userId: json["userId"] ?? '',
        userName: json["userName"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        fullName: json["fullName"] ?? '',
        email: json["email"] ?? '',
        country: json["country"] ?? '',
        currency: json["currency"] ?? '',
        language: json["language"] ?? '',
        profileUrl: json["profileUrl"] ?? '',
        bannerUrl: json["bannerUrl"] ?? '',
        isActive: json["isActive"] ?? '',
        isValidated: json["isValidated"] ?? '',
        ticketId: json["ticketId"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "fullName": fullName,
        "email": email,
        "country": country,
        "currency": currency,
        "language": language,
        "profileUrl": profileUrl,
        "bannerUrl": bannerUrl,
        "isActive": isActive,
        "isValidated": isValidated,
        "ticketId": ticketId,
      };
}
