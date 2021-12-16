import 'package:flutter/material.dart';
import 'package:main_program/CustomWidgets/customTextfield.dart';
import 'package:main_program/general_pages/Accountant/GivePromotion.dart';
class InsertNewEmployee extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id = 'InsertNewEmployee';
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
              title: const Text('Insert a new employee'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InsertNewEmployee())

                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Give Promotion'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GivePromotion()));
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
                    'Insert Employee',style: TextStyle(
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
              customTextfield(hint:'Enter his/her first name',icon:Icons.person),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter his/her Middle name',icon:Icons.person),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter his/her Last name',icon:Icons.person),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter ID',icon:Icons.vpn_key),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter job_title',icon:Icons.person),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter gender',icon:Icons.transgender),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter salary',icon:Icons.money),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter start date',icon:Icons.calendar_today),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter department number',icon:Icons.house),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter superviser name',icon:Icons.person),
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
                          //insert into database
                        }
                  },
                  child: Text(
                    'Insert',
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
