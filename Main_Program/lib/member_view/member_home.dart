import 'package:flutter/material.dart';
import 'package:main_program/member_view/store_home.dart';
import 'package:main_program/member_view/tours_home.dart';
import 'articles_home.dart';
import 'events_home.dart';
import 'package:main_program/data_holders.dart';

Widget signout(BuildContext context) {
  return AlertDialog(
    content: Container(
      //padding: EdgeInsets.all(3.0),
      child: SingleChildScrollView(
        child: Form(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Are you sure you want to sign out?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 20.0),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          child: const Text(
                            "Confirm",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          onPressed: () async {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login_page', (route) => false);
                          }),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          child: const Text(
                            "Cancel",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

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
              title: const Text('Change password'),
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
              title: const Text(
                'Sign out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                createAlterDialog(BuildContext context) {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return signout(context);
                      });
                }

                createAlterDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Welcome " + mem.Fname,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
