import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:main_program/Accountant/souvenirsale_member_edition.dart';
import 'package:main_program/controller.dart';
import 'package:main_program/Accountant/Souvenir.dart';
import 'package:main_program/Accountant/souventir_sale.dart';
import 'package:main_program/Accountant/insert_new_employee.dart';
import 'package:main_program/Accountant/give_promotion.dart';
import'package:main_program/general_pages/login_page.dart';
import 'package:main_program/Accountant/change_password.dart';
class accHome extends StatefulWidget {
  final String username;
  const accHome({Key? key, required this.username}) : super(key: key);

  @override
  _accHomeState createState() => _accHomeState(username);
}

class _accHomeState extends State<accHome> {
  late String username;
  _accHomeState(this.username);
  @override
  List<Souvenir> S = [];
  List<Souvenir> SV = [];
  void initState() {
    super.initState();
    Controller.getSouvenirSale().then((ReturnedList) {
      print(ReturnedList[0]);
      setState(() {
        for (var row in ReturnedList) {
          Souvenir e = Souvenir('sName', 1, row[0], row[1]);
          print(e);
          S.add(e);
        }
      });
    });
    Controller.getSouvenirSale_visitor().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
          Souvenir e = Souvenir('sName', 1, row[0], row[1]);
          print(e);
          SV.add(e);
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text("Welcome"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight + Alignment(0, .4),
                    child: Text(
                      'USER NAME',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Accountant',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Verified',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Souvenirs Sale by visitors'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SouvenirSale(S: S)));
              },
            ),
            ListTile(
              title: const Text('Souvenirs Sale by members'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SouvenirSale_member_edition(S: SV)));
              },
            ),
            ListTile(
              title: const Text('Add Employee'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewEmployee()));
              },
            ),
            ListTile(
              title: const Text('Give Promotion'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GivePromo()));
              },
            ),
            ListTile(
              title: const Text('change password'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => changePasswordAcc(username:username)));
              },
            ),
            ListTile(
              title: const Text('Sign out'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => login_page()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
