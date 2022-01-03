import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  Map<String, dynamic> FormData = {
    'FirstName': null,
    'SecondName': null,
    'LastName': null,
    'PhoneNumber': null,
    'Password': null,
    'Gender': null,
    'birthday': null,
  };
  List<String> Genders = ["Male", "Female"];

  final _formKey = GlobalKey<FormState>();
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to The Museum Party!!",
                  style:
                      TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
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
                    setState(() => FormData['FirstName'] = val);
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
                    setState(() => FormData['SecondName'] = val);
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
                    setState(() => FormData['LastName'] = val);
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
                    hintText: "Phone Number (11 digits)",
                    icon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    setState(() => FormData['PhoneNumber'] = val);
                  },
                  validator: (val) => (val!.length != 11)
                      ? "Phone Number must be 11 digits"
                      : null,
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
                      FormData['birthday'] = value;
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
                      FormData["Gender"] = val;
                    });
                  },
                  validator: (val) => (val == null)
                      ? "Please Choose the job you want to apply to"
                      : null,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: false,
                  style: TextStyle(),
                  decoration: const InputDecoration(
                      hintText: "username",
                      icon: Icon(Icons.help_center_outlined)),
                  onChanged: (val) {
                    setState(() => FormData['username'] = val);
                  },
                  validator: (val) =>
                      val!.isEmpty ? "Please fill in your username" : null,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //Password
                TextFormField(
                  obscureText: false,
                  style: TextStyle(),
                  decoration: const InputDecoration(
                      hintText: "Password", icon: Icon(Icons.lock)),
                  onChanged: (val) {
                    setState(() => FormData['Password'] = val);
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please fill in your password";
                    }
                    if (val.length < 6) {
                      return "Password length must be greater than 6 characters";
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
                      "Register now!",
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
                        dynamic retV = await Controller.addNewMember(FormData);
                        //print(userType);
                        if (retV == -1) {
                          setState(() {
                            error = 'User Already Exists';
                          });
                        } else {
                          setState(() => error = "");
                          // navigate to member home
                          Navigator.pushNamedAndRemoveUntil(context,
                              '/member_home', (Route<dynamic> route) => false);
                        }
                        /*dynamic employeeData =
                            await ApiService.addEmployee(FormData);
                        if (employeeData == null) {
                          setState(
                              () => error = "This Account already exists!");
                        } else {
                          setState(() => error = "");
                          //navigate to the employee home page based on his position

                          String Position = FormData["Position"];*/

                        /*if (Position == "HR") {
                            //Mariam Zain
                            //Navigate to HR home Screen
                            //employeeData is a map holding the tuple of the employee
                            //To know it's exactly content visit lib/rest_api/ in function getEmployee check the comments
                          } else if (Position == "SalesMan") {
                            //Navigate to SalesMan home Screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SalesManView_Product(
                                          UserData: employeeData,
                                        )));
                          } else {
                            //Hala
                            //Navigate to DeliveryMan home screen
                            //employeeData is a map holding the tuple of the employee
                            //To know it's exactly content visit lib/rest_api/ in function getEmployee check the comments
                          }*/
                        // }
                        // }
                      }
                    }),

                Text(
                  error,
                  style: TextStyle(
                      color: Colors.red, fontSize: error.isEmpty ? 0.0 : 14.0),
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
    );
  }
}
