import 'package:flutter/material.dart';
import 'package:main_program/admin_view/add_new_staff.dart';
import 'package:main_program/admin_view/add_new_visitor.dart';
import 'package:main_program/member_view/store_home.dart';
import 'package:main_program/member_view/tours_home.dart';
import 'package:main_program/data_holders.dart';

import '../controller.dart';
import 'add_new_member.dart';
import 'add_new_researcher.dart';
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
          ElevatedButton(
            child: const Text('View All attends'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllAttends();

              List<String> labels = ['memb_ID', 'EV_ID', 'class'];

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
            child: const Text('View All buy_member_souvenir'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllBuy_member_souvenir();

              List<String> labels = ['M_ID', 'So_ID', 'quantity', 'timestamp'];

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
            child: const Text('View All Departments'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllDepartment();

              List<String> labels = ['Dno', 'name', 'manager_ID'];

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
            child: const Text('View All Feedbacks'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllFeedback();

              List<String> labels = ['rate', 'comment', 'ME_ID', 'P_ID'];

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
            child: const Text('View All give_session'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllgive_session();

              List<String> labels = ['R_ID', 'E_ID'];

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
            child: const Text('View All Go_On'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllgo_on();

              List<String> labels = ['M_ID', 'Tour_ID'];

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
            child: const Text('View All paintings & artifact'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllpainting_artifact();

              List<String> labels = [
                'ID',
                'name',
                'type',
                'description',
                'section_number'
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
            child: const Text('View All Reads'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllReads();

              List<String> labels = ['MEM_ID', 'AR_ID', 'rate', 'comments'];

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
            child: const Text('View All Researcher'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllResearcher();

              List<String> labels = [
                'ID',
                'Fname',
                'Mname',
                'Lname',
                'B_date',
                'years_of_experience',
                'R_username'
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
            child: const Text('View All Reviews'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllReviews();

              List<String> labels = ['result', 'progress', 'R_ID', 'A_ID'];

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
            child: const Text('View All Sections'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllSection();

              List<String> labels = ['name_', 'number', 'floor_', 'hall'];

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
            child: const Text('View All Sections'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllSection();

              List<String> labels = ['name_', 'number', 'floor_', 'hall'];

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
            child: const Text('View All visitor'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllVisitor();

              List<String> labels = ['ID', 'ArrivalTime', 'DepartureTime'];

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
            child: const Text('View All staff'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllStaff();

              List<String> labels = [
                'ID',
                'Fname',
                'Mname',
                'Lname',
                'gender',
                'job_title',
                'B_date',
                'salary',
                'start_date',
                'super_ID',
                'department_num',
                'staff_username'
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
            child: const Text('View All Writes'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              List aa = await Controller.getAllWrites();

              List<String> labels = ['Re_ID', 'Art_ID'];

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
            child: const Text('Add New member'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewMember()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Visitor'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewvisitor()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Researcher'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewResearcher()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Employee'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewStuff()));
            },
          ),
        ],
      )),
    );
  }
}
