// import 'dart:ffi';
// import 'package:flutter/material.dart';
// //import 'package:charts_flutter/flutter.dart' as charts;
// //import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:main_program/controller.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:async';
//
//
//
// class statistics extends StatefulWidget {
//   const statistics({Key? key}) : super(key: key);
//
//   @override
//   _statisticsState createState() => _statisticsState();
// }
//
// class _statisticsState extends State<statistics> {
//   Controller controllerobj = Controller();
//
//   List<charts.Series<sales, String>>? _seriesData;
//   late List<charts.Series<goods, int>> _seriesPieData;
//   List<charts.Series<goods, int>>? _seriesLineData;
//
//   _generateData() {
//     dynamic piedata = Controller.select_data();
//     List<goods> l = [];
//     for (var u in piedata) {  // convert each map to the model Album and add it to our list
//       goods album = goods.fromjson(u);  //create an object of the class calling the second constructor
//       l.add(album);
//     }
//
//
//     _seriesPieData.add(
//       charts.Series(
//         domainFn: (goods g, _) => g.id_souviner,
//         measureFn: (goods g , _) => g.quantity_sold,
//         colorFn: (goods g, _) =>
//             charts.ColorUtil.fromDartColor(Colors.blue),
//         id: 'Souviners',
//         data: piedata,
//         labelAccessorFn: (goods row, _) => '${row.quantity_sold}',
//       ),
//     );
//   }
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //_seriesData = List<charts.Series<Pollution, String>>();
//     List<charts.Series<goods, int>> _seriesPieData;
//     //_seriesLineData = List<charts.Series<Sales, int>>();
//     _generateData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff1976d2),
//         //backgroundColor: Color(0xff308e1c),
//         bottom: TabBar(
//           indicatorColor: Color(0xff9962D0),
//           tabs: [
//             Tab(
//               icon: Icon(FontAwesomeIcons.solidChartBar),
//             ),
//             Tab(icon: Icon(FontAwesomeIcons.chartPie)),
//             Tab(icon: Icon(FontAwesomeIcons.chartLine)),
//           ],
//         ),
//         title: Text('Flutter Charts'),
//       ),
//       body: TabBarView(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Container(
//               child: Center(
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                       'Time spent on daily tasks',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
//                     SizedBox(height: 10.0,),
//                     Expanded(
//                       child: charts.PieChart(
//                           _seriesPieData,
//                           animate: true,
//                           animationDuration: Duration(seconds: 5),
//                           behaviors: [
//                             new charts.DatumLegend(
//                               outsideJustification: charts.OutsideJustification.endDrawArea,
//                               horizontalFirst: false,
//                               desiredMaxRows: 2,
//                               cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
//                               entryTextStyle: charts.TextStyleSpec(
//                                   color: charts.MaterialPalette.purple.shadeDefault,
//                                   fontFamily: 'Georgia',
//                                   fontSize: 11),
//                             )
//                           ],
//                           defaultRenderer: new charts.ArcRendererConfig(
//                               arcWidth: 100,
//                               arcRendererDecorators: [
//                                 new charts.ArcLabelDecorator(
//                                     labelPosition: charts.ArcLabelPosition.inside)
//                               ])),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
//
//
// //classes for the required data to draw the charts
// class sales
// {
//   int sum_price;
//   int day;
//   sales(this.sum_price, this.day);
// }
//
//
//
//
//
//
// //souvenirs bought by members
// class goods
// {
//   int quantity_sold;
//   int id_souviner;
//   goods({required this.id_souviner, required this.quantity_sold});
//
//   factory goods.fromjson(Map<String, dynamic> parsedjson) {
//     return goods(
//       //the green parameters --> are the same name in the database
//         quantity_sold: parsedjson["SO_ID"],
//         id_souviner: parsedjson["quantity"]);
//
//   }
// }
//
// //souvenirs bought by visitor
// class goods2
// {
//   int quantity_sold;
//   int id_souviner;
//   goods2({required this.id_souviner, required this.quantity_sold});
//
//   factory goods2.fromjson(Map<String, dynamic> parsedjson) {
//     return goods2(
//       //the green parameters --> are the same name in the database
//         quantity_sold: parsedjson["S_ID"],
//         id_souviner: parsedjson["quantity"]);
//
//   }
// }