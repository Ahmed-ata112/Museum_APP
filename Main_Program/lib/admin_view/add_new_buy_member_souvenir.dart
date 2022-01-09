import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewBMS extends StatefulWidget {
  @override
  _addNewBMSState createState() => _addNewBMSState();
}

class _addNewBMSState extends State<addNewBMS> {
  //Dno, name, manager_ID
  List<dynamic> M_ID = [];
  List<dynamic> So_ID = [];

  Map<String, dynamic> FormData = {
    'BMS': null,
    'So_ID': null,
    'quantity': 0,
    'timestamp':null,
  };

  final _formKey = GlobalKey<FormState>();
  String error = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getMemIDs().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          M_ID.add(vv[0]);
          print(vv[0]);
        }
      });
    });
    Controller.getSouvenirIDs().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          So_ID.add(vv[0]);
          print(vv[0]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Add an sale!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Member ID",
                        icon: Icon(Icons.person),
                      ),
                      items: M_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["M_ID"] = val;
                        });
                      },
                      validator: (val) =>
                      (val == null) ? "This is Required" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Souvenir ID",
                        icon: Icon(Icons.card_giftcard),
                      ),
                      items: So_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["So_ID"] = val;
                        });
                      },
                      validator: (val) =>
                      (val == null) ? "This is Required" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "quantity",
                        icon: Icon(Icons.card_giftcard),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() => FormData['quantity'] = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DateTimePicker(
                        cursorColor: Colors.black,
                        type: DateTimePickerType.date,
                        //dateLabelText: 'Birthday Date',
                        dateHintText: 'End Date',
                        icon: Icon(Icons.date_range),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 50),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          FormData['Date_End'] = value;
                        }),







                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //Sign up (submit) button
                    ElevatedButton(
                        child: const Text(
                          "Add Attendee!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                            await Controller.addNewEventAttends(FormData);
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'Attendee Already Exists';
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Error occured"),
                                  backgroundColor: Colors.red,
                                ));
                              });
                            } else {
                              setState(() => error = "");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Inserted Successfully"),
                                backgroundColor: Colors.green,
                              ));
                            }
                          }
                        }),

                    Text(
                      error,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: error.isEmpty ? 0.0 : 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    // switchToLoginOrSignupEmployee(
                    //     context, "Have we met before?", "Login"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
