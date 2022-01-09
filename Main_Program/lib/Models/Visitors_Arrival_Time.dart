import 'dart:convert';

List<visitors_arr_time> visitors_arr_timeFromJson(String str) => List<visitors_arr_time>.from(json.decode(str).map((x) => visitors_arr_time.fromJson(x)));

class visitors_arr_time {
  visitors_arr_time({
    required this.arrivalV,
  });

  String arrivalV;

  factory visitors_arr_time.fromJson(Map<String, dynamic> json) => visitors_arr_time(
    arrivalV: json["ArrivalTime"],
  );
}