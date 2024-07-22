class TicketModel {
  TicketModel({
    required this.isInviteOnly,
    required this.isPaused,
    required this.isUnLimited,
    required this.name,
    required this.price,
    required this.quantity,
    required this.status,
    this.id,
  });
  int? id;
  String name;
  String price;
  String status;
  String quantity;
  String isUnLimited;
  String isInviteOnly;
  String isPaused;
}

class TicketCategoryListItemModel {
  final String name;
  final String price;
  final String status;
  final String quantity;
  final bool isUnlimited;
  final bool isInviteOnly;
  final bool isPaused;

  TicketCategoryListItemModel({
    required this.name,
    required this.price,
    required this.status,
    required this.quantity,
    required this.isUnlimited,
    required this.isInviteOnly,
    required this.isPaused,
  });

  factory TicketCategoryListItemModel.fromJson(Map<String, dynamic> json) {
    return TicketCategoryListItemModel(
      name: json['Name'],
      price: json['Price'],
      status: json['Status'],
      quantity: json['Quantity'],
      isUnlimited: json['IsUnLimited'] == 'true',
      isInviteOnly: json['IsInviteOnly'] == 'true',
      isPaused: json['IsPaused'] == 'true',
    );
  }
}
