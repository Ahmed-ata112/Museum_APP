import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:main_program/PR/articleRead_pr.dart';
import 'package:main_program/PR/available_articles.dart';
import 'package:main_program/PR/add_tour.dart';
import 'package:main_program/PR/add_event.dart';
import 'articleRead_pr.dart';
import 'package:main_program/controller.dart';
import 'package:main_program/data_holders.dart';
import'package:main_program/Accountant/change_password.dart';
import 'package:main_program/general_pages/login_page.dart';

Widget articleCard(index, context, article S) {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.start,
    showOverlayImage: true,
    imageOverlay: NetworkImage('https://via.placeholder.com/150/FFFFFF/FFFFFF'),
    title: GFListTile(
      avatar: GFAvatar(),
      titleText: 'ID : ${S.ID.toString()}',
      //subTitleText: 'S.ID',
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.header),
      ],
    ),
    buttonBar: GFButtonBar(
      children: <Widget>[
        GFButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => article_read_pr(S: S)));
          },
          text: "Read",
          blockButton: true,
        ),
      ],
    ),
  );
}

class available_articles extends StatefulWidget {
  const available_articles({Key? key}) : super(key: key);

  @override
  _ArticlesHomePRState createState() => _ArticlesHomePRState();
}

class _ArticlesHomePRState extends State<available_articles> {
  List<article> S = [];
  void initState() {
    super.initState();
    Controller.getReviewedArticles().then((ReturnedList) {
      print(ReturnedList[0]);
      setState(() {
        for (var row in ReturnedList) {
          article e = article(row[0], row[1], row[3], row[4], row[5], row[6]);
          print('aaaaaaaaaaaaaa');
          S.add(e);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available articles"),
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
                      'PR',
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
              title: const Text('Articles'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => available_articles()));
              },
            ),
            ListTile(
              title: const Text('Add Events'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewEvent()));
              },
            ),
            ListTile(
              title: const Text('Add Tours'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewTour()));
              },
            ),
            ListTile(
              title: const Text('Change Password'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => changePasswordAcc(username:'username')));
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
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
      body: ListView.builder(
        itemCount: S.length, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return articleCard(index, context, S[index]);
        },
      ),
    );
  }
}
