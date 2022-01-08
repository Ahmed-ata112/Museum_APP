import 'package:flutter/material.dart';
import 'package:flutter/services.dart';   // to use inputFormatters --> allow user ot input digits only


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
                          quantity = -1;
                          quantity = int.parse(text);
                        });},

                      ),
                    ),

                    RaisedButton(
                      onPressed: () async{
                        //TODO -> make validation  & EXECUTE QUERY

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
