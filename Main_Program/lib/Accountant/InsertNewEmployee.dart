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
    'staff_username': null,
    'password': null,
    'type': null,
  };
  List<String> Genders = ["Male", "Female"];
  List<int> IDS=[];
  List<int> DepartmentNumbers= [];

    final _formKey = GlobalKey<FormState>();
  String error = "";
  Widget buildfnameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
          decoration: const InputDecoration(
              hintText: "First Name",
              icon: Icon(Icons.perm_identity_rounded),
          ),
          onChanged: (val) {
            setState(() => FormData['Fname'] = val);
          },
          validator: (value)
          {
            if(value!.isEmpty)
            {return "Please fill in employee's First Name";}
            if (value.length > 20) {
              return "First Name length can't exceed 20 characters";
            }
            return null;
          },
      ),);
  }
  Widget buildmnameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
          decoration: const InputDecoration(
              hintText: "Middle Name",
              icon: Icon(Icons.perm_identity_rounded),
          ),
        onChanged: (val) {
          setState(() => FormData['Mname'] = val);
        },
          validator: (value)
          {
            if(value!.isEmpty)
            {return "Please fill in employee's Middle Name";}
            if (value.length > 20) {
              return "Middle Name length can't exceed 20 characters";
            }
            return null;
          },
      ),);
  }
  Widget buildlnameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
          decoration: const InputDecoration(
              hintText: "Last Name",
              icon: Icon(Icons.perm_identity_rounded),
          ),
        onChanged: (val) {
          setState(() => FormData['Lname'] = val);
        },
          validator: (value)
          {
            if(value!.isEmpty)
            {return "Please fill in employee's Last Name";}
            if (value.length > 20) {
              return "Last Name length can't exceed 20 characters";
            }
            return null;
          },
      ),
    );
  }
  Widget buildJobTitleField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
        decoration: const InputDecoration(
            hintText: "Job Title",
                icon: Icon(Icons.work)
        ),
        onChanged: (val) {
          setState(() => FormData['job_title'] = val);
        },
        validator: (val) => (val == null)
            ? "Please Choose the job that employee wants to apply for"
            : null,
      ),
    );
  }
  Widget buildBDateField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      DateTimePicker(
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
  Widget buildSalaryField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Salary",
          icon: Icon(Icons.money),
        ),
        keyboardType: TextInputType.number,
        onChanged: (val) {
          setState(() => FormData['salary'] = val);
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
  Widget buildStartDateField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      DateTimePicker(
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
  Widget buildGenderField()
  {
    return Padding(padding: const EdgeInsets.all(20),
    child:
    DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: "Your Gender",
        icon: Icon(Icons.transgender),
      ),
      items: Genders.map((gg) {
        return DropdownMenuItem(
          value: gg,
          child: Text(gg),
        );
      }).toList(),
      onChanged: (val) {
        setState(() {
          FormData["Gender"] = val;
        });
      },
      validator: (val) => (val == null)
          ? "Please Choose the gender"
          : null),
    );
  }
  Widget buildsuper_IDField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Supervisor ID",
          icon: Icon(Icons.person),
        ),

        items: IDS.map((gg) {
          return DropdownMenuItem(
            value: gg,
            child: Text(gg.toString()),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            FormData["super_ID"] = val;
          });
        },
        validator: (val) => (val == null)
            ? "this field is required"
            : null,
      ),
    );
  }
  Widget builddepartment_numField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Department number",
          icon: Icon(Icons.house),
        ),
        items: DepartmentNumbers.map((gg) {
          return DropdownMenuItem(
            value: gg,
            child: Text(gg.toString()),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            FormData["department_num"] = val;
          });
        },
        validator: (val) => (val == null)
            ? "this field is required"
            : null,
      ),
    );
  }
  Widget buildstaff_usernameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
        obscureText: false,
        style: TextStyle(),
        decoration: const InputDecoration(
            hintText: "username",
            icon: Icon(Icons.help_center_outlined)),
        onChanged: (val) {
          setState(() =>
          FormData['staff_username'] = val);
        },
        validator: (val) =>
        val!.isEmpty ? "Please fill in employee's username" : null,
      ),
    );
  }
  Widget buildpasswordField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
        obscureText: false,
        style: TextStyle(),
        decoration: const InputDecoration(
            hintText: "Password", icon: Icon(Icons.lock)),
        onChanged: (val) {
          setState(() => FormData['password'] = val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "Please fill in password";
          }
          if (val.length < 6) {
            return "Password length must be greater than 6 characters";
          }
          return null;
        },
      ),
    );
  }
  Widget buildtypeField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:    TextFormField(
        decoration: const InputDecoration(
          hintText: "Type",
          icon: Icon(Icons.cases),
        ),
        keyboardType: TextInputType.number,
        onChanged: (val) {
          setState(() => FormData['type'] = val);
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

  void initState(){
    super.initState();
    (()async{
      IDS=await Controller.getAllEmployeesIDs();
      DepartmentNumbers=  await Controller.getAllDepNumbers();
    })();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('New Employee',
          style: TextStyle(
              color: Colors.black
          ),),
      ),
      body: Form(
        key: _formKey,
        child:
        ListView(
          shrinkWrap: true,
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
            Padding(padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton(
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: ()async {
                    if(_formKey.currentState!.validate())
                      {
                        //if the form from the client side is valid
                        print("All Valid at the client side:)");
                        //go and check if this credentials is valid from the server (DB) side
                        //i.e check if this account exists and if the email and password matches (are correct)

                        //Server Validation Side
                        dynamic retV =
                        await Controller.addNewMember(FormData);
                        //print(userType);
                        if (retV == -1) {
                          setState(() {
                            error = 'Employee Already Exists';
                          });
                        } else {
                          setState(() => error = "");
                          // navigate to member home
                          // pushes and never go back
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/accountant_home',
                                  (Route<dynamic> route) => false);
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
          ],
        ),
      ),
    );
  }
}




















