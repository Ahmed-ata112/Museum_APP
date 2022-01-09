import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main_program/Receptionist/Home_receptionist.dart';
import 'Accountant/AccountantHome.dart';
import 'Researcher/researcher_home.dart';
import 'controller.dart';
import 'general_pages/loading_after_login.dart';
import 'general_pages/login_page.dart';
import 'member_view/member_home.dart';
import 'api.dart';
import 'package:intl/intl.dart';
import 'package:main_program/Shop_Manager/Pie_Chart.dart';
import 'package:main_program/Shop_Manager/all_statistics.dart';
import 'package:main_program/Shop_Manager/Dashboard.dart';

void try_login() async {
  //String query = 'insert into myusers values("sdsd","hiii");';
  //int a = await executeNonQuery(query);
  //print(a); //works
  //String query = "SELECT firstname FROM mydb.myusers where lastname='22';";
  //String query = "SELECT id FROM mydb.bag where id = 2;";
  // String query = "SELECT * FROM mydb.bag;";
  //dynamic r = await DBManager.executeReader(query);
  //print(r);
  //String query = "insert into museum.visitor values (11,'2013-05-02', '2020-05-02');";
  //String query = 'SELECT a.SO_ID, SUM(a.quantity) FROM ((SELECT SO_ID, quantity FROM buy_member_souvenir) UNION (SELECT S_ID , quantity FROM buys_visitor_souvenir))a GROUP BY a.SO_ID;';
  /*String query = 'select * from museum.visitor;';
  dynamic r = await DBManager.executeReader(query);
  print(r);
  for (var vv in r) {
    for (var v in vv) {
      print(v);
    }
  }*/

//  final DateTime now = DateTime.now();
  // final DateFormat formatter = DateFormat('yyyy-MM-dd');
//  final String formatted = formatter.format(now);
  // print(formatted);
  // String Q =
  //     "INSERT INTO museum.user VALUES ('lolotheone', '123456789', 1, '$formatted');";
  //int a = await DBManager.executeNonQuery(Q);
  // print(a); //works

  // print(a);

  // String proc = 'insert_new_user';
  // List<dynamic> LL = ['ALI', 'KOLKOLKOL', 2, '01-8-01'];
  //DBManager.executeNonQueryProc(proc, LL);

  // List<dynamic> to_send = ['ahmedaa', '123456789'];
  // dynamic userType =
  //     await DBManager.executeScalerProc('get_user_type', to_send);

  // dynamic aa = await Controller.getMembersData('aaaaaaaad');
  // if (aa == null) print(aa);
  // var a = await DBManager.geteventloc("coronavirus");
  // var b = await DBManager.gettourloc("fun");
  // var c = await DBManager.search_visitor_id(4);
  // var d = await DBManager.getmaxsold();
  // var s = await DBManager.getstat();
  // print(DateTime.parse(s.first.time).toString());

  // await Controller.addNewSouvenir(55, 'sov', 34, 70);

  //List<dynamic> tosend = [50, 'sov', 34, 70];
  //await DBManager.executeNonQueryProc('inert_new_souvenir', tosend);

  //String query = "insert into museum.souvenir values (8,'sov', 34.0, 70);";
  //await DBManager.executeNonQuery(query);
  //print(d.first.max_quantity);
  //var x = await DBManager.search_sov_id(1);
  //var x = await DBManager.count_visitors_now('2020-05-02 00:00:00');
  var y = await DBManager.getVisitorsArrivalTime();
  print(y.first.arrivalV);
}

void main() {
  runApp(MyApp());
  //try_login();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) =>
            Dashboard(), //Home_Receptionist(),//Dashboard(),//Statistics(),//
        '/loading_after_login': (context) => const loading_after_login(),
        '/member_home': (context) => const member_home(),
        '/accountant_home': (context) => AccountantHome(),
        '/ResearcherHome': (context) => const ResearcherHome(),
        '/Home_Receptionist': (context) => Home_Receptionist(),
        '/Home_Shop_Manager': (context) => const Dashboard(),
      },
    );
  }
}
