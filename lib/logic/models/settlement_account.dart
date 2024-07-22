import 'dart:convert';

SettlementAccount settlementAccountFromJson(String str) =>
    SettlementAccount.fromJson(json.decode(str));

String settlementAccountToJson(SettlementAccount data) =>
    json.encode(data.toJson());

class SettlementAccount {
  bool? isSuccessful;
  String? message;
  AccountDetail data;
  String? responseCode;

  SettlementAccount({
    this.isSuccessful,
    this.message,
    required this.data,
    this.responseCode,
  });

  factory SettlementAccount.fromJson(Map<String, dynamic> json) {
    final records = json["data"]["records"];

    return SettlementAccount(
      isSuccessful: json["isSuccessful"],
      message: json["message"],
      data: records.isEmpty ? AccountDetail.fromJson({}) : AccountDetail.fromJson(records.first),
      responseCode: json["responseCode"],
    );
  }
  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data.toJson(),
        "responseCode": responseCode,
      };
}

class AccountDetail {
  String? bankName;
  String? bankAccountNumber;
  String? bankCode;

  AccountDetail({
    this.bankName,
    this.bankAccountNumber,
    this.bankCode,
  });

  factory AccountDetail.fromJson(Map<String, dynamic> json) => AccountDetail(
        bankName: json["bankName"],
        bankAccountNumber: json["bankAccountNumber"],
        bankCode: json["bankCode"],
      );

  Map<String, dynamic> toJson() => {
        "bankName": bankName,
        "bankAccountNumber": bankAccountNumber,
        "bankCode": bankCode,
      };
}
