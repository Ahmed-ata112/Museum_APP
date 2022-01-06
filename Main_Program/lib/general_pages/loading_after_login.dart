import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:main_program/Researcher/researcher_home.dart';
import 'package:main_program/member_view/member_home.dart';
//import 'package:main_program/Accountant/AccountantHome.dart';
import 'package:main_program/data_holders.dart';

import '../controller.dart';

class loading_after_login extends StatefulWidget {
  const loading_after_login({Key? key}) : super(key: key);

  @override
  _loading_after_loginState createState() => _loading_after_loginState();
}

class _loading_after_loginState extends State<loading_after_login> {
  Map data = {};
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 1), () async {
      //Navigator.pop(context);

      String username = data['username'];
      int type = data['type'];
      print(data);
      if (type == 1) {
        dynamic retrieved = await Controller.getMembersData(username);
        print(retrieved);
        if (retrieved != null) {
          Member mem = retrieved;
          //print(mem.username);
          Navigator.pushReplacementNamed(context, '/member_home',
              arguments: {'member': mem});
        } else {
          print('NOT A VALID MEMBER - in users but nit members');
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // if data is empty, initialize it
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
    /*const Center(
        child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 80.0,
    ));*/
  }
}
