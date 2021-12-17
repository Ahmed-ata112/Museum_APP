import 'package:flutter/material.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Are you sure you want to attend!",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          child: Text(
                            "Confirm",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
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
    );
  }
}
