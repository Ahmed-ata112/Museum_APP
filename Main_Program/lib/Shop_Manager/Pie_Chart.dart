import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:main_program/Models/Goods.dart';
import 'package:main_program/api.dart';
import 'package:main_program/controller.dart';
import 'package:main_program/Shop_Manager/piechart_sections.dart';


import 'dart:math';

List<MaterialColor> primaries = [];
List<PieChartSectionData> getSections(List<Good> goods) {
  int quantity = 0;
  goods.forEach((good) => quantity += good.quantity);
  return goods.map((sov) => PieChartSectionData(
    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

    value: (sov.quantity / quantity).toDouble(),
      radius: 100,
    title: '${((sov.quantity / quantity) * 100).toStringAsFixed(2)} %\n ID: ${sov.sovId}',
  )).toList();
}


class Statistics_Dashboard extends StatefulWidget {
  const Statistics_Dashboard({Key? key}) : super(key: key);

  @override
  Statistics_DashboardState createState() => Statistics_DashboardState();
}

class Statistics_DashboardState extends State<Statistics_Dashboard> {
  int touchedIndex= 0;


  late Future<List<PieChartSectionData>> _seriesPieData;
    @override



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Pie Chart"),
          backgroundColor: Colors.black12
        ),
        body: FutureBuilder<List<Good>>(
          future: DBManager.getGoods(),
          builder:(context, snapshot){
          if(snapshot.hasData) {
          return Center(
            child: Expanded(
              child: PieChart(
              PieChartData(
              // pieTouchData: PieTouchData(
              //   touchCallback: (pieTouchResponse) {
              //     setState(() {
              //       if (pieTouchResponse.touchInput is FlLongPressEnd ||
              //           pieTouchResponse.touchInput is FlPanEnd) {
              //         touchedIndex = -1;
              //       } else {
              //         touchedIndex = pieTouchResponse.touchedSectionIndex;
              //       }
              //     });
              //   },
              // ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: getSections(snapshot.data!),
          ),
        ),
            ),
      );
    }
          return CircularProgressIndicator();
  } ,
),





























//
//         body: FutureBuilder<List<PieChartSectionData>>(   // or futureProvider if we are working on a provider ?????
//         future: _seriesPieData,  //the property future --> can be a higher order fn --> like on tap fn /// or it can be any var of type future
//         builder: (context, snapShout){ //snapShout ? --> when users = getData() is executed it will put the users inside the snapShout
//         if (snapShout.hasData) {
//         return Column(
//           children: <Widget>[
//             Expanded(
//               child: PieChart(
//                 PieChartData(
//                   pieTouchData: PieTouchData(
//                     touchCallback: (pieTouchResponse) {
//                       setState(() {
//                         if (pieTouchResponse.touchInput is FlLongPressEnd ||
//                             pieTouchResponse.touchInput is FlPanEnd) {
//                           touchedIndex = -1;
//                         } else {
//                           touchedIndex = pieTouchResponse.touchedSectionIndex;
//                         }
//                       });
//                     },
//                   ),
//                   borderData: FlBorderData(show: false),
//                   sectionsSpace: 0,
//                   centerSpaceRadius: 40,
//                   sections: snapShout.data!,
//                 ),
//               ),
//             ),
//             /* Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: IndicatorsWidget(),
//                 ),
//               ],
//             ),*/
//           ],
//         );
//   }
//       return Center(child: CircularProgressIndicator());
//
//
//   },
//
//
// ),
      );
  }
}








/*
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_program/controller.dart';


class statistics extends StatefulWidget {
  const statistics({Key? key}) : super(key: key);

  @override
  _statisticsState createState() => _statisticsState();
}

class _statisticsState extends State<statistics> {
  Controller controllerobj = Controller();

  List<charts.Series<sales, String>> _seriesData;
  List<charts.Series<goods, String>> _seriesPieData;
  List<charts.Series<goods, int>> _seriesLineData;

  _generateData() {
    dynamic piedata = Controller.select_data(),
  }

  _seriesPieData.add(
  charts.Series(
  domainFn: (goods g, _) => g.id_souviner,
  measureFn: (goods g , _) => g.quantity_sold,
  colorFn: (goods g, _) =>
  charts.ColorUtil.fromDartColor(Colors.blue),
  id: 'Souviners',
  data: piedata,
  labelAccessorFn: (goods row, _) => '${row.quantity_sold}',
  ),
  );



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerobj = Controller();

    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}




////////////////////////////////////////////////////////////
class pie_chart extends StatefulWidget {
  const pie_chart({Key? key}) : super(key: key);

  @override
  _pie_chartState createState() => _pie_chartState();
}

class _pie_chartState extends State<pie_chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

//////////////////////////////////////////////////////////
class bar_chart extends StatefulWidget {
  const bar_chart({Key? key}) : super(key: key);

  @override
  _bar_chartState createState() => _bar_chartState();
}

class _bar_chartState extends State<bar_chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

///////////////////////////////////////////////////////////
class graph extends StatefulWidget {
  const graph({Key? key}) : super(key: key);

  @override
  _graphState createState() => _graphState();
}

class _graphState extends State<graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

//classes for the required data to draw the charts
class sales
{
  int sum_price;
  int day;
  sales(this.sum_price, this.day);
}

class goods
{
  int quantity_sold;
  int id_souviner;
  goods(this.quantity_sold, this.id_souviner);
}
*/



//
// //souvenirs bought by members/visitors
// class goods
// {
//   int quantity_sold;
//   int id_souviner;
//   goods({required this.id_souviner, required this.quantity_sold});
//
//   factory goods.fromjson(Map<String, dynamic> parsedjson) {
//     return goods(
//       //the green parameters --> are the same name in the database
//         id_souviner: parsedjson["SO_ID"],
//         quantity_sold: parsedjson["SUM(a.quantity)"]);
//
//   }
// }




// List<PieChartSectionData> getSections(List<Good> goods, int touchedIndex) {
//   int quantity = 0;
//   var isTouched;
//   final double fontSize;
//   goods.forEach((good) => quantity += good.quantity);
//   goods.forEach((good) =>
//     isTouched = good.sovId == touchedIndex;
//     final double fontSize = isTouched ? 25 : 16;
//     final double radius = isTouched ? 100 : 80;)
//   return goods.map((sov) => final value = PieChartSectionData(
//       color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//       value: (sov.quantity / quantity).toDouble(),
//       radius: 100,
//       title: '${((sov.quantity / quantity) * 100).toStringAsFixed(2)} %',
//
//
//   )).toList();
// }
//
//
//
