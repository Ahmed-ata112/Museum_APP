import 'package:flutter/material.dart';

import '../controller.dart';

class Deleteusers extends StatelessWidget {
  List allIDs = [];
  String name;
  late dynamic chosenID;
  Deleteusers({Key? key, required this.allIDs, required this.name})
      : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Delete a $name",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 35.0,
                  ),
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    //hintText: "ID",
                    label: Text('Username'),

                    icon: Icon(
                      Icons.close,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                  items: allIDs.map((gg) {
                    return DropdownMenuItem(
                      value: gg.toString(),
                      child: Text(gg.toString()),
                    );
                  }).toList(),
                  onChanged: (val) {
                    chosenID = val;
                  },
                  validator: (val) => (val == null) ? "This is Required" : null,
                ),

                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //Sign up (submit) button
                ElevatedButton(
                    child: const Text(
                      "Delete!",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        //if the form from the client side is valid
                        print("All Valid at the client side:)");
                        //Server Validation Side
                        dynamic retV;

                        if (name == 'User') {
                          retV = await Controller.deleteUser(chosenID);
                        } else if (name == '') {}
                        print(retV);
                        if (retV == -1) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Error occured"),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          print('delete');
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Deleted Successfully"),
                            //allIDs.remove(chosenID);

                            backgroundColor: Colors.green,
                          ));
                          Navigator.pop(context);
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
