import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:main_program/controller.dart';

class GivePromo extends StatefulWidget {
  const GivePromo({Key? key}) : super(key: key);

  @override
  GivePromoState createState() => GivePromoState();
}

class GivePromoState extends State<GivePromo> {
  Map<String, dynamic> FormData = {
    'ID': null,
    'Promotion': null,
  };
  List<int> IDs = [];

  final _formKey = GlobalKey<FormState>();
  String error = "";

  Widget buildIDField() {
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: "Employee's ID",
          icon: Icon(Icons.perm_identity_rounded),
        ),
        items: IDs.map((gg) {
          return DropdownMenuItem(
            value: gg,
            child: Text(gg.toString()),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            FormData["ID"] = val;
          });
        },
        validator: (val) =>
        (val == null)
            ? "Please Choose ID"
            : null,
      ),
    );
  }

  Widget buildPromotionField() {
    return Padding(padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Promotion",
          icon: Icon(Icons.money),
        ),
        keyboardType: TextInputType.number,
        onChanged: (val) {
          setState(() => FormData['Promotion'] = val);
        },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'this field is required';
            }}
      ),
    );
  }

  void initState() {
    super.initState();
    Controller.getAllEmployeesIDs().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
          IDs.add(row);
        }
        setState(() {});
      });
    });}
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Give Promotion',
            style: TextStyle(
                color: Colors.black
            ),),
        ),
        body: Form(
          key: _formKey,
          child:
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              buildIDField(),
              buildPromotionField(),
              const SizedBox(height: 50),
              Padding(padding: const EdgeInsets.only(left: 130, right: 130),
                child: ElevatedButton(
                    child: const Text(
                      "Give Promotion!",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () async {
                      print(FormData);
                      if (_formKey.currentState!.validate()) {
                        //if the form from the client side is valid
                        print("All Valid at the client side:)");
                        //go and check if this credentials is valid from the server (DB) side
                        //i.e check if this account exists and if the email and password matches (are correct)

                        //Server Validation Side
                        dynamic retV =
                        await Controller.UpdateSalary(FormData);
                        //print(userType);
                        if (retV == -1) {
                          setState(() {
                            error = 'failed to update salary';
                          });
                        } else {
                          setState(() => error = "");
                          // navigate to member home
                          // pushes and never go back
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/accountant_home',
                                  (Route<dynamic> route) => false);
                        }
                      }
                    }),),
              Text(
                error,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: error.isEmpty ? 0.0 : 14.0),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      );
    }}



