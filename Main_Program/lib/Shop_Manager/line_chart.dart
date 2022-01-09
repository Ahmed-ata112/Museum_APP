import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_program/Models/Goods.dart';
import 'package:main_program/Models/max_sold_quantity.dart';
import 'package:main_program/Models/statistics.dart';
import 'package:main_program/api.dart';

class LineChartWidget extends StatefulWidget {
  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  final DateFormat formatter = DateFormat('yyy-mm-dd');
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final double barWidth = 22;
  late List<max_sold> maxi = [];
  late List<stat> _goods = [];
  final DateTime now = DateTime.now(); //to be max date
  @override
  void function() async {
    // do something here
    _goods = await DBManager.getstat();
    //_goods.sort();
    maxi = await DBManager.getmaxsale();
  }

  void initState() {
    //the program will start by it at the first of the program
    function();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: DBManager.getmaxsale(),
      builder: (context, snapshot1) {
        if (snapshot1.hasData) {
          return FutureBuilder(
              future: DBManager.getstat(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LineChart(
                      LineChartData(
                        // titlesData: FlAxisTitleData(AxisTitle(titleText: "") ),
                        // //axisTitleData: FlLineLabel(),
                        minX: 0,
                        maxX: 12, //as number of months are 12
                        minY: 0,
                        maxY: maxi.first.max_quantity.toDouble() + 5,
                        //titlesData: LineTitles.getTitleData(),
                        gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(
                              color: const Color(0xff37434d), width: 1),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              //i am doing the following check as it will give an error if the spots does not contain any point to draw so --> if nothing is sold in current year so it will only draw a point at the origin
                              if (DateTime.parse(_goods.first.time).year !=
                                  now.year) //i am comparing the first element only as i have ordered the query in descending order in the api python script
                                FlSpot(0, 0),
                              if (DateTime.parse(_goods.first.time).year ==
                                  now
                                      .year) //i put another if statement as when i used else it gives me an error
                                for (var s in _goods)
                                  if (DateTime.parse(s.time).year == now.year)
                                    FlSpot(
                                        DateTime.parse(s.time).month.toDouble(),
                                        s.quantity.toDouble())
                              //else
                              //FlSpot(0,0)
                            ],
                            isCurved: true,
                            colors: gradientColors,
                            barWidth: 5,
                            // dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              colors: gradientColors
                                  .map((color) => color.withOpacity(0.3))
                                  .toList(),
                            ),
                          ),
                        ],

                        axisTitleData: FlAxisTitleData(
                            show: true,
                            leftTitle: AxisTitle(
                                showTitle: true,
                                titleText: "quantity sold",
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 14)),
                            bottomTitle: AxisTitle(
                                showTitle: true,
                                titleText: "month (current year)",
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 14))),
                      ),

                      swapAnimationDuration:
                          Duration(milliseconds: 150), // Optional
                    ),
                  );
                }
                return CircularProgressIndicator();
              });
        }
        return CircularProgressIndicator();
      });
}
