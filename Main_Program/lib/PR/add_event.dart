import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:main_program/controller.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  NewEventState createState() => NewEventState();
}

class NewEventState extends State<NewEvent> {
  Map<String, dynamic> FormData = {
    'ID': null,
    'Date_Start': null,
    'Date_End': null,
    'description': null,
    'theme': null,
    'title': null,
    'sec_number': null,
    'staff_id': null,
  };
  List<int> sec_number = [];
  List<int> staff_id = [];

  final _formKey = GlobalKey<FormState>();
  String error = "";

  Widget buildTitleField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Title",
          icon: Icon(Icons.event),
        ),
        onChanged: (val) {
          setState(() => FormData['title'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in Event Title";
          }
          if (val.length > 20) {
            return "Event Title length can't exceed 20 characters";
          }
          return null;
        },
      ),
    );
  }

  Widget buildThemeField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Theme",
          icon: Icon(Icons.event),
        ),
        onChanged: (val) {
          setState(() => FormData['theme'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in Event Theme";
          }
          if (val.length > 45) {
            return "Event Theme length can't exceed 45 characters";
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
          hintText: "Description",
          icon: Icon(Icons.description),
        ),
        onChanged: (val) {
          setState(() => FormData['description'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "this field is required";
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

  Widget buildsec_numberField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Section Number",
          icon: Icon(Icons.transgender),
        ),
        items: sec_number.map((gg) {
          return DropdownMenuItem(
            value: gg.toString(),
            child: Text(gg.toString()),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            FormData["sec_number"] = val;
          });
        },
        validator: (val) =>
            (val == null) ? "Please Choose the section number" : null,
      ),
    );
  }

  Widget buildstaff_idField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Staff ID",
          icon: Icon(Icons.person_add),
        ),
        items: staff_id.map((gg) {
          return DropdownMenuItem(
            value: gg.toString(),
            child: Text(gg.toString()),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            FormData["staff_id"] = val;
          });
        },
        validator: (val) => (val == null) ? "this field is required" : null,
      ),
    );
  }

  void initState() {
    super.initState();
    Controller.getAllSecNums().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
          print(row[0]);
          sec_number.add(row[0]);
        }
        setState(() {});
      });
    });
    Controller.getEmpIDs().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
          print(row);
          staff_id.add(row[0]);
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
          'New Event',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            buildTitleField(),
            buildThemeField(),
            buildDescField(),
            buildStartDateField(),
            buildEndDateField(),
            buildsec_numberField(),
            buildstaff_idField(),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton(
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
                      dynamic retV = await Controller.addNewEvent(FormData);
                      //print(userType);
                      if (retV == -1) {
                        setState(() {
                          error = 'Event Already Exists';
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
