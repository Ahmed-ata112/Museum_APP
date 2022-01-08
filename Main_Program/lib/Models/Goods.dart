import 'dart:convert';

List<Good> goodsFromJson(String str) => List<Good>.from(json.decode(str).map((x) => Good.fromJson(x)));

class Good {
  Good({
    required this.sovId,
    required this.quantity,
  });

  int sovId;
  int quantity;

  factory Good.fromJson(Map<String, dynamic> json) => Good(
    sovId: json["sov_id"],
    quantity: json["quantity"],
  );
}