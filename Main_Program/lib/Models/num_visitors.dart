import 'dart:convert';

List<num_visiotrs> num_visiotrsFromJson(String str) => List<num_visiotrs>.from(json.decode(str).map((x) => num_visiotrs.fromJson(x)));

class num_visiotrs {
  num_visiotrs({
    required this.numV,
  });

  int numV;

  factory num_visiotrs.fromJson(Map<String, dynamic> json) => num_visiotrs(
    numV: json["numVisitors"],
  );
}