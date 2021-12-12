import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class member_home extends StatefulWidget {
  const member_home({Key? key}) : super(key: key);

  @override
  _member_homeState createState() => _member_homeState();
}

class _member_homeState extends State<member_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Item 1'),
                onTap: null,
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
