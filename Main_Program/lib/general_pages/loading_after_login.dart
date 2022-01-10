import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:main_program/Receptionist/home_receptionist.dart';
import 'package:main_program/Researcher/researcher_home.dart';
import 'package:main_program/member_view/member_home.dart';
//import 'package:main_program/Accountant/accountant_home.dart';
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
          print('NOT A VALID MEMBER - in users but not members');
        }
      } else if (type == 0) {
        //admin
        Navigator.pushReplacementNamed(context, '/admin_home', arguments: {
          'data': data,
        });
      } else if (type == 2) {
        //accountant
        dynamic retrieved = await Controller.getAccData(username);
        print(retrieved);
        if (retrieved != null) {
          Staff mem = retrieved;
          //print(mem.username);
          Navigator.pushReplacementNamed(context, '/accountant_home',
              arguments: {'member': mem.staff_username});
        } else {
          print('NOT A VALID staff - in users but not members');
        }
      } else if (type == 4) {
        //accountant
        dynamic retrieved = await Controller.getAccData(username);
        print(retrieved);
        if (retrieved != null) {
          Staff mem = retrieved;
          //print(mem.username);
          Navigator.pushReplacementNamed(context, '/shopManager',
              arguments: {'member': mem});
        } else {
          print('NOT A VALID staff - in users but not members');
        }
      } else if (type == 5) {
        //Receptionist
        dynamic retrieved = await Controller.getAccData(username);
        print(retrieved);
        if (retrieved != null) {
          Staff mem = retrieved;
          //print(mem.username);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home_Receptionist(
                        username: mem.staff_username,
                      )));
        } else {
          print('NOT A VALID staff - in users but not members');
        }
      } else if (type == 6) {
        //accountant
        dynamic retrieved = await Controller.getAccData(username);
        print(retrieved);
        if (retrieved != null) {
          Staff mem = retrieved;
          //print(mem.username);
          Navigator.pushReplacementNamed(context, '/PR',
              arguments: {'member': mem.staff_username});
        } else {
          print('NOT A VALID staff - in users but not members');
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
