import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _formKey = GlobalKey<FormState>();
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
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          hintText: "username", icon: Icon(Icons.person)),
                      onChanged: (val) {},
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          hintText: "Password", icon: Icon(Icons.password)),
                      onChanged: (val) {},
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        child: Text(
                          "LogIn",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () {}),
                    SizedBox(
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
