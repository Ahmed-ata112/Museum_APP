import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';

class NewTour extends StatefulWidget {
  const NewTour({Key? key}) : super(key: key);

  @override
  NewTourState createState() => NewTourState();
}

class NewTourState extends State<NewTour> {
  late String _topic;
  late String _place;
  late String _ID;
  late String _description;
  late String _start_date;
  late String _end_date;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildTopicField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
          decoration: const InputDecoration(
              labelText: 'Topic',
              hintText: 'Tour title'
          ),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'this field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _topic = value;
            }
          }
      ),);
  }
  Widget buildPlaceField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
        cursorColor: Colors.black,
        decoration: const InputDecoration(
            focusColor: Colors.black,
            labelText: 'Place',
            hintText: 'Tour place'
        ),
        validator: (value)
        {
          if(value == null || value.isEmpty)
          {return 'This field is required';}
          return null;
        },
        onSaved: (value) {
          if(value != null)
          {_place = value;}
        },
      ),
    );
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
              hintText: 'Tour ID'
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
  Widget buildDescField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      TextFormField(
        cursorColor: Colors.black,
        decoration: const InputDecoration(
            focusColor: Colors.black,
            labelText: 'Description',
            hintText: 'Tour description'
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
  Widget buildStartDateField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      DateTimePicker(
          cursorColor: Colors.black,
          type: DateTimePickerType.date,
          dateLabelText: 'Start Date',
          dateHintText: 'Desired date',
          firstDate: DateTime.now(),
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
  Widget buildEndDateField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child:
      DateTimePicker(
          cursorColor: Colors.black,
          type: DateTimePickerType.date,
          dateLabelText: 'End Date',
          dateHintText: 'Desired date',
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year+5),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'this field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _end_date = value;
            }
          }
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('New Tour',
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
            buildTopicField(),
            buildPlaceField(),
            buildIDField(),
            buildDescField(),
            buildStartDateField(),
            buildEndDateField(),
            const SizedBox(height: 50),
            Padding(padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.tour),
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
                          const SnackBar(content: Text('Tour added successfully')),)
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




















