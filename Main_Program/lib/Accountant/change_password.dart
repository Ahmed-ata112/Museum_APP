import 'dart:html';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class changePasswordAcc extends StatefulWidget {
  final String username;
  changePasswordAcc({Key? key, required this.username}) : super(key: key);
  @override
  _changePasswordAccState createState() => _changePasswordAccState(username);
}
class _changePasswordAccState extends State<changePasswordAcc> {

  Map<String, dynamic> FormData = {
    'username':null,
    'password': null,
  };
  final _formKey = GlobalKey<FormState>();
  String error = "";
  late String username;
  _changePasswordAccState(this.username);
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
                      "Change Password!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "new password",
                        icon: Icon(Icons.lock),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['password'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in new password";
                        }
                        if (val.length<6) {
                          return "Password must be longer than 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "confirm new password",
                        icon: Icon(Icons.lock),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in password";
                        }
                        if (val.length<6) {
                          return "Password must be longer than 6 characters";
                        }
                        if (val!=FormData['password']) {
                          return "it must match the new password";
                        }
                        return null;
                      },),
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
                          "Change Password!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);
                          setState(() => FormData['username'] = username);
                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                            await Controller.ChangePassowrd(FormData);
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'Error';
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
                                content: Text("Changed Successfully"),
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