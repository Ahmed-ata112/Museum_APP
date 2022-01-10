import 'package:flutter/material.dart';
import 'package:main_program/Accountant/change_password.dart';
import 'package:main_program/admin_view/add_new_attends.dart';
import 'package:main_program/admin_view/add_new_staff.dart';
import 'package:main_program/admin_view/add_new_user.dart';
import 'package:main_program/admin_view/add_new_visitor.dart';
import 'package:main_program/admin_view/delete_page.dart';
import 'package:main_program/admin_view/insert_new_event.dart';
import 'package:main_program/admin_view/view_page.dart';
import '../controller.dart';
import 'add_new_feedback.dart';
import 'add_new_painting_artifacts.dart';
import 'add_new_department.dart';
import 'add_new_member.dart';
import 'add_new_researcher.dart';
import 'add_new_reviews.dart';
import 'add_new_section.dart';
import 'add_new_session.dart';
import 'add_new_souvenir.dart';
import 'add_new_tour.dart';
import 'add_page.dart';
import 'all_users.dart';
import 'delete_ids.dart';
import 'delete_users.dart';

Widget signout(BuildContext context) {
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
                    fontSize: 20.0,
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
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

class admin_home extends StatefulWidget {
  const admin_home({Key? key}) : super(key: key);

  @override
  _admin_homeState createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String username = arguments['data']['username'];
    //print(mem.birthday);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Change password'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => changePasswordAcc(
                              username: username,
                            )));
              },
            ),
            ListTile(
              title: const Text(
                'Sign out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                createAlterDialog(BuildContext context) {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return signout(context);
                      });
                }

                createAlterDialog(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          ElevatedButton(
            child: const Text('View Operations'),
            style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => view_home()));
            },
          ),
          ElevatedButton(
            child: const Text('Add Operations'),
            style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const add_view()));
            },
          ),
          ElevatedButton(
            child: const Text('Delete Operations'),
            style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const delete_home()));
            },
          ),
        ],
      )),
    );
  }
}
