import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller.dart';
import 'dart:convert';
import 'dart:io';

class addNewStuff extends StatefulWidget {
  @override
  _addNewStuffState createState() => _addNewStuffState();
}

class _addNewStuffState extends State<addNewStuff> {
  List<dynamic> DepsNums = [];
  List<dynamic> AllUserNames = [];
  List<dynamic> Ids = [];
  Map<String, dynamic> FormData = {
    'Fname': null,
    'Mname': null,
    'Lname': null,
    'gender': null,
    'job_title': null,
    'B_date': null,
    'salary': null,
    'start_date': null,
    'super_ID': null,
    'department_num': null,
    'staff_username': null
  };
  List<String> Genders = ["Male", "Female"];
  //Fname, Mname, Lname, gender, job_title, B_date, salary, start_date, super_ID, department_num, staff_username
  final _formKey = GlobalKey<FormState>();
  String error = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getAllUsernamesWithType(2).then((Listo) {
      setState(() {
        for (var vv in Listo) {
          AllUserNames.add(vv[0]);
        }
        print(AllUserNames);
      });
    });
    Controller.getDepNums().then((Listo) {
      setState(() {
        //print(Listo);
        for (var vv in Listo) {
          DepsNums.add(vv[0]);
          print(vv[0]);
        }
        //print(DepsNums);
      });
    });
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
                      "Add an Employee!!",
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
                          return "Please fill in your First Name";
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
                          return "Please fill in your Second Name";
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
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Department number",
                        icon: Icon(Icons.person),
                      ),
                      items: DepsNums.map((gg) {
                        return DropdownMenuItem(
                          value: gg.toString(),
                          child: Text(gg.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["department_num"] = val;
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
                        hintText: "Super ID",
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
                          FormData["super_ID"] = val;
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
                        hintText: "Staff Username",
                        icon: Icon(Icons.person),
                      ),
                      items: AllUserNames.map((gg) {
                        return DropdownMenuItem(
                          value: gg,
                          child: Text(gg),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["staff_username"] = val;
                        });
                      },
                      validator: (val) =>
                          (val == null) ? "This is Required" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Job Title",
                        icon: Icon(Icons.perm_identity_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['job_title'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in  job title";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Salary",
                        icon: Icon(Icons.monetization_on_rounded),
                      ),
                      onChanged: (val) {
                        setState(() => FormData['salary'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in The Salary";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //PhoneNumber

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
                    SizedBox(
                      height: 20.0,
                    ), //Position
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Your Gender",
                        icon: Icon(Icons.transgender),
                      ),
                      items: Genders.map((gg) {
                        return DropdownMenuItem(
                          value: gg[0],
                          child: Text(gg),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          FormData["gender"] = val;
                        });
                      },
                      validator: (val) => (val == null) ? "required" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
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
                          "Add Employee!",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () async {
                          print(FormData);

                          if (_formKey.currentState!.validate()) {
                            //if the form from the client side is valid
                            print("All Valid at the client side:)");
                            //Server Validation Side
                            dynamic retV =
                                await Controller.addNewStaff(FormData);
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
