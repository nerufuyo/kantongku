class PocketModel {
  final String pocket;
  final double totalMoney;
  final int typePocket;

  PocketModel({
    required this.pocket,
    required this.totalMoney,
    required this.typePocket,
  });

  factory PocketModel.fromJson(Map<String, dynamic> json) => PocketModel(
        pocket: json["pocket"],
        totalMoney: json["total_money"],
        typePocket: json["type_pocket"],
      );

  Map<String, dynamic> toJson() => {
        "pocket": pocket,
        "total_money": totalMoney,
        "type_pocket": typePocket,
      };
}
