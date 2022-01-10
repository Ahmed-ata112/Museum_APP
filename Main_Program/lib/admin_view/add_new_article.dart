import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewArticle extends StatefulWidget {
  @override
  _addNewArticleState createState() => _addNewArticleState();
}

class _addNewArticleState extends State<addNewArticle> {
  //Dno, name, manager_ID
  List<dynamic> memb_ID = [];
  List<dynamic> EV_ID = [];

  Map<String, dynamic> FormData = {
    'state_': null,
    'content': null,
    'likes': 0,
    'views_': 0,
    'header': null,
  };

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
                      "Add an article!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "State",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['state_'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in state";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "content",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['content'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in content";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //PhoneNumber
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "likes",
                        icon: Icon(Icons.article),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() => FormData['likes'] = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //PhoneNumber
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "views",
                        icon: Icon(Icons.article),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() => FormData['views_'] = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "header",
                        icon: Icon(Icons.article),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['header'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in header";
                        }
                        return null;
                      },
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
                          "Add Article!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                                await Controller.addNewArticle(FormData);
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'Article Already Exists';
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
