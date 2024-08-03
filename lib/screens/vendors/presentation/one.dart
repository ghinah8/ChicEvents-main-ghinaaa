// ignore_for_file: camel_case_types

import 'package:chic_events/const.dart';
import 'package:chic_events/core/firestore/status.dart';
import 'package:chic_events/core/models/category_model.dart';
import 'package:chic_events/screens/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/vendors_bloc.dart';
import 'Venue.dart';

class One extends StatefulWidget {
  const One({super.key});
  static String id = 'one';
  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  void initState() {
    context.read<VendorsBloc>().add(IndexVendorsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: color4,
        title: const Text(
          'Vendors',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<VendorsBloc, VendorsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: switch (state.indexStatus) {
              RequestStatus.failed => MainErrorWidget(onPressed: () {
                  context.read<VendorsBloc>().add(IndexVendorsEvent());
                }),
              RequestStatus.loading => ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade200,
                        child: Vendors(
                          ven: CategoryModel(
                              id: '', image: '', name: '', description: ''),
                        ),
                      )),
              RequestStatus.success => ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) => Vendors(
                        ven: state.categories[index],
                      )),
              _ => const SizedBox(),
            },
          );
        },
      ),
    );
  }
}

class Vendors extends StatelessWidget {
  final CategoryModel ven;

  const Vendors({super.key, required this.ven});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Venue(
                venE: ven,
              );
            },
          ));
        },
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(0, 3),
                blurRadius: 3,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(ven.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ven.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      ven.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Ven {
  final String image;
  final String text;
  final String title;
  final List<ElementVen> listElement;

  Ven(
      {required this.image,
      required this.text,
      required this.title,
      required this.listElement});
}

class ElementVen {
  final String imageE;
  final String textE;
  final String price;
  final String size;
  final String rate;
  final String location;
  final String about;

  ElementVen({
    required this.imageE,
    required this.textE,
    required this.price,
    required this.size,
    required this.rate,
    required this.location,
    required this.about,
  });
}
