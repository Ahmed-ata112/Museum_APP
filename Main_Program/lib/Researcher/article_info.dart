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
        backgroundColor: Colors.amber,
        title: Text('Reviews',
        style: TextStyle(color: Colors.black),),
      ),
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                String name = reviews[index][0] + ' ' +
                reviews[index][1];
                String result = reviews[index][3];
                int progress = reviews[index][2];
                return Padding(padding: EdgeInsets.fromLTRB(8, 10, 8, 5),
                    child:
                    Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        iconColor: Colors.amber,
                        leading: Icon(Icons.reviews),
                        title: Text('Researcher name:', style: TextStyle(fontStyle: FontStyle.italic),),
                            subtitle: Text('$name',),),

                      Padding(padding: EdgeInsets.only(left: 10)
                        ,
                      child: Text('Progress:   $progress%', style: TextStyle(fontSize: 16),))
                      ,
                      Padding(padding: EdgeInsets.only(left: 10)
                        ,
                        child: Text('Result:', style: TextStyle(fontSize: 16),),),

                      Padding(padding: EdgeInsets.only(left: 10)
                        ,
                        child: Text('   $result', style: TextStyle(fontSize: 16),),)


                    ],
                  ),
                ));
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
        backgroundColor: Colors.amber,
        title: Text('View',
        style: TextStyle(color: Colors.black),),
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
        backgroundColor: Colors.amber,
        elevation: 5.0,
        child: Text('show reviews'
          ,textAlign: TextAlign.center,
            ),
        onPressed: () async {
          if (widget.article.reviews != 0) {
            Controller.getArtReviews(widget.article.id).then((value) {
             List<List<dynamic>> reviews = [];
             List<dynamic> review = [];
              //review = List<List<dynamic>>.from(value);
              for(dynamic item in value)
                {
                  if(item != null) {
                    review.add(item['Fname']);
                    review.add(item['Lname']);
                    review.add(item['progress']);
                    review.add(item['result']);
                    reviews.add(review);
                    print(review);
                  }}
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      showReviews(reviews: reviews)));
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
