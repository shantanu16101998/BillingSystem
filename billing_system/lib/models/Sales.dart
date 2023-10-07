import 'dart:convert';

// Sales salesFromJSON(String str){
//  return Sales.fromJSON(json.decode(str));
// }

class Sales {

  String id;
  String productId;
  int quantity;

  Sales({required this.id,required this.productId,required this.quantity});

  factory Sales.fromJSON(Map<String,dynamic> json) => Sales(
      id: json["_id"],
      productId: json["productId"],
      quantity: json["quantity"]
  );

  Map<String,dynamic> toJSON() =>
      {
        "_id": id,
        "productId" : productId,
        "quantity" : quantity
      };
}