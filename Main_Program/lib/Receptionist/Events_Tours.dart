import 'package:flutter/material.dart';



//TODO --> should be able to know the holes at which each event will take place, its time
//TODO --> and also know the available tour/event in a specific time


class Events_Tours extends StatelessWidget {
  const Events_Tours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Events & Tours'),
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              Row(
                children: <Widget> [
                  SizedBox(height: 200,),
                  RaisedButton(
                    onPressed: (){
                      //TODO --> MOVE TO ANOTHER PAGE
                    },
                    child: Text('Available Events'),  //i mean in a specific time --> search with time or search for all coming
                    color: Colors.blue[300],
                  ),
                  SizedBox(height: 100,),
                  RaisedButton(
                    onPressed: (){
                      //TODO --> MOVE TO ANOTHER PAGE
                    },
                    child: Text('Location Of An Event'),  //i mean in a specific time --> search with time or search for all coming
                    color: Colors.blue[300],
                  ),
                ],
              ),
              Row(
                children: <Widget> [
                  RaisedButton(
                    onPressed: (){
                      //TODO --> MOVE TO ANOTHER PAGE
                    },
                    child:Text('Available Tours'),
                    color:Colors.blue[300],
                  ),

                  RaisedButton(
                    onPressed: (){
                      //TODO --> MOVE TO ANOTHER PAGE
                    },
                    child:Text('Location Of A Tour'),
                    color:Colors.blue[300],
                  ),


                ],
              ),

            ]
        ),
      ),
    );
  }
}
