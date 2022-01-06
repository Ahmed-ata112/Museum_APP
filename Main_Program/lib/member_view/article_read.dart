import 'package:flutter/material.dart';
import '../data_holders.dart';
import 'add_feedback.dart';

class article_read extends StatefulWidget {
  final Article article;
  const article_read({Key? key, required this.article}) : super(key: key);

  @override
  _article_readState createState() => _article_readState(article);
}

class _article_readState extends State<article_read> {
  final Article article;
  _article_readState(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
            child: Image.network(
              'http://placekitten.com/g/400/400',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              article.header,
              style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            article.content,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        elevation: 5.0,
        child: Icon(Icons.feedback),
        onPressed: () async {
          //An Alert Dialog
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return Add_Feedback(article: article);
              }).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
