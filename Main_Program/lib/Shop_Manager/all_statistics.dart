import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:main_program/Models/Goods.dart';
import 'package:main_program/api.dart';
import 'package:main_program/controller.dart';
import 'package:main_program/Shop_Manager/piechart_sections.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_program/Shop_Manager/Pie_Chart.dart';
import 'package:main_program/Shop_Manager/Bar_Chart.dart';
import 'package:main_program/Shop_Manager/line_chart.dart';

import 'dart:math';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff1976d2),
              //backgroundColor: Color(0xff308e1c),
              bottom: const TabBar(
                indicatorColor: Color(0xff9962D0),
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.solidChartBar),
                  ),
                  Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                  Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                ],
              ),
              title: const Text('Statistics'),
            ),
            body: TabBarView(children: [
              BarChartWidget(),
              const Statistics_Dashboard(),
              LineChartWidget()
            ])));
  }
}
