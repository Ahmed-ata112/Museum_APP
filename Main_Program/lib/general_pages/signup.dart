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
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(),
                      decoration: const InputDecoration(
                          hintText: "username", icon: Icon(Icons.person)),
                      onChanged: (val) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          hintText: "Password", icon: Icon(Icons.password)),
                      onChanged: (val) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GFButton(
                      child: const Text(
                        "Log in",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/loading_after_login');
                      },
                      // style: ElevatedButton.styleFrom(
                      //   primary: Colors.blue,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(30)),
                      //   minimumSize: Size.fromHeight(45),
                      // ),
                      blockButton: true,
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
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/loading_after_login');
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
