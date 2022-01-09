import 'dart:convert';

List<events> eventsFromJson(String str) => List<events>.from(json.decode(str).map((x) => events.fromJson(x)));


class events
{
  final event_id;
  final event_date_start;
  final event_date_end;
  final description;
  final theme;
  final title;
  final sec_number;
  final staff_id;

  events({required this.event_id,  required this.event_date_start,required this.event_date_end,
    required this.description,required this.theme,required this.title,required this.sec_number,required this.staff_id});

  factory events.fromJson(Map<String, dynamic> json) {
    return events(
      //the green parameters --> are the same name in the database
      event_id: json["ID"],
      event_date_start: json["Date_Start"],
      event_date_end: json["Date_End"],
      description: json["description"],
      theme: json["theme"],
      title: json["title"],
      sec_number: json["sec_number"],
      staff_id: json["staff_id"],
    );

  }
}


