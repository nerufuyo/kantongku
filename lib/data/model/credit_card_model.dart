class CreditCardModel {
  final int id;
  final String name;
  final String cv;
  final String expirationDate;
  final String cardNumber;
  final double balance;
  final int status;
  final bool visa;

  CreditCardModel({
    required this.id,
    required this.name,
    required this.cv,
    required this.expirationDate,
    required this.cardNumber,
    required this.balance,
    required this.status,
    required this.visa,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      CreditCardModel(
        id: json["id"],
        name: json["name"],
        cv: json["cv"],
        expirationDate: json["expiration_date"],
        cardNumber: json["card_number"],
        balance: json["balance"],
        status: json["status"],
        visa: json["visa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cv": cv,
        "expiration_date": expirationDate,
        "card_number": cardNumber,
        "balance": balance,
        "status": status,
        "visa": visa,
      };
}
