import 'dart:convert';

List<tours> toursFromJson(String str) => List<tours>.from(json.decode(str).map((x) => tours.fromJson(x)));


class tours
{
  final ID;
  final place;
  final description;
  final topic;
  final Date_Start;
  final Date_End;
  final organizer_id;

  tours({required this.ID,  required this.place,
    required this.description,required this.topic,required this.Date_Start,required this.Date_End,required this.organizer_id});

  factory tours.fromJson(Map<String, dynamic> json) {
    return tours(
      //the green parameters --> are the same name in the database
      ID: json["ID"],
      place: json["place"],
      description: json["description"],
      topic: json["topic"],
      Date_Start: json["Date_Start"],
      Date_End: json["Date_End"],
      organizer_id: json["organizer_id"],
    );

  }
}


