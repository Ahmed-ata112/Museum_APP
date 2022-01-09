import 'dart:convert';

List<sov_id> sov_idFromJson(String str) => List<sov_id>.from(json.decode(str).map((x) => sov_id.fromJson(x)));


class sov_id
{
  int id;

  sov_id({required this.id});

  factory sov_id.fromJson(Map<String, dynamic> json) {
    return sov_id(
      //the green parameters --> are the same name in the database
      id: json["ID"],

    );

  }

}
