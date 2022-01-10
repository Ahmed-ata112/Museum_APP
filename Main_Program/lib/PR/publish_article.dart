import 'package:flutter/material.dart';
import 'package:main_program/controller.dart';

class publish_article extends StatefulWidget {
  final int S;
  const publish_article({Key? key, required this.S}) : super(key: key);

  @override
  publish_articleState createState() => publish_articleState(S);
}

class publish_articleState extends State<publish_article> {
  int S;
  Map<String, dynamic> FormData = {
    'ID': 0,
  };

  publish_articleState(this.S);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        //padding: EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Form(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Publish this article!",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            child: Text(
                              "Publish",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () async {
                              setState(() => FormData['ID'] = S);

                              Controller.UpdateArticleToP(FormData)
                                  .then((ReturnedList) {});
                            }),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
