import 'package:flutter/material.dart';
class customTextfield extends StatelessWidget {
  final String hint;
  final IconData icon;
  String errorMessage(String s)
  {
      switch (hint) {
        case 'Enter his/her first name' :
          return 'Name is Empty';
      }

      switch (hint) {
        case 'Enter his/her Middle name' :
          return 'Name is Empty';
      }

      switch (hint) {
        case 'Enter his/her Last name' :
          return 'Name is Empty';
      }

      return 'value is empty';
    }
  customTextfield({required this.icon,required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding ( //put TextField in padding Widget
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child :TextFormField(
          validator: (value)
          {
            if(value != null && value.isEmpty)
              {
                return errorMessage(hint);
              }
             return '';
          } ,
          cursorColor: Colors.cyan,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color:Colors.cyan,
            ),
            filled: true,
            fillColor: Color.fromRGBO(0, 0, 210, 0.21),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:BorderSide(
                    color:Colors.cyan
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:BorderSide(
                    color:Colors.cyan
                )
            ),
          ),
        )
    );
  }
}