import 'package:flutter/material.dart';

class textfiled extends StatelessWidget {
 textfiled({this.onChanged,required this.hint,required this.obsecure});
 
String? hint;
bool? obsecure;
Function(String)?onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obsecure!,
      validator: (value) {
        if(value!.isEmpty){
          return 'field is required';
        }
      },
      onChanged:onChanged ,
              decoration: InputDecoration(
                hintText: '$hint',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            );
  }
}