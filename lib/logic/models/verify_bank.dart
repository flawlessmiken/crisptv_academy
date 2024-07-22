import 'dart:convert';

VerifyBank verifyBankFromJson(String str) =>
    VerifyBank.fromJson(json.decode(str));

String verifyBankToJson(VerifyBank data) => json.encode(data.toJson());

class VerifyBank {
  bool isSuccessful;
  String message;
  VerifyBankData data;
  String responseCode;

  VerifyBank({
    required this.isSuccessful,
    required this.message,
    required this.data,
    required this.responseCode,
  });

  factory VerifyBank.fromJson(Map<String, dynamic> json) => VerifyBank(
        isSuccessful: json["isSuccessful"],
        message: json["message"],
        data: VerifyBankData.fromJson(json["data"]),
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data.toJson(),
        "responseCode": responseCode,
      };
}

class VerifyBankData {
  String status;
  String message;
  AccountData data;

  VerifyBankData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VerifyBankData.fromJson(Map<String, dynamic> json) => VerifyBankData(
        status: json["status"],
        message: json["message"],
        data: AccountData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class AccountData {
  String accountNumber;
  String accountName;

  AccountData({
    required this.accountNumber,
    required this.accountName,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
      );

  Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "account_name": accountName,
      };
}
