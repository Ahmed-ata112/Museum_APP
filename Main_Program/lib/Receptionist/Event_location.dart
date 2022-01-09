import 'package:flutter/material.dart';
import 'package:main_program/api.dart';
import 'package:main_program/Models/event_location.dart';

class Event_location extends StatefulWidget {
  const Event_location({Key? key}) : super(key: key);




  @override
  _Event_locationState createState() => _Event_locationState();
}

class _Event_locationState extends State<Event_location> {

  late String event_name = "";
  late int sec_numb = 0;
  late List<event_loc> loc = [];
  @override


  void function() async {
    // do something here
    loc = await DBManager.geteventloc(event_name);
    sec_numb = loc.first.sec_num;

  }
  void initState() {  //the program will start by it at the first of the program
    function();
    super.initState();



  }



  // Future<Future> createAlterDialog(BuildContext context) async {
  //   return showDialog(context: context, builder: (context){
  //     return AlertDialog(
  //       title: Text("Number Of The Section at which the event will tak place:"),
  //       content: Text("${sec_numb}"),
  //     );
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Events'),
        ),
        body: FutureBuilder<List<event_loc>>(
        future: DBManager.geteventloc(event_name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          return Form(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'The Event Name',
                        hintText: 'Enter Event To Search',),
                      onChanged: (text) async{
                        setState(() {
                          event_name = text;
                          function();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  RaisedButton(
                    onPressed: () async{
                      if (event_name == null || event_name.isEmpty){
                        createAlterDialog(BuildContext context){
                          return showDialog(context: context, builder: (context){
                            return AlertDialog(
                                title: Text("Please, Enter The Name Of The Event !"),
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
                                  title: Text("Please, Enter A Valid Name Of The Event !"),
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



                      Future<Future> createAlterDialog(
                          BuildContext context) async {
                        return showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text(
                                "Number Of The Section at which the event will tak place:"),
                            content: Text("${loc.first.sec_num}"),
                            actions: [
                              FlatButton(
                                onPressed: () => Navigator.pop(context, false), // passing false
                                child: Text('Cancel'),
                              ),
                            ],



                          );
                        });
                      }

                      //TODO -> make validation  & EXECUTE QUERY
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
        ),

    );
  }
}



//
//
// createAlterDialog(BuildContext context){
//   return showDialog(context: context, builder: (context){
//     return AlertDialog(
//         title: Text("Please, Enter A Valid Name Of The Event !")
//     );
//   });
//
// }
// createAlterDialog(context);
//
//

// else if(snapshot.hasData == null){
//
// createAlterDialog(BuildContext context){
// return showDialog(context: context, builder: (context){
// return AlertDialog(
// title: Text("Please, Enter A Valid Name Of The Event !")
// );
// });
//
// }
// createAlterDialog(context);
//
//
// }
//
//
// else