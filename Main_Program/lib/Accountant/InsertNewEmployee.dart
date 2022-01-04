import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';

class NewEmployee extends StatefulWidget {
  const NewEmployee({Key? key}) : super(key: key);

  @override
  NewEmployeeState createState() => NewEmployeeState();
}

class NewEmployeeState extends State<NewEmployee> {
  late String _fname;
  late String _mname;
  late String _lname;
  late String _ID;
  late String _job_title;
  late String _B_date;
  late String _salary;
  late String _start_date;
  late String _gender;
  late String _super_ID;
  late String _department_num;
  late String _staff_username;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildfnameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
          decoration: const InputDecoration(
              labelText: 'First name',
              hintText: 'Employee first name'
          ),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'this field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _fname = value;
            }
          }
      ),);
  }
  Widget buildmnameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
          decoration: const InputDecoration(
              labelText: 'Middle name',
              hintText: 'Employee middle name'
          ),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'this field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _mname = value;
            }
          }
      ),);
  }
  Widget buildlnameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
          decoration: const InputDecoration(
              labelText: 'Last name',
              hintText: 'Employee last name'
          ),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'this field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _lname = value;
            }
          }
      ),);
  }
  Widget buildIDField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Colors.black,
          decoration: const InputDecoration(
              focusColor: Colors.black,
              labelText: 'ID',
              hintText: 'Employee ID'
          ),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'This field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _ID = value;
            }
          }
      ),
    );
  }
  Widget buildJobTitleField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
        cursorColor: Colors.black,
        decoration: const InputDecoration(
            focusColor: Colors.black,
            labelText: 'Job Title',
            hintText: 'Employee job title'
        ),
        validator: (value)
        {
          if(value == null || value.isEmpty)
          {return 'This field is required';}
          return null;
        },
        onSaved: (value) {
          if(value != null)
          {_job_title = value;}
        },
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
          dateLabelText: 'Birth Date',
          dateHintText: 'Desired date',
          firstDate: DateTime(DateTime.now().year-90),
          lastDate:DateTime.now(),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'this field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _B_date = value;
            }
          }
      ),
    );
  }
  Widget buildSalaryField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Colors.black,
          decoration: const InputDecoration(
              focusColor: Colors.black,
              labelText: 'salary',
              hintText: 'Employee salary'
          ),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'This field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _salary = value;
            }
          }
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
          dateLabelText: 'Start Date',
          dateHintText: 'Desired date',
          firstDate: DateTime(DateTime.now().year-100),
          lastDate: DateTime(DateTime.now().year+5),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'this field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _start_date = value;
            }
          }
      ),
    );
  }
  Widget buildGenderField()
  {
    List<String> Gender=["Female","Male"];
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(onChanged: (dynamic value) {},
          hint: const Text('Gender'),
          items:<String>['Female','Male'].map<DropdownMenuItem<String>>((String value)
          {
            return DropdownMenuItem(value: value,
                child: Text(value),);
          }).toList(),
          validator: (value)
          {
            if(value == null)
            {return 'this field is required';}
            return null;
          },
          onSaved: (dynamic value) {
            if (value != null) {
              _gender=value;
            }
          }),
    );
  }
  Widget buildsuper_IDField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(onChanged: (dynamic value) {},
          hint: const Text('superviser ID'),
          items:
          List<DropdownMenuItem>.generate(5, (index)
          {
            return DropdownMenuItem(value: index,
                child: Text('item $index'));
          })
          ,
          onSaved: (dynamic value) {
            if (value != null) {_super_ID=value;}
          }),
    );
  }
  Widget builddepartment_numField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(onChanged: (dynamic value) {},
          hint: const Text('Department number'),
          items:
          List<DropdownMenuItem>.generate(5, (index)
          {
            return DropdownMenuItem(value: index,
                child: Text('item $index'));
          })
          ,
          onSaved: (dynamic value) {
            if (value != null) {_department_num=value;}
          }),
    );
  }
  Widget buildstaff_usernameField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(onChanged: (dynamic value) {},
          hint: const Text('username'),
          items:
          List<DropdownMenuItem>.generate(5, (index)
          {
            return DropdownMenuItem(value: index,
                child: Text('item $index'));
          })
          ,
          onSaved: (dynamic value) {
            if (value != null) {_staff_username=value;}
          }),
    );
  }
  @override
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
        key: formKey,
        child:
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            buildIDField(),
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
            const SizedBox(height: 50),
            Padding(padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.person),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size.fromWidth(20)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                  ),
                  onPressed: ()=> {
                    if(formKey.currentState!.validate())
                      {
                        formKey.currentState!.save(),
                        //
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Employee added successfully')),)
                       }
                  },
                  label: const Text(
                      'Add',
                      style: TextStyle(color: Colors.black, fontSize: 18)
                  )),),
          ],
        ),
      ),
    );
  }
}




















