import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'review_article.dart';
import 'write_article.dart';
import 'article_info.dart';
import '../data_holders.dart';
import '../controller.dart';

Widget ArticleCardGenerator(int rId, resArticle article, context, String help) {
  return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            EditArticle(rId: rId, currArticle: article)));
      },
      child: GFCard(
          content: Padding(
              padding: const EdgeInsets.only(top: 85),
              child: Container(
                height: 30,
                color: Colors.black12,
                child: Center(
                  child: Text(
                    'article id: ${article.id}',
                    style: TextStyle(fontSize: 14, color: Colors.blue[900]),
                  ),
                ),
              ))));
}

class ArticlesHome extends StatefulWidget {
  final rId;
  const ArticlesHome({Key? key, this.rId}) : super(key: key);
  @override
  _ArticlesHomeState createState() => _ArticlesHomeState();
}

class _ArticlesHomeState extends State<ArticlesHome> {
  Map<String, List<resArticle>> allArticles = {};
  List<resArticle> temp = [];
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getArtHomeArticles(widget.rId).then((map) {
      setState(() {
        List<dynamic> arts;
        arts = (map['selfNF'] != null) ? map['selfNF'] : [];
        for (dynamic art in arts) {
          if (art != null)
            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], art['views_'], art['likes_'], null, art['writers']));
        }
        allArticles['selfNF'] = temp;

        temp = [];
        arts = (map['P'] != null) ? map['P'] : [];

        for (dynamic art in arts) {
          if (art != null)
            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], art['views_'], art['likes_'], art['reviews'], art['writers']));
        }
        allArticles['P'] = temp;
        temp = [];
        arts = (map['Own_reviewed'] != null) ? map['Own_reviewed'] : [];

        for (dynamic art in arts) {
          if (art != null)
            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], art['views_'], art['likes_'], art['reviews'], art['writers']));
        }
        allArticles['Own_reviewed'] = temp;
        temp = [];
        arts = (map['To_cont_review'] != null) ? map['To_cont_review'] : [];

        for (dynamic art in arts) {
          if (art != null)
            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], art['views_'], art['likes_'], art['reviews'], art['writers']));
        }
        allArticles['To_cont_review'] = temp;
        temp = [];
        arts = (map['To_review'] != null) ? map['To_review'] : [];

        for (dynamic art in arts) {
          if (art != null)
            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], art['views_'], art['likes_'], art['reviews'], art['writers']));
        }
        allArticles['To_review'] = temp;
        temp = [];
        arts = (map['Gen'] != null) ? map['Gen'] : [];
        for (dynamic art in arts) {
          if (art != null)
            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], art['views_'], art['likes_'], art['reviews'], art['writers']));
        }
        allArticles['Gen'] = temp;
        temp = [];
        setState(() {}); //just call it to update screen
      });
      print(allArticles);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(allArticles);
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Articles',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const <Widget>[
              Text("Incomplete Work...",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Icon(Icons.drive_file_rename_outline),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const <Widget>[
              Text("Previously contributed...",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14)),
            ]),
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: (allArticles['selfNF'] != null)
                    ? allArticles['selfNF']!.length
                    : 0,
                itemBuilder: (context, index) {
                  return ArticleCardGenerator(widget.rId, allArticles['selfNF']![index], context, 'selfNF');
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const <Widget>[
              Text("Suggested to contribute...",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14)),
            ]),
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: (allArticles['GenNF'] != null)
                    ? allArticles['GenNF']!.length
                    : 0,
                itemBuilder: (context, index) {
                  return Text('$index');//ArticleCardGenerator(index, context, 'GenNF');
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
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewArticle()));
                      },
                      child: Text('$index'));//ArticleCardGenerator(index, context, 'ToReview'));
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
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OpenArticle()));
                      },
                      child: Text('$index')); //ArticleCardGenerator(index, context, 'Gen'));
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewArticle(
                        rId: widget.rId,
                      )));
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
