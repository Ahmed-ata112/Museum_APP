import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';

class GivePromo extends StatefulWidget {
  const GivePromo({Key? key}) : super(key: key);

  @override
  GivePromoState createState() => GivePromoState();
}

class GivePromoState extends State<GivePromo> {
  late String _ID;
  late String _salary;
  late String promotion;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Widget buildSalaryField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Colors.black,
          decoration: const InputDecoration(
              focusColor: Colors.black,
              labelText: 'Promotion',
              hintText: 'Employee Promotion'
          ),
          validator: (value)
          {
            if(value == null || value.isEmpty)
            {return 'This field is required';}
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              _salary = value;
            }
          }
      ),
    );
  }
  Widget buildIDField()
  {
    return Padding(padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField(onChanged: (dynamic value) {},
          hint: const Text('Employee ID'),
          items:
          List<DropdownMenuItem>.generate(5, (index)
          {
            return DropdownMenuItem(value: index,
                child: Text('item $index'));
          })
          ,
          onSaved: (dynamic value) {
            if (value != null) {_ID=value;}
          }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('New Employee',
          style: TextStyle(
              color: Colors.black
          ),),
      ),
      body: Form(
        key: formKey,
        child:
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            buildIDField(),
            buildSalaryField(),
            const SizedBox(height: 50),
            Padding(padding: const EdgeInsets.only(left: 130, right: 130),
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.person),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size.fromWidth(20)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                  onPressed: ()=> {
                    if(formKey.currentState!.validate())
                      {
                        formKey.currentState!.save(),
                        //TODO::insert into database
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Employee added successfully')),)
                      }
                  },
                  label: const Text(
                      'change salary',
                      style: TextStyle(color: Colors.black, fontSize: 18)
                  )),),
          ],
        ),
      ),
    );
  }
}




















