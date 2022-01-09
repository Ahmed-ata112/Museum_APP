import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewReviews extends StatefulWidget {
  @override
  _addNewReviewsState createState() => _addNewReviewsState();
}

class _addNewReviewsState extends State<addNewReviews> {
  Map<String, dynamic> FormData = {
    'result': null,
    'progress': null,
    'R_ID': null,
    'A_ID': null,
  };

  List<dynamic> R_ID = [];
  List<dynamic> A_ID = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getAllResearcherID().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          R_ID.add(vv[0]);
        }
        print(R_ID);
      });
    });
    Controller.getAllArticleID().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          A_ID.add(vv[0]);
        }
        print(A_ID);
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
  String error = "";

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
                      "Add a Review!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Result",
                        icon: Icon(Icons.article),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['result'] = val);
                      },
                      validator: (val) =>
                          (val!.length == 0) ? "this is required" : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Progress",
                        icon: Icon(Icons.article),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() => FormData['progress'] = val);
                      },
                      validator: (val) =>
                          (val!.length == 0) ? "this is required" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Researcher ID",
                        icon: Icon(Icons.person),
                      ),
                      items: R_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["R_ID"] = val;
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
                        hintText: "Article ID",
                        icon: Icon(Icons.person),
                      ),
                      items: A_ID.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["A_ID"] = val;
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
                          "Add Review!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV = await Controller.addNewReview(
                                FormData); ////////////////
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'User Already Exists';
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
