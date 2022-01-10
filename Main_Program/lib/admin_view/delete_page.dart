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

class delete_home extends StatefulWidget {
  const delete_home({Key? key}) : super(key: key);

  @override
  _delete_homeState createState() => _delete_homeState();
}

class _delete_homeState extends State<delete_home> {
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
        ],
      )),
    );
  }
}
