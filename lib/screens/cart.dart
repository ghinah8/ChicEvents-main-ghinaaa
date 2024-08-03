// ignore_for_file: must_be_immutable, library_private_types_in_public_api, camel_case_types

import 'package:chic_events/const.dart';
import 'package:chic_events/core/helper/showsnackbar.dart';
import 'package:chic_events/core/widgets/textfield.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> items = [
    CartItem(name: 'Venue', price: 20000.0),
    CartItem(name: 'Makeup Artist', price: 5000.0),
    CartItem(name: 'Caterers', price: 8000.0),
    CartItem(name: 'Bridal Wear', price: 10000.0),
    CartItem(name: 'Groom Wear', price: 5000.0),
    CartItem(name: 'Photographer', price: 2000.0),
  ];

  double get totalCost {
    return items.fold(0, (sum, item) => sum + item.price);
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: color4,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 440,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2.0),
            ),
            child: Image.asset(
                fit: BoxFit.fill,
                'assets/images/photo_2024-07-28_21-20-04.jpg'), // Replace 'your_image.png' with your image path
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Spent: \$${totalCost.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index].name),
                  subtitle: Text('\$${items[index].price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () => removeItem(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Payment.id2,
                );
              },
              // Add functionality for the "Pay" button here

              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.purple)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}

class Payment extends StatefulWidget {
  Payment({super.key});
  static String id2 = 'payment';

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? ischechecked = 0;
  int? ischechecked1 = 1;
  int? ischechecked2 = 2;
  int? ischechecked3 = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Selection'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Credit Card',
                    style: TextStyle(fontSize: 20, color: color2),
                  ),
                  Radio(
                    value: ischechecked1,
                    activeColor: color2,
                    onChanged: (data) {
                      setState(() {
                        ischechecked = data;
                      });
                    },
                    groupValue: ischechecked,
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cash Syriatel',
                    style: TextStyle(fontSize: 20, color: color2),
                  ),
                  Radio(
                    value: ischechecked2,
                    activeColor: color2,
                    onChanged: (data) {
                      setState(() {
                        ischechecked = data;
                      });
                    },
                    groupValue: ischechecked,
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cash MTN',
                    style: TextStyle(fontSize: 20, color: color2),
                  ),
                  Radio(
                    value: ischechecked3,
                    activeColor: color2,
                    onChanged: (data) {
                      setState(() {
                        ischechecked = data;
                      });
                    },
                    groupValue: ischechecked,
                  )
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (ischechecked == 1) {
                    } else {
                      if (ischechecked == 2) {
                        Navigator.pushNamed(
                          context,
                          SyriaTel.id,
                        );
                      } else {
                        if (ischechecked == 3) {
                          Navigator.pushNamed(
                            context,
                            Mtn.id,
                          );
                        } else {
                          showsnackbar(
                              context, 'Please choose way to pay first');
                        }
                      }
                    }
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.purple)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Pay',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Mtn extends StatelessWidget {
  const Mtn({super.key});
  static String id = 'Mtn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyWidget(image: 'photo_2024-07-28_22-44-28.jpg'));
  }
}

class SyriaTel extends StatelessWidget {
  const SyriaTel({super.key});
  static String id = 'Syria';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyWidget(image: 'photo_2024-07-28_23-02-59.jpg'));
  }
}

class creditcard extends StatelessWidget {
  const creditcard({super.key});
  static String id = 'Credit';
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key, required this.image});
  String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset('assets/images/$image'),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Scan QRcode',
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Number of bill',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: textfield(lab: 'Enter the number of bill'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _displayBottomSheet(context);
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.purple)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future _displayBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      barrierColor: const Color(0xffBDAEC6).withOpacity(0.6),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => const SizedBox(
            height: 150,
            width: 500,
            child: Padding(
              padding: EdgeInsets.only(top: 35, bottom: 9, left: 7, right: 5),
              child: Text(
                'Wait Admin to accept your order',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ));
}
