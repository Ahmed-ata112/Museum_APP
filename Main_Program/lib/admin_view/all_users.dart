import 'package:flutter/material.dart';

import '../controller.dart';
import '../data_holders.dart';

class allUsers extends StatelessWidget {
  List users;
  List<String> labels;
  allUsers({Key? key, required this.users, required this.labels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(columns: [
              for (var v in labels)
                DataColumn(
                    label: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 100),
                        child: Text(v)))
            ], rows: [
              for (var user in users)
                DataRow(cells: [
                  for (var uu in user)
                    DataCell(ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 250),
                        child: Text(uu.toString()))),
                ]),
            ]),
          ),
        ),
      ),
    );
  }
}
