import 'package:flutter/material.dart';
import 'package:main_program/data_holders.dart';
import '../controller.dart';

class showReviews extends StatelessWidget {
  final List<List<dynamic>> reviews;
  const showReviews({Key? key,
    required this.reviews
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                String name = reviews[index][0] + ' ' +
                reviews[index][1];
                String result = reviews[index][3];
                int progress = reviews[index][2];
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.reviews),
                        title: Text(name),
                        subtitle: Text(result),
                      ),
                    ],
                  ),
                );
              }),

    );
  }
}

class OpenArticle extends StatefulWidget {
  final resArticle article;

  const OpenArticle({Key? key, required this.article})
      : super(key: key);
  @override
  _OpenArticleState createState() => _OpenArticleState();
}

class _OpenArticleState extends State<OpenArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.article.header,
              style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            widget.article.content,
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
        child: Text('show reviews'),
        onPressed: () async {
          if (widget.article.reviews != 0) {
            Controller.getArtReviews(widget.article.id).then((value) {
              List<List<dynamic>> review = [];
              review = List<List<dynamic>>.from(value);
              for(dynamic item in value)
                {
                  review.add([value['Fname'], value['Lname'],
                    value['progress'], value['result']]);
                }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => showReviews(reviews: review)));
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No reviews to show!')),
            );
          }
        },
      ),
    );
  }
}
