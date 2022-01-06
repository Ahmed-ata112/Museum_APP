import 'package:flutter/material.dart';
import 'package:main_program/Accountant/Souvenir.dart';
import 'package:main_program/Accountant/InsertNewEmployee.dart';
import'package:main_program/Accountant/GivePromotion.dart';
import'package:main_program/controller.dart';

class SouvenirSale extends StatefulWidget {
  const SouvenirSale({Key? key}) : super(key: key);

  @override
  SouvenirSaleState createState() => SouvenirSaleState();
}

class SouvenirSaleState extends State<SouvenirSale> {
  @override
  List data=[];
  void initState(){
    super.initState();
    (()async{
      data=await Controller.getSouvenirSale();
    })();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Souvenir Sale"),
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
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage:
                      NetworkImage(''),
                      radius: 50.0,
                    ),
                  ),
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
              title: const Text('Souvenirs Sale'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SouvenirSale()));
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
      body: Container(
         child: ListView.builder(
           itemCount: 5, // should be dynamic -> retrieve articles
           itemBuilder: (context, index) {
             return Souvenirs_Card();
           },
         ),
    ),
    );
          }
  }
