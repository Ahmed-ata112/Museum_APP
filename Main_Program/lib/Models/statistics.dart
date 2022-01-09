import 'dart:convert';

List<stat> statFromJson(String str) => List<stat>.from(json.decode(str).map((x) => stat.fromJson(x)));

class stat {
  stat({
    required this.time,
    required this.quantity,
  });

  String time;
  int quantity;

  factory stat.fromJson(Map<String, dynamic> json) => stat(
    time: json["time"],
    quantity: json["q"],

  );


  //comparator operator  --> to be able ot sort
  // bool operator == (stat obj) {
  //
  //
  // }
}