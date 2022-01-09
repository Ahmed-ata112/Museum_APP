import 'package:flutter/material.dart';
import 'package:main_program/Models/visitor_id.dart';
import 'package:main_program/api.dart';
import 'package:flutter/services.dart';   // to use inputFormatters --> allow user ot input digits only

class search_booking extends StatefulWidget {
  const search_booking({Key? key}) : super(key: key);

  @override
  _search_bookingState createState() => _search_bookingState();
}

class _search_bookingState extends State<search_booking> {
  late int id = -1 ;  //string or int ?
  late List<visitor_id> v_id = [];


  @override
  void function() async {
    // do something here

    v_id = await DBManager.search_visitor_id(id);

  }
  void initState() {  //the program will start by it at the first of the program

    function();
    super.initState();


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search for the ID '),
        ),

        body: FutureBuilder(
        future: DBManager.search_visitor_id(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Form(
                child: Center(
                    child: Column(
                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(

                        decoration: InputDecoration(
                          labelText: 'Search For The ID',
                          hintText: 'Enter Visitor ID',),
                          keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered

                        onChanged:(text) async{ setState(() {
                          id = -1;
                          id = int.parse(text);
                          function();
                        });} ,
                      ),
                    ),
                    SizedBox(height: 100),
                    RaisedButton(
                        onPressed: () async {

                          //print(v_id.first.id.toString());

                          if(id == -1){
                            createAlterDialog(BuildContext context){
                              return showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("Please Enter An ID"),
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

                          //we can not replace this if with the next if as the exception will be thrown before entering this if
                          else if(v_id.isEmpty){
                            createAlterDialog(BuildContext context){
                              return showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("This ID Doesn't Exist."),
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


                          else if(v_id.first.id == id)
                            {
                              createAlterDialog(BuildContext context){
                                return showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    title: Text("This ID Exists."),
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




                          //ADD QUERY  --> SEARCH <SELECT> --> async
                          //then output a message
                        },
                        child: Text('Search')
                    ),
                  ]

              )
          ),
        );
}
            return CircularProgressIndicator();
          }
    ),);
  }
}
