import 'dart:convert';

BankName bankNameFromJson(String str) => BankName.fromJson(json.decode(str));

String bankNameToJson(BankName data) => json.encode(data.toJson());

class BankName {
  String status;
  String message;
  List<Banks> data;

  BankName({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BankName.fromJson(Map<String, dynamic> json) => BankName(
        status: json["status"],
        message: json["message"],
        data: List<Banks>.from(json["data"].map((x) => Banks.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Banks {
  int id;
  String code;
  String name;

  Banks({
    required this.id,
    required this.code,
    required this.name,
  });

  factory Banks.fromJson(Map<String, dynamic> json) => Banks(
        id: json["id"] ?? 0,
        code: json["code"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
      };
}
