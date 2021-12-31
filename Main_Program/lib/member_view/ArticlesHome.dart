import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'articleRead.dart';

Widget articleCard(index, context) {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.start,
    showOverlayImage: true,
    imageOverlay: NetworkImage('https://via.placeholder.com/150/FFFFFF/FFFFFF'),
    title: GFListTile(
      avatar: GFAvatar(),
      titleText: 'Article NAME',
      subTitleText: 'Auther name',
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text('Rating', style: TextStyle(color: Colors.green[400])),
            SizedBox(
              width: 15,
            ),
            GFRating(
              value: 3.5,
              onChanged: (rating) {},
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text(
            "Some quicsssssssk example text to build on thecard Somesad quick example text to build on the card Some quick example text to build on the card"),
      ],
    ),
    buttonBar: GFButtonBar(
      children: <Widget>[
        GFButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => article_read()));
          },
          text: "Read",
          blockButton: true,
        ),
      ],
    ),
  );
}

class ArticlesHome extends StatefulWidget {
  const ArticlesHome({Key? key}) : super(key: key);

  @override
  _ArticlesHomeState createState() => _ArticlesHomeState();
}

class _ArticlesHomeState extends State<ArticlesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available articles"),
      ),
      body: ListView.builder(
        itemCount: 5, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return articleCard(index, context);
        },
      ),
    );
  }
}
