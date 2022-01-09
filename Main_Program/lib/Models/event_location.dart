import 'dart:convert';

List<event_loc> event_locFromJson(String str) => List<event_loc>.from(json.decode(str).map((x) => event_loc.fromJson(x)));


class event_loc
{
  int sec_num;

  event_loc({required this.sec_num});

  factory event_loc.fromJson(Map<String, dynamic> json) {
    return event_loc(
      //the green parameters --> are the same name in the database
      sec_num: json["sec_number"],

    );

  }

  int get_secnum()
  {
    return sec_num;
  }
}


