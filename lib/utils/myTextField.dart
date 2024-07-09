import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  final String hinttext;
  //final String colName;

  MyTextField({super.key, 
    required this.controller,
    required this.hinttext,
    //required this.colName
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hinttext,
          fillColor: const Color.fromRGBO(203, 240, 255, 0.37),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter $hinttext";
        }
        return null;
      },
    );
  }
}
