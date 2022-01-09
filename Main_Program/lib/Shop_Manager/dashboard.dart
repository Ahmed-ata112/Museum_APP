import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:main_program/Models/statistics.dart';
import 'package:main_program/Shop_Manager/all_statistics.dart';
import 'package:main_program/Shop_Manager/insert_goods.dart';
import 'package:main_program/Shop_Manager/Update_Souvenir.dart';
import'package:main_program/Accountant/change_password.dart';
import 'package:main_program/general_pages/login_page.dart';

Widget _buildTile(Widget child, {required Function() onTap}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child));
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {
        //   //
        // }),
        title: const Text("Home Page"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.bungalow, size: 30.0),
              onPressed: () {
                //
              }),
        ],
      ),
      body:
    Container(
        color: const Color(0xffE5E5E5),
        child: StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            children: [
              _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('Statistics',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 24)),
                            ],
                          ),
                          Material(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(24.0),
                              child: Center(
                                  child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.bar_chart,
                                                color: Colors.white,
                                                size: 30.0),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Icon(Icons.pie_chart,
                                                color: Colors.white,
                                                size: 30.0),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Icon(Icons.timeline,
                                                color: Colors.white,
                                                size: 30.0),
                                          ],
                                        ),
                                      ))))
                        ]),
                  ), onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Statistics()));
              }),
              _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('Insert New Goods',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 24)),
                            ],
                          ),
                          Material(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(24.0),
                              child: const Center(
                                  child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.add_box,
                                    color: Colors.white, size: 30.0),
                              )))
                        ]),
                  ), onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => insert_goods()));
              }),
              _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text('Update Existing Goods',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 24)),
                            ],
                          ),
                          Material(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(24.0),
                              child: const Center(
                                  child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.autorenew,
                                    color: Colors.white, size: 30.0),
                              )))
                        ]),
                  ), onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => update_goods()));
              }),
            ],
            staggeredTiles: [
              StaggeredTile.extent(2, 220.0),
              StaggeredTile.extent(2, 220.0),
              StaggeredTile.extent(2, 220.0),
            ]),
      ),
    drawer: Drawer(
    child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  //backgroundImage: AssetImage('Images/receptionist.png'),
                  radius: 50,
                ),
                //SizedBox(height: 300),
                //Text('Functionalities'),
                Align(
                  alignment: Alignment.topRight + Alignment(0, .8),
                  child: Text(
                    'Shop Manager',  //TODO : add the name of the user

                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],

            ), //,
          ),

          ListTile(
            title: const Text('Change Password'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> changePasswordAcc(username:'username'))

              );
              // Update the state of the app.
              // ...
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),//add border radius here
              child: Image.asset('Images/visitor.png'),//add image location here
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            title: const Text('Sign out'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login_page()));
              // Update the state of the app.
              // ...
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(1.0)),//add border radius here
              child: Image.asset('Images/event_tour.png'),//add image location here
            ),
          ),


          ])

    ));
  }
}
