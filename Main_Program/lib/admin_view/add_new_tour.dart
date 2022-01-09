import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewTour extends StatefulWidget {
  @override
  _addNewTourState createState() => _addNewTourState();
}

//ID, place, description, topic, Date_Start, Date_End, organizer_id, title
class _addNewTourState extends State<addNewTour> {
  List<dynamic> AllSecNums = [];
  List<dynamic> Ids = [];
  Map<String, dynamic> FormData = {
    'ID': null,
    'Date_Start': null,
    'Date_End': null,
    'description': null,
    'topic': null,
    'title': null,
    'place': null,
    'organizer_id': null
  };
  final _formKey = GlobalKey<FormState>();
  String error = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Controller.getEmpIDs().then((Listo) {
      setState(() {
        //print(Listo);
        for (var vv in Listo) {
          Ids.add(vv[0]);
          print(vv[0]);
        }
        //print(DepsNums);
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
                      "Add a Tour!!",
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
                    //SecondName
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "topic",
                        icon: Icon(Icons.multitrack_audio),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['topic'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in topic";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Title",
                        icon: Icon(Icons.add),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['title'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in the title";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "place",
                        icon: Icon(Icons.add),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['place'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in the place";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Organizer ID",
                        icon: Icon(Icons.person),
                      ),
                      items: Ids.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["organizer_id"] = val;
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

                    SizedBox(
                      height: 20.0,
                    ),
                    DateTimePicker(
                        cursorColor: Colors.black,
                        type: DateTimePickerType.date,
                        //dateLabelText: 'Birthday Date',
                        dateHintText: 'Start Date',
                        icon: Icon(Icons.date_range),
                        firstDate: DateTime(DateTime.now().year - 100),
                        lastDate: DateTime(DateTime.now().year + 50),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          FormData['Date_Start'] = value;
                        }),
                    SizedBox(
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
                          "Add Tour!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                                await Controller.addNewTour(FormData);
                            //print(userType);
                            if (retV == -1) {
                              setState(() {
                                error = 'Tour Already Exists';
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
