import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_program/Models/search_sov_id.dart';

import '../api.dart';   // to use inputFormatters --> allow user ot input digits only


class insert_goods extends StatefulWidget {
  const insert_goods({Key? key}) : super(key: key);

  @override
  _insert_goodsState createState() => _insert_goodsState();
}

class _insert_goodsState extends State<insert_goods> {
  late int id = -1;
  late int price = -1;
  late int quantity = -1;
  late String name = "";


  late List<sov_id> so_id = [];



  @override
  void function() async {
    // do something here

    so_id = await DBManager.search_sov_id(id);

  }
  void initState() {  //the program will start by it at the first of the program

    function();
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Insert New Souvenir '),
        ),

        body: SingleChildScrollView(
          scrollDirection:Axis.vertical,
          child: Form(
              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter The ID',
                          hintText: 'Enter ID',),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // On
                        onChanged:(text) async {setState(() {
                          id = -1;
                          id = int.parse(text);
                          function();
                        });} ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter The Name',
                          hintText: 'Enter Souvenir Name',),
                        onChanged: (text) async {setState(() {
                          function();
                          name = "";
                          name = text;
                        });},

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter The Price',
                          hintText: 'Enter Souvenir Price',),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // On
                        onChanged: (text) async {setState(() {
                          function();
                          price = -1;
                          price = int.parse(text);
                        });},

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter The Quantity',
                          hintText: 'Enter Souvenir Quantity',),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // On
                        onChanged: (text)async{setState(() {
                          function();
                          quantity = -1;
                          quantity = int.parse(text);
                        });},

                      ),
                    ),

                    RaisedButton(
                      onPressed: () async{
                        //TODO -> make validation  & EXECUTE QUERY
                        //function();
                        if(id == -1 || quantity == -1 || price == -1 || name == ""){
                          createAlterDialog(BuildContext context){
                            return showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("Please Fill All The Form"),
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


                        if(so_id.isNotEmpty){
                          createAlterDialog(BuildContext context){
                            return showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: Text("This ID Is Already Exists."),
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



                      },
                      child: Text('Add'),

                    )

                  ]

              )
          ),
        )

    );
  }
}
