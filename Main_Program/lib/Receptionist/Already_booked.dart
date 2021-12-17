import 'package:flutter/material.dart';
class search_booking extends StatefulWidget {
  const search_booking({Key? key}) : super(key: key);

  @override
  _search_bookingState createState() => _search_bookingState();
}

class _search_bookingState extends State<search_booking> {
  String id = "";  //string or int ?
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for the ID '),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            TextField(

              decoration: InputDecoration(
              labelText: 'Search For The ID',
              hintText: 'Enter Visitor ID',),

          onChanged:(text){ setState(() {
            id = text;
          });} ,
            ),
            SizedBox(height: 100),
            RaisedButton(
              onPressed: (){
                //TODO
                //ADD QUERY  --> SEARCH <SELECT> --> async
                //then output a message
              },
              child: Text('Search')
            ),
          ]

        )
      )

    );
  }
}
