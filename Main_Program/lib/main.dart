import 'package:flutter/material.dart';
import 'Accountant/AccountantHome.dart';
import 'general_pages/loading_after_login.dart';
import 'general_pages/login_page.dart';
import 'member_view/member_home.dart';
import 'Researcher/researcher_home.dart';
import 'api.dart';

void try_login() async {
  //String query = 'insert into myusers values("sdsd","hiii");';
  //int a = await executeNonQuery(query);
  //print(a); //works
  //String query = "SELECT firstname FROM mydb.myusers where lastname='22';";
  //String query = "SELECT id FROM mydb.bag where id = 2;";
  String query = "SELECT ID FROM mydb.bag;";
  dynamic r = await DBManager.executeReader(query);

  // for (var vv in r) {
  //   for (var v in vv) {
  //     print(v);
  //   }
  // }

  // print(a);
}

void main() {
  // runApp(MyApp());
  try_login();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/member_home',
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
