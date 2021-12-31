import 'package:flutter/material.dart';

class OpenArticle extends StatefulWidget {
  const OpenArticle({Key? key}) : super(key: key);

  @override
  _OpenArticleState createState() => _OpenArticleState();
}

class _OpenArticleState extends State<OpenArticle> {
  late bool _review;
  late bool _own;
  late bool _finished;

  Widget buildOpenArticle()
  {
    //if(_review)
      return buildReviewArticle();
    /*else if(_own && !_finished)
      return buildEditArticle();
    return buildGeneralArticle();*/
  }
  Widget buildGeneralArticle()
  {
    return const Text('/review_article');
  }
  void buildEditArticle()
  {

  }
  Widget buildReviewArticle()
  {
    return const Text('/review_article');
  }

  @override
  Widget build(BuildContext context) {

    return buildOpenArticle();
  }
}