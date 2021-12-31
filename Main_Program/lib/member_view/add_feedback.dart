import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Add_Feedback extends StatefulWidget {
  const Add_Feedback({Key? key}) : super(key: key);

  @override
  _Add_FeedbackState createState() => _Add_FeedbackState();
}

class _Add_FeedbackState extends State<Add_Feedback> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        //padding: EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Form(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Add a Feedback!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  //Name
                  Text(
                    "your Rating!",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 20.0),

                  Center(
                    child: RatingBar.builder(
                      itemSize: 40,
                      wrapAlignment: WrapAlignment.spaceEvenly,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      //itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Your Name",
                      // icon: Icon(Icons.drive_file_rename_outline),
                    ),
                    onChanged: (val) {},
                  ),
                  //Email

                  const SizedBox(height: 20.0),
                  //Phone Number
                  const SizedBox(height: 20.0),
                  TextFormField(
                    maxLines: null, // makes it long if needed
                    decoration: InputDecoration(
                      hintText: "your opinion",
                      icon: Icon(Icons.drive_file_rename_outline),
                      // to make it multi line
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {},
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () async {}),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                  Text(
                    "error",
                    style: TextStyle(
                        color: Colors.red, fontSize: "".isEmpty ? 0.0 : 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
