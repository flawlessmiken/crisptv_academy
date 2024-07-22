class PaidEventModel {
  String? value;
  String? cardNumber;
  String? cardName;
  String? cardExpiry;
  String? cvv;
  String? auth;
  String? otp;
  String? cardReference;
  String? eventId;
  bool? isEarlyBird;
  String? title;
  String? description;
  String? categoryName;
  double? earlyBirdPrice;

  PaidEventModel({
    this.value,
    this.cardNumber,
    this.cardName,
    this.cardExpiry,
    this.cvv,
    this.auth,
    this.otp,
    this.cardReference,
    this.eventId,
    this.isEarlyBird,
    this.title,
    this.description,
    this.categoryName,
    this.earlyBirdPrice,
  });

  factory PaidEventModel.fromJson(Map<String, dynamic> json) {
    return PaidEventModel(
      value: json['value'],
      cardNumber: json['cardNumber'],
      cardName: json['cardName'],
      cardExpiry: json['cardExpiry'],
      cvv: json['cvv'],
      auth: json['auth'],
      otp: json['otp'],
      cardReference: json['cardReference'],
      eventId: json['eventId'],
      isEarlyBird: json['isEarlyBird'],
      title: json['title'],
      description: json['description'],
      categoryName: json['categoryName'],
      earlyBirdPrice: json['earlyBirdPrice']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'cardNumber': cardNumber,
      'cardName': cardName,
      'cardExpiry': cardExpiry,
      'cvv': cvv,
      'auth': auth,
      'otp': otp,
      'cardReference': cardReference,
      'eventId': eventId,
      'isEarlyBird': isEarlyBird,
      'title': title,
      'description': description,
      'categoryName': categoryName,
      'earlyBirdPrice': earlyBirdPrice,
    };
  }
}