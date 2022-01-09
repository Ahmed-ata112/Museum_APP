import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:main_program/controller.dart';

class NewTour extends StatefulWidget {
  const NewTour({Key? key}) : super(key: key);

  @override
  NewTourState createState() => NewTourState();
}

class NewTourState extends State<NewTour> {
  Map<String, dynamic> FormData = {
    'place': null,
    'description': null,
    'topic': null,
    'Date_Start': null,
    'Date_End': null,
    'organizer_id': null,
    'title': null,
  };
  List<int> IDs = [];

  final _formKey = GlobalKey<FormState>();
  String error = "";
  Widget buildTitileField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Topic",
          icon: Icon(Icons.tour),
        ),
        onChanged: (val) {
          setState(() => FormData['title'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in Tour Title";
          }
          if (val.length > 45) {
            return "Second Name length can't exceed 45 characters";
          }
          return null;
        },
      ),
    );
  }

  Widget buildTopicField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Topic",
          icon: Icon(Icons.tour),
        ),
        onChanged: (val) {
          setState(() => FormData['topic'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in Tour Topic";
          }
          if (val.length > 45) {
            return "Second Name length can't exceed 45 characters";
          }
          return null;
        },
      ),
    );
  }

  Widget buildPlaceField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Place",
          icon: Icon(Icons.place),
        ),
        onChanged: (val) {
          setState(() => FormData['place'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in Tour Place";
          }
          if (val.length > 45) {
            return "Second Name length can't exceed 45 characters";
          }
          return null;
        },
      ),
    );
  }

  Widget buildIDField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "ID",
          icon: Icon(Icons.tour_outlined),
        ),
        keyboardType: TextInputType.number,
        onChanged: (val) {
          setState(() => FormData['ID'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in Tour ID";
          }
          return null;
        },
      ),
    );
  }

  Widget buildDescField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Tour Description",
          icon: Icon(Icons.description),
        ),
        onChanged: (val) {
          setState(() => FormData['description'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in tour description";
          }
          return null;
        },
      ),
    );
  }

  Widget buildStartDateField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DateTimePicker(
          cursorColor: Colors.black,
          type: DateTimePickerType.date,
          dateHintText: 'Start date',
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
            FormData['Date_Start'] = value;
          }),
    );
  }

  Widget buildEndDateField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DateTimePicker(
          cursorColor: Colors.black,
          type: DateTimePickerType.date,
          dateHintText: 'End date',
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
            FormData['Date_End'] = value;
          }),
    );
  }

  Widget buildstaff_idField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Your Gender",
          icon: Icon(Icons.person_add_alt_1_sharp),
        ),
        items: IDs.map((gg) {
          return DropdownMenuItem(
            value: gg,
            child: Text(gg.toString()),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            FormData["organizer_id"] = val;
          });
        },
        validator: (val) => (val == null) ? "this field is required" : null,
      ),
    );
  }

  void initState() {
    super.initState();
    Controller.getEmpIDs().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
          print(row['ID']);
          IDs.add(row['ID']);
        }
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'New Tour',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            buildTitileField(),
            buildTopicField(),
            buildPlaceField(),
            //buildIDField(),
            buildDescField(),
            buildStartDateField(),
            buildEndDateField(),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton(
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () async {
                    print(FormData);
                    if (_formKey.currentState!.validate()) {
                      //if the form from the client side is valid
                      print("All Valid at the client side:)");
                      //go and check if this credentials is valid from the server (DB) side
                      //i.e check if this account exists and if the email and password matches (are correct)

                      //Server Validation Side
                      dynamic retV = await Controller.addNewTour(FormData);
                      //print(userType);
                      if (retV == -1) {
                        setState(() {
                          error = 'Tour Already Exists';
                        });
                      } else {
                        setState(() => error = "");
                        // navigate to member home
                        // pushes and never go back
                        Navigator.pushNamedAndRemoveUntil(context, '/pr_home',
                            (Route<dynamic> route) => false);
                      }
                    }
                  }),
            ),
            Text(
              error,
              style: TextStyle(
                  color: Colors.red, fontSize: error.isEmpty ? 0.0 : 14.0),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
