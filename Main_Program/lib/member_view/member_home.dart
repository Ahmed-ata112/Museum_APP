import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'ArticlesHome.dart';

class member_home extends StatefulWidget {
  const member_home({Key? key}) : super(key: key);

  @override
  _member_homeState createState() => _member_homeState();
}

class _member_homeState extends State<member_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
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
                        'USER NAME',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, .2),
                      child: Text(
                        'USER JOB',
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
                title: const Text('Favorites'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Articles'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ArticlesHome()));
                },
              ),
              ListTile(
                title: const Text('Available Events'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Available Tours'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Store'),
                onTap: () {
                  // Update the state of the app.
                  // ...
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
