import 'package:flutter/material.dart';
import 'package:main_program/Models/tour_location.dart';
import 'package:main_program/api.dart';

class Tour_location extends StatefulWidget {
  const Tour_location({Key? key}) : super(key: key);

  @override
  _Tour_locationState createState() => _Tour_locationState();
}

class _Tour_locationState extends State<Tour_location> {
  late String tour_topic = "";
  late String place = "";
  late List<tour_loc> loc = [];


  @override
  void function() async {
    // do something here
    loc = await DBManager.gettourloc(tour_topic);
    place = loc.first.place;

  }
  void initState() {  //the program will start by it at the first of the program

    function();
    super.initState();


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Tours'),
        ),
        body: FutureBuilder(
        future: DBManager.gettourloc(tour_topic),
          builder: (context, snapshot) {
           if (snapshot.hasData) {
          return Form(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'The Tour Name',
                        hintText: 'Enter Tour To Search',),
                      onChanged: (text) async {
                        setState(() {


                          tour_topic = text;
                          function();   // i have to put this here otherwise it won't work at all
                        });
                      },
                      // validator:(tour_topic) {
                      //   if (tour_topic == null || tour_topic.isEmpty) {
                      //
                      //   }
                      // }
                    ),
                  ),
                  SizedBox(height: 30,),
                  RaisedButton(
                    onPressed: () async {

                      if (tour_topic == null || tour_topic.isEmpty){
                        createAlterDialog(BuildContext context){
                          return showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Please, Enter The Name Of The Tour !"),
                              actions: [
                                FlatButton(
                                  onPressed: () => Navigator.pop(context, false), // passing false
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          });

                        }
                        createAlterDialog(context);
                        return;
                      }


                      if(loc.isEmpty)
                      {


                        createAlterDialog(BuildContext context){
                          return showDialog(context: context, builder: (context){
                            return AlertDialog(
                                title: Text("Please, Enter A Valid Name Of The Tour !"),
                              actions: [
                                FlatButton(
                                  onPressed: () => Navigator.pop(context, false), // passing false
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          });

                        }
                        createAlterDialog(context);

                        return;

                      }


                      createAlterDialog(BuildContext context){
                        return showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("the place of the tour:"),
                            content: Text("${loc.first.place}"),
                            actions: [
                              FlatButton(
                                onPressed: () => Navigator.pop(context, false), // passing false
                                child: Text('Cancel'),
                              ),
                            ],
                          );
                        });

                      }
                      createAlterDialog(context);

                    },
                    child: Text('Get Location'),

                  )

                ]

            )
        );
      }
          return CircularProgressIndicator();
    }
        )

    );
  }
}


