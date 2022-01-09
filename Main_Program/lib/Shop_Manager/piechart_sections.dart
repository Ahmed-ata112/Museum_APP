// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:main_program/controller.dart';
//
//
//
// //souvenirs bought by members/visitors
// class goods
// {
//   final quantity_sold;
//   final id_souviner;
//   goods({required this.id_souviner, required this.quantity_sold});
//
//   factory goods.fromjson(Map<String, dynamic> parsedjson) {
//     return goods(
//       //the green parameters --> are the same name in the database
//         quantity_sold: parsedjson["a.SO_ID"],
//         id_souviner: parsedjson["a.SUM(a.quantity)"]);
//
//   }
// }
//
//
// class PieData {
//   //Controller controllerobj = Controller();
//
//    static dynamic piedata = Controller.select_data(); //don't i need to make an object from the controller class
//
//   static List<goods> l = [];
//
//   static List <goods> get_data()
//   {
//     List<goods> l = [];
//     for (var u in piedata) { // convert each map to the model Album and add it to our list
//       goods element = goods.fromjson(u); //create an object of the class calling the second constructor
//       l.add(element);
//     }
//     return l;
//   }
//
// }
//
//
// //
// Future<List<PieChartSectionData>> getSections(int touchedIndex) async => PieData.get_data() //l --> should be static ?????????
//     .asMap()
//     .map<int, PieChartSectionData>((index, data) {
//     final isTouched = index == touchedIndex;
//     final double fontSize = isTouched ? 25 : 16;
//     final double radius = isTouched ? 100 : 80;
//
//     final value = PieChartSectionData(
//     color: Colors.blue,
//     value: data.quantity_sold.toDouble(),
//     title: '${data.quantity_sold}%',
//     radius: radius,
//     titleStyle: TextStyle(
//     fontSize: fontSize,
//     fontWeight: FontWeight.bold,
//     color: const Color(0xffffffff),
//     ),
//     );
//     return MapEntry(index, value);
//     })
//     .values
//     .toList();
//
