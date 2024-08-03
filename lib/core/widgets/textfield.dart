// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:chic_events/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class textfield extends StatelessWidget {
  textfield(
      {this.onchange, this.hint, @required this.lab, this.obscuretext = false});
  String? hint;
  String? lab;
  Function(String)? onchange;
  bool? obscuretext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext!,
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) return 'this field is required';
      },
      onChanged: onchange,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: color2,
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: color2,
          )),
          label: Text(
            lab!,
            style: const TextStyle(
              color: color2,
            ),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: color2,
          )),
          hintText: hint,
          hintStyle: const TextStyle(
            color: color3,
          )),
    );
  }
}
