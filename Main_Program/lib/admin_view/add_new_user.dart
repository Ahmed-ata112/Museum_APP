import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewUser extends StatefulWidget {
  @override
  _addNewUserState createState() => _addNewUserState();
}

class _addNewUserState extends State<addNewUser> {
  //username_, password_, type_, register_date
  Map<String, dynamic> FormData = {
    'username_': null,
    'password_': null,
    'type_': null,
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
                      "Add a User!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Username",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['username_'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in username";
                        }
                        if (val.length < 6) {
                          return "Username must br longer than 6";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['password_'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in password";
                        }
                        if (val.length < 6) {
                          return "password must br longer than 6";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "type",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['type_'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in type";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    //Password

                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //Sign up (submit) button
                    ElevatedButton(
                        child: const Text(
                          "Add User!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                            await Controller.addNewUser(FormData);
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
