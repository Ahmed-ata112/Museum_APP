
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:main_program/Models/Goods.dart';
import 'package:main_program/Models/max_sold_quantity.dart';
import 'package:main_program/api.dart';


List<BarChartData> BarData(List<Good> goods) {
  int quantity = 0;
  goods.forEach((good) => quantity += good.quantity);
  return goods.map((sov) => BarChartData(

  )).toList();
}






class BarChartWidget extends StatefulWidget {
  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final double barWidth = 22;
  late List<max_sold> maxi = [];
  late List<Good> _goods = [];

  @override


  void function() async {
    // do something here
    _goods = await DBManager.getGoods();
    maxi =  await DBManager.getmaxsold();


  }

  void initState() {  //the program will start by it at the first of the program
    function();
    super.initState();

  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
  future: DBManager.getmaxsold(),
  builder:(context, snapshot1) {
    if (snapshot1.hasData) {
      return FutureBuilder(
        future: DBManager.getGoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: BarChart(

                BarChartData(
                    alignment: BarChartAlignment.spaceEvenly,
                    maxY: maxi.first.max_quantity.toDouble() + 5,
                    minY: 0,
                    groupsSpace: 12,
                    axisTitleData: FlAxisTitleData(show: true,
                        leftTitle: AxisTitle(showTitle: true, titleText: "the quantity sold", textStyle:const TextStyle(color: Colors.black, fontSize: 14)),
                        bottomTitle: AxisTitle(showTitle: true,
                            titleText: "the id of the souvenir", textStyle:const TextStyle(color: Colors.black, fontSize: 14) ), ),
                    // barTouchData: BarTouchData(enabled: true),
                    // titlesData: FlTitlesData(
                    //   topTitles: SideTitles(),
                    //   bottomTitles: SideTitles(),
                    //   leftTitles: SideTitles(),
                    //   rightTitles: SideTitles(),
                    // ),
                    gridData: FlGridData(

                      //checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
                      getDrawingHorizontalLine: (value) {
                        if (value == 0) {
                          return FlLine(
                            color: const Color(0xff363753),
                            strokeWidth: 3,
                          );
                        } else {
                          return FlLine(
                            color: const Color(0xff2a2747),
                            strokeWidth: 0.8,
                          );
                        }
                      },
                    ),
                    barGroups: [
                      for(var good in _goods)

                        BarChartGroupData(x: good.sovId, barRods: [
                          BarChartRodData(y: good.quantity.toDouble(),
                              width: 15,
                              colors: [Colors.amber]),
                        ]),


                    ]),
              ),
            );
          }
          return CircularProgressIndicator();
        },

      );
    }
    return CircularProgressIndicator();
  }
  );
}