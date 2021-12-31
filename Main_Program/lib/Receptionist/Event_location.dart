import 'package:flutter/material.dart';

class Event_location extends StatefulWidget {
  const Event_location({Key? key}) : super(key: key);

  @override
  _Event_locationState createState() => _Event_locationState();
}

class _Event_locationState extends State<Event_location> {
  String event_name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Events'),
        ),
        body: Form(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'The Event Name',
                        hintText: 'Enter Event To Search',),
                      onChanged:(text){setState(() {
                        event_name = text;
                      });} ,
                    ),
                  ),
                  SizedBox(height: 30,),
                  RaisedButton(
                    onPressed: (){
                      //TODO -> make validation  & EXECUTE QUERY
                    },
                    child: Text('Get Location'),

                  )

                ]

            )
        )

    );
  }
}


