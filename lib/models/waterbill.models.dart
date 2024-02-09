import 'dart:convert';

class BillModel {
  String id;
  int previousUnit;
  int currentUnit;
  int totalUnit;
  int totalPrice;

  BillModel({
    required this.id,
    required this.previousUnit,
    required this.currentUnit,
    required this.totalUnit,
    required this.totalPrice,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        id: json["_id"],
        previousUnit: json["PreviousUnit"],
        currentUnit: json["CurrentUnit"],
        totalUnit: json["TotalUnit"],
        totalPrice: json["TotalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "PreviousUnit": previousUnit,
        "CurrentUnit": currentUnit,
        "TotalUnit": totalUnit,
        "TotalPrice": totalPrice,
      };
}
