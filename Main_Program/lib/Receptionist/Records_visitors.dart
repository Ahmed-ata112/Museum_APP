import 'package:flutter/material.dart';

class Records_Visitors extends StatefulWidget {
  const Records_Visitors({Key? key}) : super(key: key);

  @override
  _Records_VisitorsState createState() => _Records_VisitorsState();
}

class _Records_VisitorsState extends State<Records_Visitors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Coming Visitor'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 200,),
            RaisedButton(
              onPressed: (){
                //TODO --> MOVE TO ANOTHER PAGE
              },
              child: Text('Already Booked'),
              color: Colors.blue[300],
            ),
            SizedBox(height: 100,),
            RaisedButton(
              onPressed: (){
                //TODO --> MOVE TO ANOTHER PAGE
              },
              child:Text('Not Booked Yet'),
              color:Colors.blue[300],
            )
          ]
        ),
      ),
    );
  }
}
