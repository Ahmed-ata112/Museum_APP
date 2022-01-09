import 'package:flutter/material.dart';
import 'package:main_program/CustomWidgets/customTextfield.dart';
import 'package:main_program/general_pages/Accountant/InsertNewEmployee.dart';
class GivePromotion extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id = 'GivePromotion';
  int ID=0,p=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        image:AssetImage('images/icons/pro.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          'Give Promotion',style: TextStyle(
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
            DropdownButtonFormField(onChanged: (dynamic value){print(value);},
              hint: Text('select ID'),
              items:<String>['retrieve employees ids'].map<DropdownMenuItem<String>>((String value)
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
            ),SizedBox(
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
                      'change salary',
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
