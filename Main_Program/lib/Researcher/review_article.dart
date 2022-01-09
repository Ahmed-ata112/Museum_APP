import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../controller.dart';
import '../data_holders.dart';

class Add_review extends StatefulWidget {
  final rId;
  final resArticle article;
  final prevProg;
  final prevResult;
  const Add_review(
      {Key? key,
      required this.rId,
      required this.article,
      this.prevProg,
      this.prevResult})
      : super(key: key);

  @override
  _Add_reviewState createState() =>
      _Add_reviewState(prevProg, prevResult, rId, article.id);
}

class _Add_reviewState extends State<Add_review> {
  @override
  late int progress;
  late String result;
  final int articleId;
  final int rID;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  _Add_reviewState(this.progress, this.result, this.rID, this.articleId);

  Widget build(BuildContext context) {
    Map<String, dynamic> formData = {
      'progress': 0,
      'result': '',
      'rId': rID,
      'articleId': articleId,
    };
    String error = '';
    return AlertDialog(
      content: Container(
        //padding: EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "record your review",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  //Name
                  Text(
                    "Progress",
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
                      initialRating: ((progress / 100) * 5).toDouble(),
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      //itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.trending_up_outlined,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        formData['progress'] = ((rating / 5) * 100).toInt();
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: result,
                    maxLines: null, // makes it long if needed
                    decoration: const InputDecoration(
                      hintText: "your result",
                      icon: Icon(Icons.drive_file_rename_outline),
                      // to make it multi line
                    ),
                    onChanged: (val) {
                      formData['result'] = val;
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
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Controller.addReview(formData).then((value) {
                                  print(value);
                                  if (value == 1) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Review is added successfully')),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Something went wrong!')),
                                    );
                                    setState(() {});
                                  }
                                });
                              }
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

class ReviewArticle extends StatefulWidget {
  final prevProg;
  final prevResult;
  final resArticle currArticle;
  final rId;
  const ReviewArticle(
      {Key? key,
      this.rId,
      required this.currArticle,
      this.prevProg,
      this.prevResult})
      : super(key: key);

  @override
  ReviewArticleState createState() => ReviewArticleState();
}

class ReviewArticleState extends State<ReviewArticle> {
  @override
  Widget build(BuildContext context) {
    final prevProg = widget.prevProg ?? 0;
    final String prevRes = widget.prevResult ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.currArticle.header,
              style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            widget.currArticle.content,
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
        child: Icon(
          Icons.rate_review_outlined,
        ),
        onPressed: () async {
          //An Alert Dialog
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return Add_review(
                    article: widget.currArticle,
                    rId: widget.rId,
                    prevProg: prevProg,
                    prevResult: prevRes);
              }).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
