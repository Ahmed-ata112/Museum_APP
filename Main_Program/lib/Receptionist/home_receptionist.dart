import 'package:flutter/material.dart';
import 'package:main_program/Accountant/change_password.dart';
import 'package:main_program/Receptionist/Events_Tours.dart';
import 'package:main_program/Receptionist/Records_visitors.dart';
import 'package:main_program/Receptionist/Records_visitors.dart';
import 'package:main_program/Receptionist/Tracking_State.dart';
import 'package:main_program/general_pages/login_page.dart';

class Home_Receptionist extends StatefulWidget {
  final String username;
  const Home_Receptionist({Key? key, required this.username}) : super(key: key);

  @override
  _Home_ReceptionistState createState() => _Home_ReceptionistState(username);
}

class _Home_ReceptionistState extends State<Home_Receptionist> {
  late String username;
  _Home_ReceptionistState(this.username);
  // static String id='Receptionist_Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('Images/receptionist.png'),
                    radius: 50,
                  ),
                  //SizedBox(height: 300),
                  //Text('Functionalities'),
                  Align(
                    alignment: Alignment.topRight + Alignment(0, .8),
                    child: Text(
                      'Receptionist', //TODO : add the name of the user

                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ],
              ), //,
            ),
            ListTile(
              title: const Text('Reception a Visitor'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Records_Visitors()));
                // Update the state of the app.
                // ...
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(1.0)), //add border radius here
                child:
                    Image.asset('Images/visitor.png'), //add image location here
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Events and Tours'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Events_Tours()));
                // Update the state of the app.
                // ...
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(1.0)), //add border radius here
                child: Image.asset(
                    'Images/event_tour.png'), //add image location here
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Museum Current State'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => track_state()));
                // Update the state of the app.
                // ...
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(1.0)), //add border radius here
                child:
                    Image.asset('Images/museum.png'), //add image location here
              ),
            ),
            ListTile(
              title: const Text('Change password'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        changePasswordAcc(username: username)));
                // Update the state of the app.
                // ...
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(1.0)), //add border radius here
                //child: Image.asset('Images/museum.png'),//add image location here
              ),
            ),
            ListTile(
              title: const Text('Sign out'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => login_page()));
                // Update the state of the app.
                // ...
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(1.0)), //add border radius here
                //child: Image.asset('Images/museum.png'),//add image location here
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';


class Home_Receptionist extends StatefulWidget {
  const Home_Receptionist({Key? key}) : super(key: key);

  @override
  _Home_ReceptionistState createState() => _Home_ReceptionistState();
}

class _Home_ReceptionistState extends State<Home_Receptionist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('')
    );
  }
}
*/
