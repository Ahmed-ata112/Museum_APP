import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';

class attend_tours extends StatefulWidget {
  const attend_tours({Key? key}) : super(key: key);

  @override
  _attend_toursState createState() => _attend_toursState();
}

class _attend_toursState extends State<attend_tours> {
  String dropdownValue = 'A';
  @override
  Widget build(BuildContext context) {
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
                  Text(
                    "sign for an tour!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Your Name",
                      // icon: Icon(Icons.drive_file_rename_outline),
                    ),
                    onChanged: (val) {},
                  ),
                  //Email

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
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () async {}),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            child: Text(
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
                    "error",
                    style: TextStyle(
                        color: Colors.red, fontSize: "".isEmpty ? 0.0 : 14.0),
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
