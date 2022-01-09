import 'package:flutter/material.dart';
import 'publish_article.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:main_program/data_holders.dart';
String ss = lorem(words: 1000);

class article_read_pr extends StatefulWidget {
  final article S;
  const article_read_pr({Key? key,required this.S}) : super(key: key);

  @override
  _article_readState createState() => _article_readState(S);
}

class _article_readState extends State<article_read_pr> {
  article S;
  _article_readState(this.S);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.header),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),

            ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              S.header,
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            S.content,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[300],
        elevation: 5.0,
        child: Icon(Icons.publish),
        onPressed: () async {
          //An Alert Dialog
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return publish_article(S:S.ID);
              }).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
