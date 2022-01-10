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

class add_view extends StatefulWidget {
  const add_view({Key? key}) : super(key: key);

  @override
  _add_viewState createState() => _add_viewState();
}

class _add_viewState extends State<add_view> {
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
        ],
      )),
    );
  }
}
