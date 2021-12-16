import 'package:flutter/material.dart';
import 'package:main_program/general_pages/Accountant/AccountantHome.dart';
import 'package:main_program/general_pages/Accountant/InsertNewEmployee.dart';
import 'general_pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => AccountantHome(),
      },
    );
  }
}
