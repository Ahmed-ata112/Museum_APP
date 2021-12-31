import 'package:flutter/material.dart';
import 'package:main_program/CustomWidgets/customTextfield.dart';
import 'package:main_program/Accountant/SouventirSale.dart';
import 'package:main_program/general_pages/Accountant/GivePromotion.dart';
class InsertNewEmployee extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id = 'InsertNewEmployee';
  String fName='',Lname='',job_title='',gender='',Mname='',B_date='',start_date='';
  int salary=0,ID=0,Dno=0,sup_ID=0;
   String GenderChosen="";
  List<String> Gender=["Female","Male"];
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
       body: Center(
    child:SingleChildScrollView(
    reverse: true,
           child:Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height*.01
              ),
               TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter his/her first name"
                ),
              ),
               SizedBox(
                   height: MediaQuery.of(context).size.height*.01
               ),
               TextFormField(
                 decoration: InputDecoration(
                     labelText: "Enter his/her middle name"
                 ),
               ),
               SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
               TextFormField(
                 decoration: InputDecoration(
                     labelText: "Enter his/her last name"
                 ),
               ),
               SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
               TextFormField(
                 decoration: InputDecoration(
                     labelText: "Enter ID"
                 ),
               ),
               SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
               TextFormField(
                 decoration: InputDecoration(
                     labelText: "Enter job title"
                 ),
               ),
               SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              DropdownButtonFormField(onChanged: (dynamic value){print(value);},
                hint: Text('select gender'),
                items:<String>['Female','Male'].map<DropdownMenuItem<String>>((String value)
                {
                  return DropdownMenuItem(
                    value:value,
                    child:Text(value),
                  );
                }).toList(),
              ),
            SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
               TextFormField(
                 decoration: InputDecoration(
                     labelText: "Enter salary"
                 ),
               ),              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40),
                    primary:Colors.white,
                  ),
                  child: FittedBox(
                    child:Text(
                      'Select start date',
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                  ),
                      onPressed: ()=>showDatePicker(context: context, initialDate: DateTime.now(),firstDate: DateTime(DateTime.now().year-100), lastDate: DateTime(DateTime.now().year+5),
                      ),),
              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   minimumSize: Size.fromHeight(40),
                   primary:Colors.white,
                 ),
                 child: FittedBox(
                   child:Text(
                     'Select birth date',
                     style: TextStyle(fontSize: 20,color: Colors.black),
                   ),
                 ),
                 onPressed: ()=>showDatePicker(context: context, initialDate: DateTime.now(),firstDate: DateTime(DateTime.now().year-100), lastDate: DateTime(DateTime.now().year+5),
                 ),),              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
               TextFormField(
                 decoration: InputDecoration(
                     labelText: "Enter department number"
                 ),
               ),              SizedBox(
                   height: MediaQuery.of(context).size.height*.02
               ),              SizedBox(
                  height: MediaQuery.of(context).size.height*.02
              ),
               DropdownButtonFormField(onChanged: (dynamic value){print(value);},
                 hint: Text('select supervise ID'),
                 items:<String>['retrieved employees id'].map<DropdownMenuItem<String>>((String value)
                 {
                   return DropdownMenuItem(
                     value:value,
                     child:Text(value),
                   );
                 }).toList(),
               ),              SizedBox(
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
                    //if(_globalKey.currentState != null)
                      //if(_globalKey.currentState!.validate())
                        //{
                        // _globalKey.currentState.save(); //insert into database
                      //  }
                  },
                  child: Text(
                    'Insert',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 16,
                    ),
                  )
              )
              ),
            ],
       ),//listenview because when keyboard appears it will make problem with textfield if it was a container
       ),
    ));
  }
}
