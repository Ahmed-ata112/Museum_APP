import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:main_program/data_holders.dart';
import 'attend_tour.dart';

String ss = lorem(words: 100);

class Tour_info extends StatefulWidget {
  Tour tour;
  Tour_info({Key? key, required this.tour}) : super(key: key);

  @override
  _Tour_infoState createState() => _Tour_infoState(tour);
}

class _Tour_infoState extends State<Tour_info> {
  Tour tour;

  _Tour_infoState(this.tour);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
            child: Image.network(
              'http://placekitten.com/g/400/400',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 16, 6, 6),
            child: Text(
              tour.title,
              style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            tour.description,
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
                return attend_Tours(tour: tour);
              }).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
