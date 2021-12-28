import 'package:flutter/material.dart';

class ReviewArticle extends StatefulWidget {
  const ReviewArticle({Key? key}) : super(key: key);

  @override
  ReviewArticleState createState() => ReviewArticleState();
}

class ReviewArticleState extends State<ReviewArticle> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(
                Icons.trending_up_outlined,
                color: Colors.black,),
              tooltip: 'progress',
              onPressed: (){
                //code to execute when this button is pressed
              }
          ),
          IconButton(
              icon: const Icon(
                Icons.rate_review_outlined,
                color: Colors.black,),
              tooltip: 'result',
              onPressed: (){
                //code to execute when this button is pressed
              }
          ),
        ],
        backgroundColor: Colors.amber,
        title: const Text('article header',
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),

    );
  }
}
