import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'tour_info.dart';

Widget tourCard(index, context) {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.start,
    showOverlayImage: true,
    imageOverlay: NetworkImage('https://via.placeholder.com/150/FFFFFF/FFFFFF'),
    title: GFListTile(
      avatar: GFAvatar(shape: GFAvatarShape.standard),
      titleText: 'tour NAME',
      subTitleText: 'Date',
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
            "Some quicsssssssk example text to build on thecard Somesad quick example text to build on the card Some quick example text to build on the card"),
      ],
    ),
    buttonBar: GFButtonBar(
      children: <Widget>[
        GFButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => tours_info()));
          },
          text: "More info",
          blockButton: true,
        ),
      ],
    ),
  );
}

class toursHome extends StatefulWidget {
  const toursHome({Key? key}) : super(key: key);

  @override
  _toursHomeState createState() => _toursHomeState();
}

class _toursHomeState extends State<toursHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available tours"),
      ),
      body: ListView.builder(
        itemCount: 5, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return tourCard(index, context);
        },
      ),
    );
  }
}
