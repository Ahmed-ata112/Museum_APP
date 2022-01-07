import 'package:flutter/material.dart';
import 'add_session.dart';

class SessionsHome extends StatefulWidget {
  final rId;
  const SessionsHome({Key? key, this.rId}) : super(key: key);
  @override
  SessionsHomeState createState() => SessionsHomeState();
}

class SessionsHomeState extends State<SessionsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Sessions'
              , style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.black12,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewSession()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      //floatingActionButtonLocation: ,
    );
  }
}
