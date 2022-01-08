import 'package:flutter/material.dart';
import 'Accountant/AccountantHome.dart';
import 'Researcher/researcher_home.dart';
import 'admin_view/admin_home.dart';
import 'controller.dart';
import 'general_pages/loading_after_login.dart';
import 'general_pages/login_page.dart';
import 'member_view/member_home.dart';
import 'api.dart';
import 'package:intl/intl.dart';
import 'data_holders.dart';
void try_login() async {
  //String query = 'insert into myusers values("sdsd","hiii");';
  //int a = await executeNonQuery(query);
  //print(a); //works
  //String query = "SELECT firstname FROM mydb.myusers where lastname='22';";
  //String query = "SELECT id FROM mydb.bag where id = 2;";
  // String query = "SELECT * FROM mydb.bag;";
  //dynamic r = await DBManager.executeReader(query);
  //print(r);
  // for (var vv in r) {
  //   for (var v in vv) {
  //     print(v);
  //   }
  // }

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
  // dynamic userType = await DBManager.executeScalerProc('get_all_events', []);
  // print(userType);
  // dynamic aa = await Controller.getMembersData('aaaaaaaad');
  // if (aa == null) print(aa);

/*  var aa =
      await Controller.getAllUsernamesWithType(); //[[dsdasd], [sdasdasdasd]]
  print(aa);*/
}

void main() {
  runApp(MyApp());
  // try_login();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => const login_page(),
        '/loading_after_login': (context) => const loading_after_login(),
        '/member_home': (context) => const member_home(),
        '/admin_home': (context) => const admin_home(),
        '/accountant_home': (context) => AccountantHome(),
        '/ResearcherHome': (context) => const ResearcherHome(),
      },
    );
  }
}
