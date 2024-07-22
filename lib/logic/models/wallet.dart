import 'dart:convert';

WalletResponse walletResponseFromJson(String str) =>
    WalletResponse.fromJson(json.decode(str));

String walletResponseToJson(WalletResponse data) => json.encode(data.toJson());

class WalletResponse {
  bool? isSuccessful;
  String? message;
  WalletDetail data;
  String? responseCode;

  WalletResponse({
    this.isSuccessful,
    this.message,
    required this.data,
    this.responseCode,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
        isSuccessful: json["isSuccessful"],
        message: json["message"],
        data: WalletDetail.fromJson(json["data"]),
        responseCode: json["responseCode"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccessful": isSuccessful,
        "message": message,
        "data": data.toJson(),
        "responseCode": responseCode,
      };
}

class WalletDetail {
  int? balance;
  String? currency;
  String? walletId;

  WalletDetail({
    this.balance,
    this.currency,
    this.walletId,
  });

  factory WalletDetail.fromJson(Map<String, dynamic> json) => WalletDetail(
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
