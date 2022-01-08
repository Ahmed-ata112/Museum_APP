import 'dart:convert';

List<max_sold> max_soldFromJson(String str) => List<max_sold>.from(json.decode(str).map((x) => max_sold.fromJson(x)));

class max_sold {
  max_sold({
    required this.max_quantity,
  });

  int max_quantity;

  factory max_sold.fromJson(Map<String, dynamic> json) => max_sold(
    max_quantity: json["maximum"],
  );
}