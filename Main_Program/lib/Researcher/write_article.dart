import 'package:flutter/material.dart';
import '../data_holders.dart';
import '../controller.dart';

class NewArticle extends StatefulWidget {
  final rId;
  const NewArticle({Key? key, required this.rId}) : super(key: key);
  @override
  NewArticleState createState() => NewArticleState();
}

class NewArticleState extends State<NewArticle> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Map<String, dynamic> article ;
  String _name = '';
  bool _finished = false;
  String content = '';
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
                  getArticleName();

                  if(_finished)
                  {article['state'] = 'F';}
                  else
                  {article['state'] = 'NF';}
                  article['content'] = content;
                  article['header'] = _name;
                  article['rId'] = widget.rId;
                  if(formKey.currentState!.validate())
                  {
                    formKey.currentState!.save();
                    Controller.insertNewArticle(article).then((result){
                      if(result == 1)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Article is saved successfully')),);
                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Something went wrong!')),);
                      }
                    });
                  }
                }
            ),
          ],
      backgroundColor: Colors.amber,
        title: const Text('New article',
        style: TextStyle(
            color: Colors.black
        ),

      ),),
      body: Form(
          key: formKey,
          child:
      TextFormField(
        keyboardType: TextInputType.multiline,
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'Cannot save empty article';}
            return null;
          },
          onSaved: (value) {
            if(value != null)
            {content = value;}
          },
        maxLines: null,
        decoration: const InputDecoration(
            focusColor: Colors.black,
            icon: Icon(Icons.article)
        ),
      ),
    )
    );
  }
}


class EditArticle extends StatefulWidget {
  final rId;
  final resArticle currArticle;
  const EditArticle({Key? key, required this.rId, required this.currArticle}) : super(key: key);

  @override
  EditArticleState createState() => EditArticleState();
}

class EditArticleState extends State<EditArticle> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Map<String, dynamic> article ;
  bool _finished = false;
  String content = '';
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
                if(_finished)
                {article['state'] = 'F';}
                else
                {article['state'] = 'NF';}
                article['content'] = content;
                article['id'] = widget.currArticle.id;
                article['rId'] = widget.rId;

                if(formKey.currentState!.validate())
                {
                  formKey.currentState!.save();
                  Controller.updateExistingArticle(article).then((result){
                    if(result == 1)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Article is updated successfully')),);
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Something went wrong!')),);
                    }
                  });
                }


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
        body: Form(
          key: formKey,
          child: TextFormField(
            initialValue: widget.currArticle.content,
            keyboardType: TextInputType.multiline,
            validator: (value)
            {
              if(value == null || value.isEmpty)
              {return 'Cannot save empty article';}
              return null;
            },
            onSaved: (value) {
              if(value != null)
              {content = value;}
            },
            maxLines: null,
            decoration: const InputDecoration(
                focusColor: Colors.black,
                icon: Icon(Icons.article)
            ),
          ),
        )
      );
    }
}
