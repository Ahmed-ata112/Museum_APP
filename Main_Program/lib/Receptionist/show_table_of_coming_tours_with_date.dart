import 'package:flutter/material.dart';
import 'package:main_program/Models/coming_tours.dart';
import 'package:main_program/api.dart';


class coming_tours extends StatefulWidget {
  const coming_tours({Key? key}) : super(key: key);

  @override
  _coming_toursState createState() => _coming_toursState();
}

class _coming_toursState extends State<coming_tours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coming Tours"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<tours>>(
            future: DBManager.gettours(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                      return SingleChildScrollView(
                        scrollDirection:Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection:Axis.vertical,
                          child: Card(
                            child: Expanded(
                              child: DataTable(
                                sortAscending: true,
                                columns: const[
                                  DataColumn(label: Text("ID",style: TextStyle(
                                      fontStyle: FontStyle.italic, color: Colors.red)), tooltip: 'the id of the tour'),
                                  DataColumn(label: Text("place",style: TextStyle(
                                      fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the place at which the tour will take place"),
                                  DataColumn(label: Text("Description",style: TextStyle(
                                      fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the description of the tour"),
                                  DataColumn(label: Text("topic",style: TextStyle(
                                      fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the main purpose of the tour"),
                                  DataColumn(label: Text("Date_Start",style: TextStyle(
                                      fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the start time of the tour"),
                                  DataColumn(label: Text("Date_End",style: TextStyle(
                                      fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the time at which the tour will end"),
                                  DataColumn(label: Text("organizer_id",style: TextStyle(
                                      fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the id of the staff who organizes this event"),
                                ],
                                rows: [
                                  for(tours t in snapshot.data!)
                                    DataRow(cells: [
                                    DataCell(Text("${t.ID}")),
                                    DataCell(Text("${t.place}")),
                                    DataCell(Text("${t.description}")),
                                    DataCell(Text("${t.topic}")),
                                    DataCell(Text("${t.Date_Start}")),
                                    DataCell(Text("${t.Date_End}")),
                                    DataCell(Text("${t.organizer_id}"))

                                  ])


                                ],

                              ),
                            ),
                          ),
                        ),
                      );



              }
              return CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}
