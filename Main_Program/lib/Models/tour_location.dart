import 'dart:convert';

List<tour_loc> tour_locFromJson(String str) => List<tour_loc>.from(json.decode(str).map((x) => tour_loc.fromJson(x)));


class tour_loc
{
  String place;

  tour_loc({required this.place});

  factory tour_loc.fromJson(Map<String, dynamic> json) {
    return tour_loc(
      //the green parameters --> are the same name in the database
      place: json["place"],

    );

  }

}


