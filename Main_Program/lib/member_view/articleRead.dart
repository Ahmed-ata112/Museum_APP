import 'package:flutter/material.dart';

import 'add_feedback.dart';

class article_read extends StatefulWidget {
  const article_read({Key? key}) : super(key: key);

  @override
  _article_readState createState() => _article_readState();
}

class _article_readState extends State<article_read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('an article'),
        centerTitle: true,
      ),
      body: Text('an article'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        elevation: 5.0,
        child: Icon(Icons.feedback),
        onPressed: () async {
          //An Alert Dialog
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return Add_Feedback();
              }).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
