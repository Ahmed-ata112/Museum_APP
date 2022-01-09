import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:main_program/Researcher/review_article.dart';
import 'package:main_program/Researcher/sessions_home.dart';
import 'articles_home.dart';
import 'write_article.dart';
import 'package:main_program/data_holders.dart';
import '../controller.dart';

Widget articleCardGenerator(int id) {
  //get article info from controller.

  return GFCard(
      content: Padding(
          padding: const EdgeInsets.only(top: 85),
          child: Container(
            height: 30,
            color: Colors.black12,
            child: Center(
              child: Text(
                'article id: $id',
                style: TextStyle(fontSize: 14, color: Colors.blue[900]),
              ),
            ),
          )));
}

class ResearcherHome extends StatefulWidget {
  const ResearcherHome({Key? key}) : super(key: key);

  @override
  _ResearcherHomeState createState() => _ResearcherHomeState();
}

class _ResearcherHomeState extends State<ResearcherHome> {

  late Researcher res;
  @override
  Widget build(BuildContext context)
  {
  final arguments = ModalRoute.of(context)!.settings.arguments as Map;
  res = arguments['researcher'];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
               DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Stack(
                  children: <Widget>[

                    Align(
                      alignment: Alignment.topLeft + Alignment(0, 0),
                      child: Text('Name: ' +
                        res.fName + ' ' + res.lName,
                        style: TextStyle(fontStyle: FontStyle.italic,
                            color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft + Alignment(0, 0),
                      child: Text('Birthdate: ' +
                          res.birthday,
                        style: TextStyle(fontStyle: FontStyle.italic,
                            color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft + Alignment(0, 0),
                      child: Text('Years of experience: ' +
                          (res.yearsExpert).toString() + ' years',
                        style: TextStyle(fontStyle: FontStyle.italic,
                            color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              focusColor: Colors.amber,
              title: const Text('sessions'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SessionsHome(rId: res.id)));
              },
            ),
            ListTile(
              title: const Text('articles'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArticlesHome(rId: res.id)));
              },
            ),
          ],
        ));
  }
}
