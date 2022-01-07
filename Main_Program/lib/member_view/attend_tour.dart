import 'package:flutter/material.dart';
import 'package:main_program/data_holders.dart';
import '../controller.dart';
import '../data_holders.dart';

class attend_Tours extends StatefulWidget {
  Tour tour;
  attend_Tours({Key? key, required this.tour}) : super(key: key);

  @override
  _attend_ToursState createState() => _attend_ToursState(tour);
}

class _attend_ToursState extends State<attend_Tours> {
  late Tour tour;
  _attend_ToursState(this.tour);
  String error = '';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> formData = {
      'article_id': tour.id,
      'member_id': tour.Member_ID
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
                    "sign for an Tour!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
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
                              Controller.addNewTourGoOn(formData).then((value) {
                                print(value);
                                if (value != -1) {
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    error = 'you signed before';
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
