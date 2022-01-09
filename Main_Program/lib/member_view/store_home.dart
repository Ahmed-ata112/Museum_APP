import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:main_program/data_holders.dart';
import 'package:share_plus/share_plus.dart';
import '../controller.dart';
import 'package:like_button/like_button.dart';

Widget Souvenirs_Card(Souvenir sou, int idd, BuildContext context) {
  void _shareContent(String _content) {
    Share.share(_content);
  }

  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.end,
    image: Image.network(
      'http://placekitten.com/200/200',
      fit: BoxFit.cover,
    ),
    showImage: true,
    title: GFListTile(
      titleText: sou.Name,
      subTitleText: 'Price: \$${sou.price}',
    ),
    content: Text(sou.description),
    buttonBar: GFButtonBar(
      padding: EdgeInsets.all(12),
      children: <Widget>[
        ElevatedButton(
            onPressed: () {
              Share.share(sou.description);
            },
            child: Icon(Icons.share, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              primary: Colors.blue, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            )),
        ElevatedButton(
            onPressed: sou.quantity == 0
                ? null
                : () {
                    createAlterDialog(BuildContext context) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  "Are you sure you want to buy this?"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(
                                      context, false), // passing false
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Controller.BuyNewSouvenir(idd, sou.id, 1);
                                  }, // passing false
                                  child: const Text('Confirm'),
                                ),
                              ],
                            );
                          });
                    }

                    createAlterDialog(context);
                  },
            child: Icon(Icons.add_box_outlined, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              primary: Colors.blue, // <-- Button color
              onPrimary: Colors.red, // <-- Splash color
            )),
      ],
    ),
  );
}

class StoreHome extends StatefulWidget {
  final int Member_id;

  StoreHome({Key? key, required this.Member_id}) : super(key: key);

  @override
  _StoreHomeState createState() => _StoreHomeState(Member_id);
}

class _StoreHomeState extends State<StoreHome> {
  int Member_id;
  List<Souvenir> allSouvenirs = [];
  _StoreHomeState(this.Member_id);
  bool is_searching = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    Controller.getAllSouvenirs().then((ListOfSouvsRows) {
      setState(() {
        for (var row in ListOfSouvsRows) {
          //print(row);
          Souvenir eve =
              Souvenir(row[0], row[1], row[2], row[3], row[4], Member_id);
          allSouvenirs.add(eve);
        }
        setState(() {}); //just call it to update screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !is_searching,
        title: !is_searching
            ? Text("Available Souvenirs")
            : const TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'search names here',
                  hintStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
        actions: [
          is_searching
              ? IconButton(
                  icon: Icon(
                    Icons.cancel,
                  ),
                  onPressed: () {
                    setState(() {
                      this.is_searching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.is_searching = true;
                    });
                  },
                ),
        ],
      ),
      body: ListView.builder(
        itemCount:
            allSouvenirs.length, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return Souvenirs_Card(allSouvenirs[index], Member_id, context);
        },
      ),
    );
  }
}
