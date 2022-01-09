import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:main_program/Accountant/SouvenirSale_member_edition.dart';
import 'package:main_program/controller.dart';
import 'package:main_program/Accountant/Souvenir.dart';
import 'package:main_program/Accountant/SouventirSale.dart';
import'package:main_program/Accountant/InsertNewEmployee.dart';
import 'package:main_program/Accountant/GivePromotion.dart';

class accHome extends StatefulWidget {
  const accHome({Key? key}) : super(key: key);

  @override
  accHomeState createState() => accHomeState();
}

class accHomeState extends State<accHome> {
  @override
  List<Souvenir> S=[];
  List<Souvenir> SV=[];
  void initState() {
    super.initState();
    Controller.getSouvenirSale().then((ReturnedList) {
      print(ReturnedList[0]);
      setState(() {
        for (var row in ReturnedList) {
          Souvenir e= Souvenir('sName', 1, row['So_ID'], row['quantity']);
          print (e);
          S.add(e);
        }

      });
    });
    Controller.getSouvenirSale_visitor().then((ReturnedList) {
      print(ReturnedList[0]);
      setState(() {
        for (var row in ReturnedList) {
          Souvenir e= Souvenir('sName', 1, row['So_ID'], row['quantity']);
          print (e);
          SV.add(e);
        }
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Home Page',
        style: TextStyle(
        color: Colors.black
    ),),
    ),
    body: Center(
    child:Text("Welcome"),),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SouvenirSale(S:S)));
              },
            ),
            ListTile(
              title: const Text('Souvenirs Sale by members'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SouvenirSale_member_edition(S:SV)));
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
          ],
        ),
      ),
    );
}
}