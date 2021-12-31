import 'package:flutter/material.dart';
import 'package:main_program/Accountant/GivePromotion.dart';
import 'package:main_program/Accountant/InsertNewEmployee.dart';
class AccountantHome extends StatelessWidget{
  static String id='AccountantHome';
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer:Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Insert a new employee'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InsertNewEmployee())

                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Give Promotion'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GivePromotion()));
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}