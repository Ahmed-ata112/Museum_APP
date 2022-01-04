import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:main_program/Researcher/researcher_home.dart';
import 'package:main_program/member_view/member_home.dart';

class loading_after_login extends StatefulWidget {
  const loading_after_login({Key? key}) : super(key: key);

  @override
  _loading_after_loginState createState() => _loading_after_loginState();
}

class _loading_after_loginState extends State<loading_after_login> {
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 1000), () {
      Navigator.pop(context);
      print('returned');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[

          ListTile(
            title: Text('member_view'),
            onTap:
                () {
                  Navigator.pushNamed(context, '/member_home');
            },
          ),
          ListTile(
            title: Text('accountant_view'),
            onTap:
                () {
              Navigator.pushNamed(context, '/accountant_home');
            },
          ),
          ListTile(
            title: Text('researcher_view'),
            onTap:
                () {
                  Navigator.pushNamed(context, '/ResearcherHome');
            },
          ),
        ],
      ),
    );
    /*const Center(
        child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 80.0,
    ));*/
  }
}
