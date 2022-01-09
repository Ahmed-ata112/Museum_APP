import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewAttends extends StatefulWidget {
  @override
  _addNewAttendsState createState() => _addNewAttendsState();
}

class _addNewAttendsState extends State<addNewAttends> {
  //Dno, name, manager_ID
  List<dynamic> memb_ID = [];
  List<dynamic> EV_ID = [];

  Map<String, dynamic> FormData = {
    'memb_ID': null,
    'EV_ID': null,
    'class': null,
  };

  final _formKey = GlobalKey<FormState>();
  String error = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getMemIDs().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          memb_ID.add(vv[0]);
          print(vv[0]);
        }
      });
    });
    Controller.getEventIDs().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          EV_ID.add(vv[0]);
          print(vv[0]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'A';
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
                      "Add an attendee!!",
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
                      items: memb_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["memb_ID"] = val;
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
                        hintText: "Event ID",
                        icon: Icon(Icons.person),
                      ),
                      items: EV_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["EV_ID"] = val;
                        });
                      },
                      validator: (val) =>
                          (val == null) ? "This is Required" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Class'),
                        DropdownButton(
                          value: dropdownValue,
                          //icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              FormData['class'] = newValue;
                            });
                          },
                          items: <String>['A', 'B', 'C', 'D']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
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
