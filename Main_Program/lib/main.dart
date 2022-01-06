import 'package:flutter/material.dart';
import 'Accountant/AccountantHome.dart';
import 'Researcher/researcher_home.dart';
import 'general_pages/loading_after_login.dart';
import 'general_pages/login_page.dart';
import 'member_view/member_home.dart';
import 'api.dart';
import 'package:intl/intl.dart';

void try_login() async {
  //String query = 'insert into myusers values("sdsd","hiii");';
  //int a = await executeNonQuery(query);
  //print(a); //works
  //String query = "SELECT firstname FROM mydb.myusers where lastname='22';";
  //String query = "SELECT id FROM mydb.bag where id = 2;";
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  print(formatted);
  String query = "SELECT * FROM museum.user_;";
  dynamic r = await DBManager.executeReader(query);
  //print(r);
  for (var vv in r) {
     for (var v in vv) {
       print(v);
     }
   }
  /*String proc = 'asdasd';
  List<dynamic> LL = [8, 'aaa'];
  DBManager.executeNonQueryProc(proc, 4);*/

  String Q =
      "INSERT INTO museum.user_ VALUES ('lolotheone', '123456789', 1, '$formatted');";
  //int a = await DBManager.executeNonQuery(Q);
  //print(a); //works

  // print(a);
}

void main() {
  //runApp(MyApp());
  try_login();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loading_after_login',
      routes: {
        '/login_page': (context) => const login_page(),
        '/loading_after_login': (context) => const loading_after_login(),
        '/member_home': (context) => const member_home(),
        '/accountant_home': (context) => AccountantHome(),
        '/ResearcherHome': (context) => const ResearcherHome(),
      },
    );
  }
}
