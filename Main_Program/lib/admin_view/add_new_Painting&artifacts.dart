import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewPaintingAndArtifacts extends StatefulWidget {
  @override
  _addNewPaintingAndArtifactsState createState() => _addNewPaintingAndArtifactsState();
}

class _addNewPaintingAndArtifactsState extends State<addNewPaintingAndArtifacts> {
  //ID, name, type, description, section_number
  List<dynamic> section_number = [];
  Map<String, dynamic> FormData = {
    'ID': null,
    'name': null,
    'type': null,
    'description': null,
    'Password': null,
    'section_number': null,
  };

  final _formKey = GlobalKey<FormState>();
  String error = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getAllSectionNumbers().then((Listo) {
      setState(() {
        for (var vv in Listo) {
          section_number.add(vv[0]);
        }
        print(section_number);
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
                      "Add a painting or artifact!!",
                      style: TextStyle(
                          fontSize: 30.0, color: Colors.lightBlueAccent),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //FirstName
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Name",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['name'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in Name";
                        }
                        if (val.length > 20) {
                          return "First Name length can't exceed 20 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Type",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['Type'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in Type";
                        }
                        if (val.length > 45) {
                          return "Last Name length can't exceed 45 characters";
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
                      onChanged: (val) {
                        setState(() => FormData['description'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in description";
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Section number",
                        icon: Icon(Icons.person),
                      ),
                      items: section_number.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["section_number"] = val;
                        });
                      },
                      validator: (val) =>
                      (val == null) ? "This is Required" : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ), //Position
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //Sign up (submit) button
                    ElevatedButton(
                        child: const Text(
                          "Add!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);
                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                            await Controller.addNewPaintingAndArtifacts(FormData);
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'Painting or artifact Already Exists';
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
