import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../controller.dart';
import 'event_info.dart';
import '../data_holders.dart';

Widget eventCard(Event eve, context) {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.start,
    showOverlayImage: true,
    imageOverlay: NetworkImage('https://via.placeholder.com/150/FFFFFF/FFFFFF'),
    title: GFListTile(
      avatar: GFAvatar(shape: GFAvatarShape.standard),
      titleText: eve.title,
      subTitleText: 'Date: ' + eve.Date_start,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eve.description,
          maxLines: 3,
        ),
      ],
    ),
    buttonBar: GFButtonBar(
      children: <Widget>[
        GFButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Events_info(eve: eve)));
          },
          text: "More info",
          blockButton: true,
        ),
      ],
    ),
  );
}

class EventsHome extends StatefulWidget {
  final int Member_id;

  const EventsHome({Key? key, required this.Member_id}) : super(key: key);

  @override
  _EventsHomeState createState() => _EventsHomeState(Member_id);
}

class _EventsHomeState extends State<EventsHome> {
  final int Member_id;
  List<Event> allEvents = [];
  _EventsHomeState(this.Member_id);

  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getAllEvents().then((ListOfEventsRows) {
      setState(() {
        for (var row in ListOfEventsRows) {
          //print(row);
          Event eve = Event(row[0], row[1], row[2], row[3], row[4], row[5],
              row[6], row[7], Member_id);
          allEvents.add(eve);
        }
        setState(() {}); //just call it to update screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Events"),
      ),
      body: ListView.builder(
        itemCount: allEvents.length, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return eventCard(allEvents[index], context);
        },
      ),
    );
  }
}
