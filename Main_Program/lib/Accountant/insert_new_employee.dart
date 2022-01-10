import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:main_program/controller.dart';

class NewEmployee extends StatefulWidget {
  const NewEmployee({Key? key}) : super(key: key);

  @override
  NewEmployeeState createState() => NewEmployeeState();
}

class NewEmployeeState extends State<NewEmployee> {
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
    'staff_username': null,
    'password': null,
    'type': null,
  };
  List<String> Genders = ["Male", "Female"];
  List<int> IDS = [];
  List<int> DepartmentNumbers = [];

  final _formKey = GlobalKey<FormState>();
  String error = "";
  Widget buildfnameField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "First Name",
          icon: Icon(Icons.perm_identity_rounded),
        ),
        onChanged: (value) {
          setState(() => FormData['Fname'] = value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget buildmnameField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Middle Name",
          icon: Icon(Icons.perm_identity_rounded),
        ),
        onChanged: (value) {
          setState(() => FormData['Mname'] = value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget buildlnameField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Last Name",
          icon: Icon(Icons.perm_identity_rounded),
        ),
        onChanged: (value) {
          setState(() => FormData['Lname'] = value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget buildJobTitleField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Job Title", icon: Icon(Icons.work)),
        onChanged: (value) {
          setState(() => FormData['job_title'] = value);
        },
        validator: (value) => (value == null)
            ? "Please Choose the job that employee wants to apply for"
            : null,
      ),
    );
  }

  Widget buildBDateField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DateTimePicker(
        cursorColor: Colors.black,
        type: DateTimePickerType.date,
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
        },
      ), //
    );
  }

  Widget buildSalaryField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Salary",
          icon: Icon(Icons.money),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() => FormData['salary'] = value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this field is required ';
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
            FormData['start_date'] = value;
          }), //
    );
  }

  Widget buildGenderField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
          decoration: const InputDecoration(
            hintText: "Gender",
            icon: Icon(Icons.transgender),
          ),
          items: Genders.map((gg) {
            return DropdownMenuItem(
              value: gg,
              child: Text(gg),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              FormData["gender"] = value;
            });
          },
          validator: (value) =>
              (value == null) ? "Please Choose the gender" : null),
    );
  }

  Widget buildsuper_IDField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Supervisor ID",
          icon: Icon(Icons.person),
        ),
        items: IDS.map((gg) {
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
        validator: (val) => (val == null) ? "this field is required" : null,
      ),
    );
  }

  Widget builddepartment_numField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Department number",
          icon: Icon(Icons.house),
        ),
        items: DepartmentNumbers.map((gg) {
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
        validator: (val) => (val == null) ? "this field is required" : null,
      ),
    );
  }

  Widget buildstaff_usernameField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        obscureText: false,
        style: TextStyle(),
        decoration: const InputDecoration(
            hintText: "username", icon: Icon(Icons.help_center_outlined)),
        onChanged: (value) {
          setState(() => FormData['staff_username'] = value);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget buildpasswordField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        obscureText: false,
        style: TextStyle(),
        decoration:
            const InputDecoration(hintText: "Password", icon: Icon(Icons.lock)),
        onChanged: (val) {
          setState(() => FormData['password'] = val);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this field is required';
          }
          if (value.length < 6) {
            return "Password length must be greater than 6 characters";
          }
          return null;
        },
      ),
    );
  }

  Widget buildtypeField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Type",
          icon: Icon(Icons.cases),
        ),
        keyboardType: TextInputType.number,
        onChanged: (val) {
          setState(() => FormData['type'] = val);
        },
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'this field is required';
          }
          return null;
        },
      ),
    );
  }

  @override
  //void didChangeDependencies()async {
  //super.didChangeDependencies();
  //IDS= await Controller.getAllEmployeesIDs();
  //super.setState(() {
  //});
  //}

  void initState() {
    super.initState();
    Controller.getEmpIDs().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
          print(row[0]);
          IDS.add(row[0]);
        }
        setState(() {});
      });
    });
    Controller.getAllDepIDs().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
          print(row);
          DepartmentNumbers.add(row[0]);
        }
        setState(() {});
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text(
            'New Employee',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // ListView(
            // shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildfnameField(),
                    buildmnameField(),
                    buildlnameField(),
                    buildGenderField(),
                    buildJobTitleField(),
                    buildBDateField(),
                    buildSalaryField(),
                    buildStartDateField(),
                    buildsuper_IDField(),
                    builddepartment_numField(),
                    buildstaff_usernameField(),
                    buildpasswordField(),
                    buildtypeField(),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 130, right: 130),
                      child: ElevatedButton(
                          child: const Text(
                            "Add",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              //if the form from the client side is valid
                              print("All Valid at the client side:)");
                              //go and check if this credentials is valid from the server (DB) side
                              //i.e check if this account exists and if the email and password matches (are correct)

                              //Server Validation Side
                              dynamic retV =
                                  await Controller.addNewStaff(FormData);
                              print(retV);
                              if (retV == -1) {
                                setState(() {
                                  error = 'EMPLOYEE Already Exists';
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
                          color: Colors.red,
                          fontSize: error.isEmpty ? 0.0 : 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ]),
            ),
          ),
        ));
  }
}
