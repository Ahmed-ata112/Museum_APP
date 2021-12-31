import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';

class NewSession extends StatefulWidget {
  const NewSession({Key? key}) : super(key: key);

  @override
  NewSessionState createState() => NewSessionState();
}

class NewSessionState extends State<NewSession> {
  late String _title;
  late String _description;
  late String _date;
  late String _duration;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildTitleField()
  {
    return Padding(padding: const EdgeInsets.all(20),
    child:
    TextFormField(
      decoration: const InputDecoration(
          labelText: 'Title',
          hintText: 'Session title'
      ),
      validator: (value)
      {
        if(value == null || value.isEmpty)
          {return 'this field is required';}
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _title = value;
        }
      }
    ),);
  }
  Widget buildDescField()
  {
    return Padding(padding: const EdgeInsets.all(20),
    child:
      TextFormField(
        cursorColor: Colors.black,
      decoration: const InputDecoration(
        focusColor: Colors.black,
          labelText: 'Description',
          hintText: 'Session description'
      ),
      validator: (value)
      {
        if(value == null || value.isEmpty)
          {return 'This field is required';}
        return null;
      },
      onSaved: (value) {
        if(value != null)
          {_description = value;}
        },
    ),
    );
  }
  Widget buildDateField()
  {
    return Padding(padding: const EdgeInsets.all(20),
    child:
      DateTimePicker(
        cursorColor: Colors.black,
      type: DateTimePickerType.date,
      dateLabelText: 'Date',
      dateHintText: 'Desired date',
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
      validator: (value)
      {
        if(value == null || value.isEmpty)
          {return 'this field is required';}
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          _date = value;
        }
      }
    ),
    );
  }
  Widget buildDurationField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorColor: Colors.black,
        decoration: const InputDecoration(
            focusColor: Colors.black,
            labelText: 'Duration (hours)',
            hintText: 'e.g.: 3.5'
        ),
        validator: (value)
        {
          if(value == null || value.isEmpty)
            {return 'This field is required';}
          return null;
        },
        onSaved: (value) {
          if (value != null) {
            _duration = value;
          }
        }
      ),
    );
  }
  Widget buildAvaiTimeLocField()
  {
    return Padding(padding: const EdgeInsets.all(20),
    child: DropdownButtonFormField(onChanged: (dynamic value) {},
      hint: const Text('Available time-location'),
      items:
      List<DropdownMenuItem>.generate(5, (index)
      {
        return DropdownMenuItem(value: index,
            child: Text('item $index'));
      })
    ,
      onSaved: (dynamic value) {
        if (value != null) {}
      }),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('New session',
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
              buildTitleField(),
              buildDescField(),
              buildDateField(),
              buildDurationField(),
              buildAvaiTimeLocField(),
              const SizedBox(height: 50),
              Padding(padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.web_asset),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size.fromWidth(20)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                  onPressed: ()=> {
                    if(formKey.currentState!.validate())
                      {
                        formKey.currentState!.save(),
                        //TODO::insert into database
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Session reserved successfully')),)
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
