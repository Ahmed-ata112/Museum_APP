import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../controller.dart';
import '../data_holders.dart';

class Add_Feedback extends StatefulWidget {
  final Article article;
  const Add_Feedback({Key? key, required this.article}) : super(key: key);

  @override
  _Add_FeedbackState createState() => _Add_FeedbackState(article);
}

class _Add_FeedbackState extends State<Add_Feedback> {
  late Article article;
  _Add_FeedbackState(this.article);
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> formData = {
      'rating': 0.0,
      'comment': '',
      'article_id': article.id,
      'member_id': article.Member_ID
    };
    String error = '';
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
                  const Text(
                    "Add a Feedback!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  //Name
                  Text(
                    "your Rating!",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  Center(
                    child: RatingBar.builder(
                      itemSize: 40,
                      wrapAlignment: WrapAlignment.spaceEvenly,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      //itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        formData['rating'] = rating;
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  //Email

                  const SizedBox(height: 20.0),
                  //Phone Number
                  const SizedBox(height: 20.0),
                  TextFormField(
                    maxLines: null, // makes it long if needed
                    decoration: const InputDecoration(
                      hintText: "your opinion",
                      icon: Icon(Icons.drive_file_rename_outline),
                      // to make it multi line
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      formData['comment'] = val;
                    },
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            child: const Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () async {
                              Controller.addNewArticleFeedback(formData)
                                  .then((value) {
                                print(value);
                                if (value != -1)
                                  Navigator.pop(context);
                                else {
                                  setState(() {
                                    error = 'you inserted a feedback before';
                                  });
                                }
                                return null;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            child: const Text(
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
                  Text(
                    error,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: error.isEmpty ? 0.0 : 14.0),
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
