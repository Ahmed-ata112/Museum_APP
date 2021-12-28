import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:main_program/Researcher/review_article.dart';
import 'package:main_program/Researcher/sessions_home.dart';
import 'articles_home.dart';
import 'write_article.dart';

Widget articleCardGenerator(int id)
{
  //get article info from controller.

  return GFCard(
      content:
      Padding(padding: const EdgeInsets.only(top: 85),
          child: Container(
            height: 30,
            color: Colors.black12,
            child: Center(child: Text('article id: $id',
            style: TextStyle(fontSize: 14,
            color: Colors.blue[900]),),),
            )
      )

  );
}
class ResearcherHome extends StatefulWidget {
  const ResearcherHome({Key? key}) : super(key: key);

  @override
  _ResearcherHomeState createState() => _ResearcherHomeState();
}

class _ResearcherHomeState extends State<ResearcherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration:
              BoxDecoration(
                color: Colors.amber,
              ),
              child:
              Text(
              'Researcher Info'
            ),
            ),
            ListTile(
              iconColor: Colors.amber,
              title: const Text('sessions'),
              onTap:
                  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SessionsHome()));
              },
            ),
            ListTile(
              title: const Text('articles'),
              onTap:
                  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArticlesHome()));
              },
            ),

          ],
        ),
      ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const <Widget>[
              Text('Continue Work...',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Icon(Icons.drive_file_rename_outline),
            ]),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){
                  return TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditArticle()));}
                  , child: articleCardGenerator(index));
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const <Widget>[
              Text('To review...',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Icon(Icons.rate_review_outlined),
            ]),
          ),
          SizedBox(
            height: 200,
            width: 150,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){
                  return TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewArticle()));}
                      , child: articleCardGenerator(index));
                }),
          ),
          SizedBox(
            height: 200,
            width: 150,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){
                  return articleCardGenerator(index);
                }),
          ),
          SizedBox(
            height: 200,
            width: 150,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){
                  return articleCardGenerator(index);
                }),
          ),
        ],)

      );
  }
}
