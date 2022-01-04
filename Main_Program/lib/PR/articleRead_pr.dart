import 'package:flutter/material.dart';
import 'publish_article.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

String ss = lorem(words: 1000);

class article_read_pr extends StatefulWidget {
  const article_read_pr({Key? key}) : super(key: key);

  @override
  _article_readState createState() => _article_readState();
}

class _article_readState extends State<article_read_pr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('an article'),
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
              "Some Heading Text",
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            ss,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[300],
        elevation: 5.0,
        child: Icon(Icons.publish),
        onPressed: () async {
          //An Alert Dialog
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return publish_article();
              }).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
