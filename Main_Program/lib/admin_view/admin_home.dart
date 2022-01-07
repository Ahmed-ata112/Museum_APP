import 'package:flutter/material.dart';
import 'package:main_program/member_view/store_home.dart';
import 'package:main_program/member_view/tours_home.dart';
import 'package:main_program/data_holders.dart';

import '../controller.dart';
import 'all_users.dart';

class admin_home extends StatefulWidget {
  const admin_home({Key? key}) : super(key: key);

  @override
  _admin_homeState createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    //print(mem.birthday);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: [
          ElevatedButton(
            child: const Text('View All Users'),
            style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllUsers();
              /*List<User> sen = [];
              for (var user in aa) {
                sen.add(User(user[0], user[1], user[3], user[4]));
              }*/
              List<String> labels = [
                'username',
                'password',
                'type',
                'Reg data'
              ];

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => allUsers(
                            users: aa,
                            labels: labels,
                          )));
            },
          ),
          ElevatedButton(
            child: const Text('View All Members'),
            style: ElevatedButton.styleFrom(
                primary: Colors.red[400],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllMembers();

              List<String> labels = [
                'Fname',
                'Sname',
                'Lname',
                'gender',
                'ID',
                'B_date',
                'mem_username',
                'phone_number',
              ];

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => allUsers(
                            users: aa,
                            labels: labels,
                          )));
            },
          ),
          ElevatedButton(
            child: const Text('View All Articles'),
            style: ElevatedButton.styleFrom(
                primary: Colors.yellowAccent[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllArticles();

              List<String> labels = [
                'ID',
                'state_',
                'Content',
                'Likes',
                'views',
                'Header',
              ];

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => allUsers(
                            users: aa,
                            labels: labels,
                          )));
            },
          ),
          ElevatedButton(
            child: const Text('View All Events'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllEvents();

              List<String> labels = [
                'ID',
                'Data_Start',
                'Date_End',
                'Description',
                'Theme',
                'title',
                'sec_number',
                'staff_id'
              ];

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => allUsers(
                            users: aa,
                            labels: labels,
                          )));
            },
          ),
          ElevatedButton(
            child: const Text('View All Tours'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllTours();

              List<String> labels = [
                'ID',
                'place',
                'description',
                'topic',
                'Date_start',
                'Date_end',
                'Organizer_id',
                'title'
              ];

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => allUsers(
                            users: aa,
                            labels: labels,
                          )));
            },
          ),
        ],
      )),
    );
  }
}
