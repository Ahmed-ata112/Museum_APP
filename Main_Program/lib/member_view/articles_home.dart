import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../controller.dart';
import '../data_holders.dart';
import 'article_read.dart';

//row
Widget articleCard(Article art, context) {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.start,
    showOverlayImage: true,
    imageOverlay:
        const NetworkImage('https://via.placeholder.com/150/FFFFFF/FFFFFF'),
    title: GFListTile(
      // avatar: GFAvatar(),
      titleText: art.header,

      //subTitleText: 'Auther name',
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('likes: ${art.likes}',
                style: TextStyle(color: Colors.green[400], fontSize: 16)),
            Text('views: ${art.views}',
                style: TextStyle(color: Colors.green[400], fontSize: 16))
            // GFRating(
            //   value: 3.5,
            //   onChanged: (rating) {},
            // )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          art.content,
          maxLines: 4,
        ),
      ],
    ),
    buttonBar: GFButtonBar(
      children: <Widget>[
        GFButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => article_read(
                          article: art,
                        )));
          },
          text: "Read",
          blockButton: true,
        ),
      ],
    ),
  );
}

class ArticlesHome extends StatefulWidget {
  final int Member_id;
  const ArticlesHome({Key? key, required this.Member_id}) : super(key: key);
  @override
  _ArticlesHomeState createState() => _ArticlesHomeState(Member_id);
}

class _ArticlesHomeState extends State<ArticlesHome> {
  final int Member_id;
  _ArticlesHomeState(this.Member_id);
  List<Article> allArticles = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getAllArticles().then((ListOfArticlesRows) {
      setState(() {
        for (var row in ListOfArticlesRows) {
          Article article = Article(
              row[0], row[1], row[2], row[3], row[4], row[5], Member_id);
          allArticles.add(article);
        }
        setState(() {}); //just call it to update screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available articles"),
      ),
      body: ListView.builder(
        itemCount: allArticles.length, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return articleCard(allArticles[index], context);
        },
      ),
    );
  }
}
