import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'attend_event.dart';

String ss = lorem(words: 100);

class Events_info extends StatefulWidget {
  const Events_info({Key? key}) : super(key: key);

  @override
  _Events_infoState createState() => _Events_infoState();
}

class _Events_infoState extends State<Events_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event name'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
            child: Image.network(
              'http://placekitten.com/g/400/400',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 6, 6, 6),
            child: Text(
              "Some Heading Text",
              style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 6, 6, 6),
            child: Text(
              "Some sub Heading Text",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            ss,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        elevation: 5.0,
        child: Icon(Icons.border_color),
        onPressed: () async {
          // An Alert Dialog
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return attend_Events();
              }).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
