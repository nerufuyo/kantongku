class TransactionModel {
  final String name;
  final String photoUrl;
  final bool status;
  final String dateTransfer;
  final String timeTransfer;
  final double totalMoney;

  TransactionModel({
    required this.name,
    required this.photoUrl,
    required this.status,
    required this.dateTransfer,
    required this.timeTransfer,
    required this.totalMoney,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        name: json["name"],
        photoUrl: json["photoURL"],
        status: json["status"],
        dateTransfer: json["dateTransfer"],
        timeTransfer: json["timeTransfer"],
        totalMoney: json["totalMoney"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photoURL": photoUrl,
        "status": status,
        "dateTransfer": dateTransfer,
        "timeTransfer": timeTransfer,
        "totalMoney": totalMoney,
      };
}
