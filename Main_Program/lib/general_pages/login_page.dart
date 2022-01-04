import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:main_program/general_pages/signup.dart';

import '../controller.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  Map<String, dynamic> FormData = {
    'username': null,
    'Password': null,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'User Login',
            style: TextStyle(
                fontSize: 30, color: Colors.cyan, fontWeight: FontWeight.bold),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(),
                      decoration: const InputDecoration(
                          hintText: "username", icon: Icon(Icons.person)),
                      onChanged: (val) {
                        setState(() => FormData['username'] = val);
                      },
                      validator: (val) =>
                          val!.isEmpty ? "Please fill in your username" : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          hintText: "Password", icon: Icon(Icons.password)),
                      onChanged: (val) {
                        setState(() => FormData['password'] = val);
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please fill in your password";
                        }
                        if (val.length < 6) {
                          return "Incorrect Password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GFButton(
                      child: const Text(
                        "Log in",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () async {
                        // Navigator.pushReplacementNamed(
                        //     context, '/loading_after_login');

                        if (_formKey.currentState!.validate()) {
                          //if the form from the client side is valid
                          print("All Valid at the client side :)");
                          //go and check if this credentials is valid from the server (DB) side
                          //i.e check if this account exists and if the email and password matches (are correct)
                          //Server Validation Side
                          dynamic userType =
                              await Controller.getUserType(FormData);
                          //print(userType);
                          if (userType == -1) {
                            setState(() {
                              error = 'username or password are not valid!';
                            });
                          } else {
                            setState(() => error = "");
                            //navigate to the employee home page based on his position
                            // according to the type
                            print(userType);
                            // Navigator.pushReplacementNamed(
                            //     context, '/loading_after_login');
                            //user is a member
                            Navigator.pushReplacementNamed(
                                context, '/loading_after_login', arguments: {
                              'username': FormData['username'],
                              'type': userType
                            });
                          }
                        }
                      },
                      blockButton: true,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: error.isEmpty ? 0.0 : 14.0),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'not a member?',
                          style: TextStyle(
                              color: Colors.blue[400], fontSize: 12.0),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        GFButton(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.blue[400], fontSize: 10.0),
                            ),
                            size: GFSize.SMALL,
                            type: GFButtonType.outline,
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserSignUp()));
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
