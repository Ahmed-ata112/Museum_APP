import 'package:flutter/material.dart';
import 'package:main_program/data_holders.dart';
import '../controller.dart';
import '../data_holders.dart';

class attend_Events extends StatefulWidget {
  Event eve;
  attend_Events({Key? key, required this.eve}) : super(key: key);

  @override
  _attend_EventsState createState() => _attend_EventsState(eve);
}

class _attend_EventsState extends State<attend_Events> {
  late Event eve;
  _attend_EventsState(this.eve);

  String dropdownValue = 'A';
  String error = '';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> formData = {
      'class': dropdownValue,
      'article_id': eve.id,
      'member_id': eve.Member_ID
    };
    return AlertDialog(
      content: Container(
        //padding: EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Form(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "sign for an event!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Class'),
                      DropdownButton(
                        value: dropdownValue,
                        //icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            formData['class'] = newValue;
                          });
                        },
                        items: <String>['A', 'B', 'C', 'D']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            child: const Text(
                              "Confirm",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () async {
                              Controller.addNewEventAttends(formData)
                                  .then((value) {
                                print(value);
                                if (value != -1)
                                  Navigator.pop(context);
                                else {
                                  setState(() {
                                    error = 'you inserted a feedback before';
                                  });
                                }
                                return null;
                              });
                            }),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: error.isEmpty ? 0.0 : 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
