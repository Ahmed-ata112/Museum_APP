import 'dart:convert';

List<visitor_id> visitor_idFromJson(String str) => List<visitor_id>.from(json.decode(str).map((x) => visitor_id.fromJson(x)));


class visitor_id
{
  int id;

  visitor_id({required this.id});

  factory visitor_id.fromJson(Map<String, dynamic> json) {
    return visitor_id(
      //the green parameters --> are the same name in the database
      id: json["ID"],

    );

  }

}


