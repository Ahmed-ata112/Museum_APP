import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'event_info.dart';

Widget eventCard(index, context) {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.start,
    showOverlayImage: true,
    imageOverlay: NetworkImage('https://via.placeholder.com/150/FFFFFF/FFFFFF'),
    title: GFListTile(
      avatar: GFAvatar(shape: GFAvatarShape.standard),
      titleText: 'Event NAME',
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Events_info()));
          },
          text: "More info",
          blockButton: true,
        ),
      ],
    ),
  );
}

class EventsHome extends StatefulWidget {
  const EventsHome({Key? key}) : super(key: key);

  @override
  _EventsHomeState createState() => _EventsHomeState();
}

class _EventsHomeState extends State<EventsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Events"),
      ),
      body: ListView.builder(
        itemCount: 5, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return eventCard(index, context);
        },
      ),
    );
  }
}
