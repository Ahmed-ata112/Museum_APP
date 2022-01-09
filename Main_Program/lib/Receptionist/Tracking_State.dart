import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_program/Models/Visitors_Arrival_Time.dart';

import '../api.dart';

//TODO --> should be able to know the number of visitors exists in a specific time   --> whose arr_time & departure_time --> not null

class track_state extends StatefulWidget {
  const track_state({Key? key}) : super(key: key);

  @override
  State<track_state> createState() => _track_stateState();
}

class _track_stateState extends State<track_state> {
  late int count = 0;
  late List<visitors_arr_time> arrival_time;
  final DateTime now = DateTime.now();
  //final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');//to be arrival time




  @override


  Future<int> function() async {
    // do something here
    //DateTime.parse(formatter.toString()).year)//
    arrival_time = await DBManager.getVisitorsArrivalTime();
    count = 0;
    for(visitors_arr_time a in arrival_time)
      if(DateTime.parse(a.arrivalV).year == now.year && DateTime.parse(a.arrivalV).month == now.month && DateTime.parse(a.arrivalV).day == now.day)
        count = count + 1;
      return count;
  }

  void initState() {  //the program will start by it at the first of the program
    function();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking State '),
      ),
      body: Center(
        child: FutureBuilder<List<visitors_arr_time>>(
            future: DBManager.getVisitorsArrivalTime(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Number Of Visitors Today Up Till Now is : ${count.toString()}',textScaleFactor: 1.9,),
                ));
              }
              return CircularProgressIndicator();
            }
        ),
      ),);

  }
}
