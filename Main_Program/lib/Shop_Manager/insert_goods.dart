import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class insert_goods extends StatefulWidget {
  @override
  _insert_goodsState createState() => _insert_goodsState();
}

class _insert_goodsState extends State<insert_goods> {
  Map<String, dynamic> FormData = {
    //ID int PK
    // _name varchar(50)
    // price int
    // quantity
    '_name': null,
    'price': null,
    'quantity': null,
  };

  @override
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
                      "Add a Souvenir!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Name",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['_name'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in Name";
                        }
                        if (val.length > 50) {
                          return "Last Name length can't exceed 50 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "price",
                        icon: Icon(Icons.monetization_on_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['price'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in The price";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "quantity",
                        icon: Icon(Icons.monetization_on_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['quantity'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in The quantity";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "description",
                        icon: Icon(Icons.description),
                      ),
                      minLines: 1,
                      maxLines: 100,
                      keyboardType: TextInputType.multiline,
                      onChanged: (val) {
                        setState(() => FormData['description'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill description";
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
                    //Sign up (submit) button
                    ElevatedButton(
                        child: const Text(
                          "Add Souvenir!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV = await Controller.addNewSouvenir(
                                FormData); ////////////////
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'Souvenir Already Exists';
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
