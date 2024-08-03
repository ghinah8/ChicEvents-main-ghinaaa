import 'package:chic_events/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class button extends StatelessWidget {
  button({this.ontap, required this.name});
  String? name;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            name!,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
