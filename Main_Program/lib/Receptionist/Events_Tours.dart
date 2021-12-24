import 'package:flutter/material.dart';

import 'package:main_program/Receptionist/Tour_Location.dart';
import 'package:main_program/Receptionist/show_table_of_coming_tours_with_date.dart';
import 'package:main_program/Receptionist/show_table_of_coming_event_with_date.dart';
import 'package:main_program/Receptionist/Event_location.dart';
//TODO --> should be able to know the holes at which each event will take place, its time
//TODO --> and also know the available tour/event in a specific time



class Events_Tours extends StatelessWidget {
  Events_Tours({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Events & Tours'),
      ),
      body: Center(
          child: ListView.builder(
            // Important: Remove any padding from the ListView.
            itemCount: 1,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(1),
                      color: Colors.blue[200],
                      child: ListTile(
                        title: const Text('Search For an Event Location'),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Event_location())

                          );
                          // Update the state of the app.
                          // ...
                        },
                        leading: const CircleAvatar(

                          backgroundImage: AssetImage('Images/event-location.png'),

                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(1),
                      color: Colors.blue[200],
                      child: ListTile(
                        title: const Text('Search For a Tour Location'),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Tour_location())

                          );
                          // Update the state of the app.
                          // ...
                        },
                        leading: const CircleAvatar(

                          backgroundImage: AssetImage('Images/tour_location.png'),

                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(1),
                      color: Colors.blue[200],
                      child: ListTile(
                        title: const Text('Show Coming Events'),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> coming_events())

                          );
                          // Update the state of the app.
                          // ...
                        },
                        leading: const CircleAvatar(

                          backgroundImage: AssetImage('Images/coming_event.png'),

                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(1),
                      color: Colors.blue[200],
                      child: ListTile(
                        title: const Text('Show Coming Tours'),
                        onTap: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> coming_tours())

                          );

                          // Update the state of the app.
                          // ...
                        },

                        leading: const CircleAvatar(

                          backgroundImage: AssetImage('Images/tour-guide.png'),

                        ),
                      ),
                    ),

                  ],
                ),
              );
            },
          )

      ),
    );
  }
}




















/*

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    children: <Widget> [
                      SizedBox(height: 200,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: (){
                              //TODO --> MOVE TO ANOTHER PAGE
                            },
                            child: Text('Available Events'),  //i mean in a specific time --> search with time or search for all coming
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                      SizedBox(height: 100,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: (){
                              //TODO --> MOVE TO ANOTHER PAGE
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Event_location()));
                            },
                            child: Text('Location Of An Event'),  //i mean in a specific time --> search with time or search for all coming
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    children: <Widget> [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: (){
                              //TODO --> MOVE TO ANOTHER PAGE
                            },
                            child:Text('Available Tours'),
                            color:Colors.blue[300],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: (){
                              //TODO --> MOVE TO ANOTHER PAGE
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Tour_location()));
                            },
                            child:Text('Location Of A Tour'),
                            color:Colors.blue[300],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
}
*/
