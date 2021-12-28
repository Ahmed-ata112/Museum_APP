import 'package:flutter/material.dart';

class NewArticle extends StatefulWidget {
  const NewArticle({Key? key}) : super(key: key);

  @override
  NewArticleState createState() => NewArticleState();
}

class NewArticleState extends State<NewArticle> {
  String _name = '';
  bool _finished = false;
  TextFormField nameField = TextFormField();
  void getArticleName()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        nameField = TextFormField(decoration: const InputDecoration(
            hintText: 'Article header'
        ),

          onChanged: (value) {
              _name = value;},
        );

        return AlertDialog(
          title: const Text('Save work'),
          content: nameField,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Finished'),
                    subtitle: const Text('mark checked if you finished writing'),
                    value: _finished,
                    onChanged: (value) {
                      setState(() {
                        _finished = value??_finished;
                      });
                    },
                  );
                }
            ),
            TextButton(
              child: const Text('Save',
                style: TextStyle(color: Colors.black)
                ,),
              onPressed: () {
                if(_name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a header!')),);
                }
                else
                  {Navigator.of(context).pop();}
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
      IconButton(
      icon: const Icon(
          Icons.add_photo_alternate_outlined,
        color: Colors.black,),

        onPressed: (){

          //code to execute when this button is pressed
        }
    ),
            IconButton(
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,),

                onPressed: (){
                  //code to execute when this button is pressed
                  getArticleName();
                }
            ),
          ],
      backgroundColor: Colors.amber,
        title: const Text('New article',
        style: TextStyle(
            color: Colors.black
        ),

      ),),
      body: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
            focusColor: Colors.black,
            icon: Icon(Icons.article)
        ),
      ),
    );
  }
}


class EditArticle extends StatefulWidget {
  const EditArticle({Key? key}) : super(key: key);

  @override
  EditArticleState createState() => EditArticleState();
}

class EditArticleState extends State<EditArticle> {
  bool _finished = false;
  void isFinished() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text('Save work'),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Finished'),
                  subtitle: const Text('mark checked if you finished writing'),
                  value: _finished,
                  onChanged: (value) {
                    setState(() {
                      _finished = value ?? _finished;
                    });
                  },
                );
              }
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Save',
                style: TextStyle(color: Colors.black)
                ,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Colors.black,),

                onPressed: (){

                  //code to execute when this button is pressed
                }
            ),
            IconButton(
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,),

                onPressed: (){
                  //code to execute when this button is pressed
                  isFinished();
                }
            ),
          ],
          backgroundColor: Colors.amber,
          title: const Text('Article header',
            style: TextStyle(
                color: Colors.black
            ),

          ),),
        body: TextFormField(
          initialValue: 'last state of article body',
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
              focusColor: Colors.black,
              icon: Icon(Icons.article)
          ),
        ),
      );
    }
}
