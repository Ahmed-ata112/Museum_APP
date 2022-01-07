import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'review_article.dart';
import 'write_article.dart';
import 'article_info.dart';
import '../data_holders.dart';
import '../controller.dart';

Widget articleCardGenerator(int id)
{
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



class ArticlesHome extends StatefulWidget {
  final rId;
  const ArticlesHome({Key? key, this.rId}) : super(key: key);
  @override
  _ArticlesHomeState createState() => _ArticlesHomeState();
}

class _ArticlesHomeState extends State<ArticlesHome> {

  Map<String, List<resArticle>> allArticles = {'NF':[], 'P':[],
    'Own_reviewed':[]
    , 'To_cont_review':[], 'To_review':[]
    ,'Gen':[]};
  List<resArticle> temp = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getArtHomeArticles(widget.rId).then((map) {
      setState(() {
        List<dynamic> arts = map['NF'];
        for(dynamic art in arts) {
          temp.add(resArticle(
              art['ID'],
              art['state_'],
              art['content']
              ,
              art['header'],
              art['views_'],
              art['likes_']
              ,
              null
          ));
        }
        allArticles['NF'] = temp;

        temp = [];
        arts = map['P'];
        for(dynamic art in arts) {
          temp.add(resArticle(
              art['ID'],
              art['state_'],
              art['content']
              ,
              art['header'],
              art['views_'],
              art['likes_']
              ,
              art['reviews']
          ));
        }
          allArticles['P'] = temp;
          temp = [];
          arts = map['Own_reviewed'];

          for(dynamic art in arts) {
            temp.add(resArticle(
                art['ID'],
                art['state_'],
                art['content']
                ,
                art['header'],
                art['views_'],
                art['likes_']
                ,
                art['reviews']
            ));
          }
            allArticles['Own_reviewed'] = temp;
            temp = [];
            arts = map['To_cont_review'];
            for(dynamic art in arts) {
              temp.add(resArticle(
                  art['ID'],
                  art['state_'],
                  art['content']
                  ,
                  art['header'],
                  art['views_'],
                  art['likes_']
                  ,
                  art['reviews']
              ));
            }
              allArticles['To_cont_review'] = temp;
              temp = [];
              arts = map['To_review'];
              for(dynamic art in arts) {
                temp.add(resArticle(
                    art['ID'],
                    art['state_'],
                    art['content']
                    ,
                    art['header'],
                    art['views_'],
                    art['likes_']
                    ,
                    art['reviews']
                ));
              }
              allArticles['To_review'] = temp;
              temp = [];
              arts = map['Gen'];
              for(dynamic art in arts) {
                temp.add(resArticle(
                    art['ID'],
                    art['state_'],
                    art['content']
                    ,
                    art['header'],
                    art['views_'],
                    art['likes_']
                    ,
                    art['reviews']
                ));
              }
              allArticles['Gen'] = temp;
              temp = [];
        setState(() {}); //just call it to update screen
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Articles'
          , style: TextStyle(color: Colors.black),
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
              itemCount: allArticles['NF'] != null?
              allArticles['NF']!.length : 0,
              itemBuilder: (context,index){
                return TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditArticle(allArticles['NF'][index])));}
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: const <Widget>[
            Text('Others...',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Icon(Icons.article_outlined),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OpenArticle()));}
                    , child: articleCardGenerator(index));
              }),
        ),

      ],)
      ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewArticle()));
        },
        child: const Icon(
          Icons.note_add_outlined,
          color: Colors.black,
        ),
      ),
      //floatingActionButtonLocation: ,
    );
  }
}
