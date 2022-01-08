import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewResearcher extends StatefulWidget {
  @override
  _addNewResearcherState createState() => _addNewResearcherState();
}

class _addNewResearcherState extends State<addNewResearcher> {
  Map<String, dynamic> FormData = {
    'Fname': null,
    'Mname': null,
    'Lname': null,
    'B_date': null,
    'years_of_experience': null,
    'R_username': null
  };

  List<dynamic> allUserNames = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getAllUsernamesWithType(3).then((Listo) {
      setState(() {
        for (var vv in Listo) {
          allUserNames.add(vv[0]);
        }
        print(allUserNames);
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
                      "Add a Researcher!!",
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
                        hintText: "First Name",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['Fname'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in First Name";
                        }
                        if (val.length > 20) {
                          return "First Name length can't exceed 20 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //SecondName
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Second Name",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['Mname'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in Second Name";
                        }
                        if (val.length > 20) {
                          return "Second Name length can't exceed 20 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['Lname'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in your Last Name";
                        }
                        if (val.length > 20) {
                          return "Last Name length can't exceed 20 characters";
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
                        hintText: "Years Of Experience",
                        icon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() => FormData['years_of_experience'] = val);
                      },
                      validator: (val) =>
                          (val!.length == 0) ? "this is required" : null,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DateTimePicker(
                        cursorColor: Colors.black,
                        type: DateTimePickerType.date,
                        //dateLabelText: 'Birthday Date',
                        dateHintText: 'Birthday date',
                        icon: Icon(Icons.date_range),
                        firstDate: DateTime(DateTime.now().year - 100),
                        lastDate: DateTime(DateTime.now().year + 5),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          FormData['B_date'] = value;
                        }),

                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Username",
                        icon: Icon(Icons.person),
                      ),
                      items: allUserNames.map((gg) {
                        return DropdownMenuItem(
                          value: gg,
                          child: Text(gg),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["R_username"] = val;
                        });
                      },
                      validator: (val) =>
                          (val == null) ? "Please Choose the Username" : null,
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
                          "Add Researcher!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                                await Controller.addNewResearcher(FormData);
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
