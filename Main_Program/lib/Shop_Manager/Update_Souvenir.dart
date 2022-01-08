import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // to use inputFormatters --> allow user ot input digits only
import 'package:main_program/Models/search_sov_id.dart';
import 'package:main_program/api.dart';

class update_goods extends StatefulWidget {
  const update_goods({Key? key}) : super(key: key);

  @override
  update_goodsState createState() => update_goodsState();
}

class update_goodsState extends State<update_goods> {
  late int id = -1;
  late int quantity = -1;
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
          title: const Text('Update Souvenir'),
        ),

        body: FutureBuilder(
        future: DBManager.search_sov_id(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
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
                        labelText: 'Enter The Added Quantity',
                        hintText: 'Enter Added Quantity',),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                        ], // On
                        onChanged: (text) async {setState(() {
                        quantity = -1;
                        quantity = int.parse(text);
                        function();
                        });},

                      ),
                      ),


                    RaisedButton(
                        onPressed: () async{
                      //TODO -> make validation  & EXECUTE QUERY

                     if(id == -1 || quantity == -1){
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


                     else if(so_id.isEmpty){
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






                        },
                      child: Text('Update'),

      )

      ]

      )
      )
      ,
      );
    }
          return CircularProgressIndicator();
    }
        )

    );
  }
}
