import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:main_program/general_pages/Accountant/AccountantHome.dart';
import 'package:main_program/general_pages/Accountant/InsertNewEmployee.dart';
import 'general_pages/login_page.dart';
=======
import 'package:main_program/Accountant/InsertNewEmployee.dart';
import 'package:main_program/Accountant/SouventirSale.dart';
import 'Accountant/AccountantHome.dart';
import 'general_pages/loading_after_login.dart';
import 'general_pages/login_page.dart';
import 'member_view/member_home.dart';
import 'package:main_program/PR/PublishReviewedR.dart';
>>>>>>> Stashed changes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< Updated upstream
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => AccountantHome(),
=======
      initialRoute: '/accountant_home',
      routes: {
        '/login_page': (context) => const login_page(),
        '/loading_after_login': (context) => const loading_after_login(),
        '/member_home': (context) => const member_home(),
        '/accountant_home': (context) => SouvenirSale(),
>>>>>>> Stashed changes
      },
    );
  }
}
