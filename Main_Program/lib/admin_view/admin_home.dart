import 'package:flutter/material.dart';
import 'package:main_program/admin_view/add_new_attends.dart';
import 'package:main_program/admin_view/add_new_staff.dart';
import 'package:main_program/admin_view/add_new_user.dart';
import 'package:main_program/admin_view/add_new_visitor.dart';
import 'package:main_program/admin_view/insert_new_event.dart';
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
import 'all_users.dart';
import 'delete_ids.dart';
import 'delete_users.dart';

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
          ElevatedButton(
            child: const Text('Add New Section'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewSection()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Event'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewEvent()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New User'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewUser()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Tour'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewTour()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Department'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const addNewDepartment()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Painting and Artifacts'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => addNewPaintingAndArtifacts()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Reviews'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewReviews()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Souvenir'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewSouvenir()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Review'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewReviews()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Attends'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewAttends()));
            },
          ),
          ElevatedButton(
            child: const Text('Add New Feedback'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addNewFeedback()));
            },
          ),
          ElevatedButton(
            child: const Text('Delete User'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getAllUserIDs().then((value) {
                print(value);
                List<String> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Deleteusers(allIDs: ll, name: 'User')));
              });
            },
          ),
          ElevatedButton(
            child: const Text('Delete Department'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getAllDepIDs().then((value) {
                print(value);
                List<int> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeleteID(allIDs: ll, name: 'Department')));
              });
            },
          ),
          ElevatedButton(
            child: const Text('Delete Events'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getAllEventsIDs().then((value) {
                print(value);
                List<int> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeleteID(allIDs: ll, name: 'Event')));
              });
            },
          ),
          ElevatedButton(
            child: const Text('Delete Tours'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getTourIDs().then((value) {
                print(value);
                List<int> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeleteID(allIDs: ll, name: 'Tour')));
              });
            },
          ),
          ElevatedButton(
            child: const Text('Delete Sections'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getAllSecNums().then((value) {
                print(value);
                List<int> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeleteID(allIDs: ll, name: 'Section')));
              });
            },
          ),
          ElevatedButton(
            child: const Text('Delete Articles'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getAllArticleID().then((value) {
                print(value);
                List<int> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeleteID(allIDs: ll, name: 'Article')));
              });
            },
          ),
          ElevatedButton(
            child: const Text('Delete Painting & Artifacts'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getAllPaintingArtifactIDs().then((value) {
                print(value);
                List<int> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeleteID(
                            allIDs: ll, name: 'Paintings & Artifact')));
              });
            },
          ),
          ElevatedButton(
            child: const Text('Delete Visitors'),
            style: ElevatedButton.styleFrom(
                primary: Colors.purple[300],
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              Controller.getAllVisitorsIDs().then((value) {
                print(value);
                List<int> ll = [];
                for (var v in value) {
                  ll.add(v[0]);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeleteID(allIDs: ll, name: 'Visitor')));
              });
            },
          ),
          // ElevatedButton(
          //   child: const Text('Delete Souvenirs'),
          //   style: ElevatedButton.styleFrom(
          //       primary: Colors.purple[300],
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          //       textStyle:
          //           const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          //   onPressed: () async {
          //     Controller.getAllSouvenirIDs().then((value) {
          //       print(value);
          //       List<int> ll = [];
          //       for (var v in value) {
          //         ll.add(v[0]);
          //       }
          //
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) =>
          //                   DeleteID(allIDs: ll, name: 'Souvenir')));
          //     });
          //   },
          // ),
        ],
      )),
    );
  }
}
