import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'review_article.dart';
import 'write_article.dart';
import 'article_info.dart';
import '../data_holders.dart';
import '../controller.dart';

Widget ArticleCardGenerator(int rId, resArticle article, context, String help) {
  TextButton button;
  if (help == 'selfNF' || help == 'GenNF') {
    button = TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditArticle(rId: rId, currArticle: article)));
      },
      child: Column(
        children: [
          Text('${article.header}'),
          SizedBox(height: 8,),
          Text('${article.content}',
          maxLines: 2,)
        ],
      )
    );
  } else if (help == 'To_cont_review' || help == 'To_review') {
    button = TextButton(
      onPressed: () async {
      if(help == 'To_cont_review')
        {
          List<dynamic> prevRev = [];
          dynamic value = await Controller.getPrevReview(rId, article.id);
                if(value != null)
                {prevRev.add(value[0]['progress']);
                prevRev.add(value[0]['result']);}

                Navigator.push(
                    context,
                    MaterialPageRoute(

                        builder: (context) =>
                            ReviewArticle(rId: rId, currArticle: article, prevResult: prevRev[1], prevProg: prevRev[0])));
        }
      else{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ReviewArticle(rId: rId, currArticle: article, prevResult: null, prevProg: null)));
      }

      },
      child: Column(
        children: [
          Text('${article.header}'),
          SizedBox(height: 8,),
          Text('${article.content}',
            maxLines: 2,)
        ],
      ));
  }
  else {
    button = TextButton(
      onPressed: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OpenArticle(article: article)));
      },
      child: Column(
        children: [
          Text('${article.header}'),
          SizedBox(height: 8,),
          Text('${article.content}',
            maxLines: 2,),
          SizedBox(height: 8,),
          Text('views: ${article.views}',
            maxLines: 2,),
          SizedBox(height: 8,),
          Text('likes: ${article.likes}',
            maxLines: 2,)
        ],
      )
    );
  }
  return button;
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
        dynamic views;
        dynamic likes;
        dynamic reviews;
        arts = (map['selfNF'] != null) ? map['selfNF'] : [];
        for (dynamic art in arts) {
          if (art != null) {
            views = art['views_'] ?? 0;
            likes = art['likes'] ?? 0;
            reviews = art['reviews'] ?? 0;

            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], views, likes, reviews));
          }
        }
        allArticles['selfNF'] = temp;

        temp = [];

        arts = (map['GenNF'] != null) ? map['GenNF'] : [];
        for (dynamic art in arts) {
          if (art != null) {
            views = art['views_'] ?? 0;
            likes = art['likes'] ?? 0;
            reviews = art['reviews'] ?? 0;

            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], views, likes, reviews));
          }
        }
        allArticles['GenNF'] = temp;

        temp = [];
        arts = (map['P'] != null) ? map['P'] : [];

        for (dynamic art in arts) {
          if (art != null) {
            views = art['views_'] ?? 0;
            likes = art['likes'] ?? 0;
            reviews = art['reviews'] ?? 0;

            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], views, likes, reviews));
          }
        }
        allArticles['P'] = temp;
        temp = [];
        arts = (map['Own_reviewed'] != null) ? map['Own_reviewed'] : [];

        for (dynamic art in arts) {
          if (art != null) {
            views = art['views_'] ?? 0;
            likes = art['likes'] ?? 0;
            reviews = art['reviews'] ?? 0;

            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], views, likes, reviews));
          }
        }
        allArticles['Own_reviewed'] = temp;
        temp = [];
        arts = (map['To_cont_review'] != null) ? map['To_cont_review'] : [];

        for (dynamic art in arts) {
          if (art != null) {
            views = art['views_'] ?? 0;
            likes = art['likes'] ?? 0;
            reviews = art['reviews'] ?? 0;

            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], views, likes, reviews));
          }
        }
        allArticles['To_cont_review'] = temp;
        temp = [];
        arts = (map['To_review'] != null) ? map['To_review'] : [];

        for (dynamic art in arts) {
          if (art != null) {
            views = art['views_'] ?? 0;
            likes = art['likes'] ?? 0;
            reviews = art['reviews'] ?? 0;

            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], views, likes, reviews));
          }
        }
        allArticles['To_review'] = temp;
        temp = [];
        arts = (map['Gen'] != null) ? map['Gen'] : [];
        for (dynamic art in arts) {
          if (art != null) {
            views = art['views_'] ?? 0;
            likes = art['likes'] ?? 0;
            reviews = art['reviews'] ?? 0;

            temp.add(resArticle(art['ID'], art['state_'], art['content'],
                art['header'], views, likes, reviews));
          }
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
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: (allArticles['selfNF'] != null)
                    ? allArticles['selfNF']!.length
                    : 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ArticleCardGenerator(widget.rId,
                      allArticles['selfNF']![index], context, 'selfNF');
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
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: (allArticles['GenNF'] != null)
                    ? allArticles['GenNF']!.length
                    : 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ArticleCardGenerator(widget.rId,
                      allArticles['GenNF']![index], context, 'GenNF');
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const <Widget>[
              Text('To continue review...',
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
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: (allArticles['To_cont_review'] != null)
                    ? allArticles['To_cont_review']!.length
                    : 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  print(index);
                  return ArticleCardGenerator(
                      widget.rId,
                      allArticles['To_cont_review']![index],
                      context,
                      'To_cont_review');
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
              Icon(Icons.article_outlined),
            ]),
          ),
          SizedBox(
            height: 200,
            width: 150,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: (allArticles['To_review'] != null)
                    ? allArticles['To_review']!.length
                    : 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ArticleCardGenerator(widget.rId,
                      allArticles['To_review']![index], context, 'To_review');
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: const <Widget>[
              Text('Published 1-self...',
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
            child: GridView.builder(
                shrinkWrap: true,
                itemCount:
                    (allArticles['P'] != null) ? allArticles['P']!.length : 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ArticleCardGenerator(
                      widget.rId, allArticles['P']![index], context, 'P');
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
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: (allArticles['Gen'] != null)
                      ? allArticles['Gen']!.length
                      : 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ArticleCardGenerator(
                        widget.rId, allArticles['Gen']![index], context, 'Gen');
                  })),
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
