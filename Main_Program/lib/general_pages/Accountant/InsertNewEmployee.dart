import 'package:flutter/material.dart';
import 'package:main_program/Accountant/SouventirSale.dart';
import 'package:main_program/CustomWidgets/customTextfield.dart';
<<<<<<< Updated upstream:Main_Program/lib/general_pages/Accountant/InsertNewEmployee.dart
import 'package:main_program/general_pages/Accountant/GivePromotion.dart';
class InsertNewEmployee extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id = 'InsertNewEmployee';
=======
import 'package:main_program/Accountant/GivePromotion.dart';
import 'package:main_program/Accountant/SouventirSale.dart';
class InsertNewEmployee extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id = 'InsertNewEmployee';
  String Fname='',Lname='',job_title='',gender='',Mname='',B_date='',start_date='';
  int salary=0,ID=0,Dno=0,sup_ID=0;
>>>>>>> Stashed changes:Main_Program/lib/Accountant/InsertNewEmployee.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            ListTile(
              title: const Text('view Sourvenir sale'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SouvenirSale()));
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
              customTextfield(hint:'Enter his/her first name',icon:Icons.person,val : Fname),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter his/her Middle name',icon:Icons.person,val:Mname),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter his/her Last name',icon:Icons.person,val:Lname),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter ID',icon:Icons.vpn_key,val:ID),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter job_title',icon:Icons.person,val:job_title),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter gender',icon:Icons.transgender,val: gender),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter salary',icon:Icons.money,val:salary),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter start date',icon:Icons.calendar_today,val:start_date),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter birth date',icon:Icons.person,val:B_date),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter department number',icon:Icons.house,val:Dno),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              customTextfield(hint:'Enter superviser ID',icon:Icons.person,val:sup_ID),
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
                        // _globalKey.currentState.save(); //insert into database
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
