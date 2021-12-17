import 'package:flutter/material.dart';
class new_booking extends StatefulWidget {
  const new_booking({Key? key}) : super(key: key);

  @override
  _new_bookingState createState() => _new_bookingState();
}

class _new_bookingState extends State<new_booking> {
  String id = "";
  String arr_time="";
  //DateTime arr_time= DateTime.now();  // TODO --> after listening to last videos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Make a New Reservation '),
        ),

        body: Form(
            child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter The ID',
                      hintText: 'Enter ID',),
                    onChanged:(text){setState(() {
                      id = text;
                    });} ,
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter The Arrival Time',
                        hintText: 'Enter Arrival Time',),
                    onChanged: (text){setState(() {
                      arr_time = text;
                    });},

                  ),
                  RaisedButton(
                    onPressed: (){
                      //TODO -> make validation  & EXECUTE QUERY
                    },
                    child: Text('Reserve'),

                  )

                ]

            )
        )

    );
  }
}
