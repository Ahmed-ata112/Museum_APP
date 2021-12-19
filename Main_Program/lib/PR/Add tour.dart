import 'package:flutter/material.dart';
import 'package:main_program/CustomWidgets/customTextfield.dart';
import 'package:main_program/PR/Add event.dart';
class AddTour extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id = 'AddTour';
  String Fname='',Lname='',job_title='',gender='',Mname='',B_date='',start_date='';
  int salary=0,ID=0,Dno=0,sup_ID=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Add event'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTour())

                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Add tour'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>this));
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top:40),
                child:   Container(
                  height: MediaQuery.of(context).size.height*.2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image(
                        image:AssetImage('images/icons/em.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          'Add Tour',style: TextStyle(
                          fontSize: 25,

                        ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*.01
            ),
            customTextfield(hint:'Enter topic',icon:Icons.person,val:Mname),
            SizedBox(
                height: MediaQuery.of(context).size.height*.02
            ),
            customTextfield(hint:'Enter place',icon:Icons.person,val:Lname),
            SizedBox(
                height: MediaQuery.of(context).size.height*.05
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 120
                )
                ,
                child: FlatButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: ()
                    {
                      if(_globalKey.currentState != null)
                        if(_globalKey.currentState!.validate())
                        {
                          //_globalKey.currentState.save(); //insert into database
                        }
                    },
                    child: Text(
                      'Add tour',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 16,
                      ),
                    ))
            ),
          ],
        ),//listenview because when keyboard appears it will make problem with textfield if it was a container
      ),
    );
  }
}
