import 'package:flutter/material.dart';

class Tour_location extends StatefulWidget {
  const Tour_location({Key? key}) : super(key: key);

  @override
  _Tour_locationState createState() => _Tour_locationState();
}

class _Tour_locationState extends State<Tour_location> {
  String event_name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Tours'),
        ),
        body: Form(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'The Tour Name',
                        hintText: 'Enter Tour To Search',),
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


