import 'package:chic_events/core/models/product_model.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final PackageModel det;

  const Details({super.key, required this.det});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                widget.det.image,
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
                right: 20,
                top: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ],
                )),
            Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text(
                widget.det.name,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: Row(
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
                widget.det.rate.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(
                width: 24,
              ),
              const Icon(
                Icons.person_2_outlined,
                size: 24,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                widget.det.capacity.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.black54),
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
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                widget.det.name,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.black54,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'About',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.det.name,
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.black54,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Payment',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                widget.det.price.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 16),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
