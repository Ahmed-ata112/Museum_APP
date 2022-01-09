import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewFeedback extends StatefulWidget {
  @override
  _addNewFeedbackState createState() => _addNewFeedbackState();
}

class _addNewFeedbackState extends State<addNewFeedback> {
  //Dno, name, manager_ID
  List<dynamic> ME_ID = [];
  List<dynamic> P_ID = [];

  Map<String, dynamic> FormData = {
    'rate': null,
    'comment': null,
    'ME_ID': null,
    'P_ID': null,
  };

  final _formKey = GlobalKey<FormState>();
  String error = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getMemIDs().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          ME_ID.add(vv[0]);
          print(vv[0]);
        }
      });
    });
    Controller.getPIDs().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          P_ID.add(vv[0]);
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
                      "Add a Feedback!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Rate",
                          icon: Icon(Icons.rate_review),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() => FormData['rate'] = val);
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill in rate";
                          }
                          return null;
                        }),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Comment",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['comment'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in comment";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Member ID",
                        icon: Icon(Icons.person),
                      ),
                      items: ME_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["ME_ID"] = val;
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
                        hintText: "Painting ID",
                        icon: Icon(Icons.person),
                      ),
                      items: P_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["P_ID"] = val;
                        });
                      },
                      validator: (val) =>
                          (val == null) ? "This is Required" : null,
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
                          "Add Feedback!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                                await Controller.addNewFeedback(FormData);
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'Feedback Already Exists';
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
