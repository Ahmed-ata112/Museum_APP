import 'package:flutter/material.dart';
import 'package:main_program/general_pages/confirm_signout.dart';
import 'package:main_program/member_view/store_home.dart';
import 'package:main_program/member_view/tours_home.dart';
import '../controller.dart';
import 'articles_home.dart';
import 'events_home.dart';
import 'package:main_program/data_holders.dart';

class member_home extends StatefulWidget {
  const member_home({Key? key}) : super(key: key);

  @override
  _member_homeState createState() => _member_homeState();
}

class _member_homeState extends State<member_home> {
  late Member mem;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    mem = arguments['member'];
    //print(mem.birthday);
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.teal,
                ),
                child: Stack(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage('http://placekitten.com/300/300'),
                        radius: 50.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight + Alignment(0, .4),
                      child: Text(
                        mem.Fname + ' ' + mem.Sname,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
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
              ),
              ListTile(
                title: const Text('Articles'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticlesHome(
                                Member_id: mem.id,
                              )));
                },
              ),
              ListTile(
                title: const Text('Available Events'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventsHome(
                                Member_id: mem.id,
                              )));
                },
              ),
              ListTile(
                title: const Text('Available Tours'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => toursHome(
                                Member_id: mem.id,
                              )));
                },
              ),
              ListTile(
                title: const Text('Store'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StoreHome(
                                Member_id: mem.id,
                              )));
                },
              ),
              ListTile(
                title: const Text('Sign out'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CONFIRMORNOT()));
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider())),
                Text("Favorite Artworks", style: TextStyle(fontSize: 20)),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider())),
              ]),
            ),
            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              physics:
                  NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true, // You won't see infinite size erro
              // Generate 100 widgets that display their index in the List.
              children: List.generate(7, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider())),
                Text("Favorite exhibitions.", style: TextStyle(fontSize: 20)),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider())),
              ]),
            ),
            GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              physics:
                  NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true, // You won't see infinite size erro
              // Generate 100 widgets that display their index in the List.
              children: List.generate(3, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                  ),
                );
              }),
            ),
          ],
        ));
  }
}
