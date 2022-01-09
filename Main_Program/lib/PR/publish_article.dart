import 'package:flutter/material.dart';

class publish_article extends StatefulWidget {
  const publish_article({Key? key}) : super(key: key);

  @override
  _Add_FeedbackState createState() => _Add_FeedbackState();
}

class _Add_FeedbackState extends State<publish_article> {
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
                            onPressed: () async {}),
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
