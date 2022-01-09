import 'package:flutter/material.dart';
import 'package:main_program/Receptionist/Events_Tours.dart';
import 'package:main_program/Receptionist/Records_visitors.dart';
import 'package:main_program/Receptionist/Records_visitors.dart';
import 'package:main_program/Receptionist/Tracking_State.dart';

import '../data_holders.dart';


class Home_Receptionist extends StatefulWidget{
  @override
  State<Home_Receptionist> createState() => _Home_ReceptionistState();
}

class _Home_ReceptionistState extends State<Home_Receptionist> {
  // static String id='Receptionist_Home';
  late Staff st;
  @override
  Widget build (BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    st = arguments['staff'];
    return Scaffold(

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
        DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.teal,
        ),
        child: Stack(
          children: <Widget>[

            // Align(
            //   alignment: Alignment.topRight + Alignment(0, .4),
            //   child: Text(
            //     st.Fname + ' ' + st.Mname + ' ' + st.Lname,
            //     style: TextStyle(color: Colors.white, fontSize: 20.0),
            //   ),
            // ),
            Align(
              alignment: Alignment.centerRight + Alignment(0, .8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Padding(
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
      ),],),),

      body:ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Stack(
              children: <Widget>[
                const CircleAvatar(
                  backgroundImage: AssetImage('Images/receptionist.png'),
                  radius: 50,
                ),
                //SizedBox(height: 300),
                //Text('Functionalities'),
                Align(
                  alignment: Alignment.topRight + const Alignment(0, .8),
                  child: const Text(
                    'Receptionist',  //TODO : add the name of the user

                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],

            ), //,
          ),

          ListTile(
            title: const Text('Reception a Visitor'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Records_Visitors())

              );
              // Update the state of the app.
              // ...
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),//add border radius here
              child: Image.asset('Images/visitor.png'),//add image location here
            ),
          ),
          const SizedBox(height: 20,),
          ListTile(
            title: const Text('Events and Tours'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Events_Tours()));
              // Update the state of the app.
              // ...
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),//add border radius here
              child: Image.asset('Images/event_tour.png'),//add image location here
            ),
          ),
          const SizedBox(height: 20,),
          ListTile(
            title: const Text('Museum Current State'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>track_state()));
              // Update the state of the app.
              // ...
            },
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(1.0)),//add border radius here
              child: Image.asset('Images/museum.png'),//add image location here
            ),
          ),
        ],
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


