import 'package:flutter/material.dart';
import 'package:main_program/Models/coming_events.dart';
import 'package:main_program/api.dart';





class coming_events extends StatefulWidget {
  const coming_events({Key? key}) : super(key: key);

  @override
  _coming_eventsState createState() => _coming_eventsState();
}

class _coming_eventsState extends State<coming_events> {


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Coming Events"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<events>>(
              future: DBManager.getevents(),
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
                                  fontStyle: FontStyle.italic, color: Colors.red)), tooltip: 'the id of the event'),
                                DataColumn(label: Text("Start Date",style: TextStyle(
                                  fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the time at which the event will be scheduled"),
                                DataColumn(label: Text("End Date",style: TextStyle(
                                  fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the time at which the event ends"),
                                DataColumn(label: Text("Description",style: TextStyle(
                                  fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the topic of the event"),
                                DataColumn(label: Text("Theme",style: TextStyle(
                                  fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the era that this event is related to"),
                                DataColumn(label: Text("Title",style: TextStyle(
                                  fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the main title of the event"),
                                DataColumn(label: Text("Section Number",style: TextStyle(
                                  fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the number of the section at which the event will take plcae"),
                                DataColumn(label: Text("Staff ID",style: TextStyle(
                                  fontStyle: FontStyle.italic,color: Colors.red)), tooltip: "the id of the staff who organizes this event"),
                              ],
                              rows: [
                                for(events e in snapshot.data!)
                                  DataRow(cells: [
                                  DataCell(Text("${e.event_id}")),


                                  //DataCell(Text("${snapshot.data![index].event_id}")),
                                  DataCell(Text("${e.event_date_start}")),
                                  DataCell(Text("${e.event_date_end}")),
                                  DataCell(Text("${e.description}")),
                                  DataCell(Text("${e.theme}")),
                                  DataCell(Text("${e.title}")),
                                  DataCell(Text("${e.sec_number}")),
                                  DataCell(Text("${e.staff_id}")),]

                                )


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
