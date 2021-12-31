import 'package:flutter/material.dart';
import 'package:main_program/general_pages/Accountant/InsertNewEmployee.dart';
import 'package:main_program/Accountant/SouventirSale.dart';
import 'general_pages/loading_after_login.dart';
import 'general_pages/login_page.dart';
import 'package:main_program/PR/PublishReviewedR.dart';

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
        '/login_page': (context) => InsertNewEmployee(),
      },
    );
  }
}
