import 'package:chic_events/core/firestore/status.dart';
import 'package:chic_events/core/models/category_model.dart';
import 'package:chic_events/core/models/product_model.dart';
import 'package:chic_events/screens/details.dart';
import 'package:chic_events/screens/home/presentation/home.dart';
import 'package:chic_events/screens/vendors/bloc/vendors_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Venue extends StatefulWidget {
  final CategoryModel venE;

  const Venue({super.key, required this.venE});

  @override
  State<Venue> createState() => _VenueState();
}

class _VenueState extends State<Venue> {
  @override
  void initState() {
    context
        .read<VendorsBloc>()
        .add(IndexProductsByCategory(categoryId: widget.venE.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          widget.venE.name,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, top: 7, bottom: 7),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ],
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<VendorsBloc, VendorsState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  height: 750,
                  child: switch (state.indexProductsStatus) {
                    RequestStatus.failed => MainErrorWidget(onPressed: () {
                        context.read<VendorsBloc>().add(IndexProductsByCategory(
                            categoryId: widget.venE.id));
                      }),
                    RequestStatus.success => switch (state.products.length) {
                        > 0 => ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  CardElement(element: state.products[index]),
                            ),
                            itemCount: state.products.length,
                          ),
                        _ => const Center(
                            child: Text('There Is No Items Yet'),
                          )
                      },
                    RequestStatus.loading => ListView.builder(
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.grey.shade200,
                          child: CardElement(
                              element: PackageModel(
                                  id: '',
                                  image: '',
                                  price: 0,
                                  rate: 0,
                                  capacity: 0,
                                  name: '')),
                        ),
                        itemCount: 5,
                      ),
                    _ => const SizedBox(),
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardElement extends StatelessWidget {
  final PackageModel element;

  const CardElement({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(det: element),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 350,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                element.image,
                              ),
                              fit: BoxFit.fill)),
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: InkWell(
                            onTap: () {},
                            child: const Icon(Icons.favorite_border)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Text(
                      element.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border_outlined,
                            size: 24,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            element.rate.toString(),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_2_outlined,
                              size: 24,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              element.capacity.toString(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.messenger_outline,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.phone_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Text(
                      element.price.toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
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
