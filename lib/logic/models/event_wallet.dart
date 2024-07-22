// To parse this JSON data, do
//
//     final eventwallet = eventwalletFromJson(jsonString);

import 'dart:convert';

Eventwallet eventwalletFromJson(String str) =>
    Eventwallet.fromJson(json.decode(str));

String eventwalletToJson(Eventwallet data) => json.encode(data.toJson());

class Eventwallet {
  bool? isSuccessful;
  String? message;
  WalletData? data;
  String? responseCode;

  Eventwallet({
    this.isSuccessful,
    this.message,
    this.data,
    this.responseCode,
  });

  factory Eventwallet.fromJson(Map<String, dynamic> json) => Eventwallet(
        isSuccessful: json["isSuccessful"],
        message: json["message"],
        data: WalletData.fromJson(json["data"]),
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data!.toJson(),
        "responseCode": responseCode,
      };
}

class WalletData {
  int? balance;
  String? currency;
  String? walletId;

  WalletData({
    this.balance,
    this.currency,
    this.walletId,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) => WalletData(
        balance: json["balance"],
        currency: json["currency"],
        walletId: json["walletId"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "currency": currency,
        "walletId": walletId,
      };
}
