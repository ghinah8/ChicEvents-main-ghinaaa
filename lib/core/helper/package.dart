// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:chic_events/const.dart';
import 'package:flutter/material.dart';

class Package extends StatelessWidget {
  Package(
      {required this.name,
      required this.guest,
      required this.photo,
      required this.price});
  String? name;
  String? guest;
  String? price;
  String? photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 9,
                offset: const Offset(0, 3))
          ]),
      height: 200,
      width: 180,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Image.network(
              photo!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(name!),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              guest!,
              style: const TextStyle(color: color4, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              ' \$ $price onwards',
              style: const TextStyle(
                color: color2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
