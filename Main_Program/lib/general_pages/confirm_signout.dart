import 'package:flutter/material.dart';

class CONFIRMORNOT extends StatelessWidget {
  const CONFIRMORNOT({Key? key}) : super(key: key);

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
                  const Text(
                    "Are you sure you want to sign out?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
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
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login_page', (route) => false);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
