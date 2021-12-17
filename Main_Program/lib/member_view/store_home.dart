import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_button_type.dart';

Widget Souvenirs_Card() {
  return GFCard(
    boxFit: BoxFit.cover,
    titlePosition: GFPosition.end,
    image: Image.network(
      'http://placekitten.com/200/200',
      fit: BoxFit.cover,
    ),
    showImage: true,
    title: GFListTile(
      titleText: 'Souvenirs Name',
      subTitleText: 'Price: \$33',
    ),
    content: Text(
        "Some quick example text to build on the card ,Some quick example text to build on the card,Some quick example text to build on the card"),
    buttonBar: GFButtonBar(
      padding: EdgeInsets.all(12),
      children: <Widget>[
        GFAvatar(
          backgroundColor: GFColors.PRIMARY,
          child: Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        GFAvatar(
          backgroundColor: GFColors.SUCCESS,
          child: Icon(
            Icons.add_box_outlined,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

class StoreHome extends StatefulWidget {
  const StoreHome({Key? key}) : super(key: key);

  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  bool is_searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !is_searching
            ? Text("Available Souvenirs")
            : TextField(
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
        itemCount: 5, // should be dynamic -> retrieve articles
        itemBuilder: (context, index) {
          return Souvenirs_Card();
        },
      ),
    );
  }
}
