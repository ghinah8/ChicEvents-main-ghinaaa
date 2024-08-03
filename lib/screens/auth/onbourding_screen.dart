// ignore_for_file: camel_case_types

import 'package:chic_events/const.dart';
import 'package:flutter/material.dart';
import 'package:chic_events/screens/auth/signin_page.dart';

class onboarding_screen extends StatefulWidget {
  const onboarding_screen({super.key});

  @override
  State<onboarding_screen> createState() => _onboarding_screenState();
}

class _onboarding_screenState extends State<onboarding_screen> {
  ValueNotifier index1 = ValueNotifier(0);
  List<onboardingData> data = [
    onboardingData(
      image: 'assets/images/onbourding2.jpeg',
      title: 'Chic Events',
      subtitle: 'Plan for you special event',
      background: 'assets/images/Vector1.png',
      image2: 'assets/images/onbourding3.jpeg',
    ),
    onboardingData(
        image: 'assets/images/imadges.jpeg',
        title: 'Chic Events',
        subtitle: 'Organize with your own style',
        background: 'assets/images/Vector3.png',
        image2:
            'assets/images/pngtree-tour-guide-group-traveler-vacation-png-image_6063386.png'),
    onboardingData(
        image:
            'assets/images/pngtree-big-isolated-employee-working-in-office-interior-workplace-flat-vector-illustration-png-image_4367687.png',
        title: 'Chic Events',
        subtitle: 'Pay with a click from your phone',
        background: 'assets/images/Vector1.png',
        image2:
            'assets/images/pngtree-woman-lying-in-credit-card-png-image_5510931.jpg'),
  ];

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          itemCount: 3,
          onPageChanged: (page) {
            index1.value = page;
          },
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(data[index].background,
                    alignment: Alignment.bottomCenter),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            data[index].image,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            data[index].image2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 300,
                        height: 28,
                      ),
                      Text(
                        data[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'pacifico',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data[index].subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'pacifico',
                          fontSize: 22,
                        ),
                      ),
                      Row(children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: color2,
                              elevation: 0,
                              fixedSize: const Size(100, 70),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                signinpag.id,
                              );
                            },
                            child: const Text(
                              'SKIP',
                              style: TextStyle(
                                color: color2,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        const SizedBox(
                          width: 50,
                        ),
                        containerWidget(
                          isSelected: index == 0,
                        ),
                        const SizedBox(width: 5),
                        containerWidget(
                          isSelected: index == 1,
                        ),
                        const SizedBox(width: 5),
                        containerWidget(
                          isSelected: index == 2,
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        index == data.length - 1
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: color2,
                                  elevation: 0,
                                  fixedSize: const Size(100, 70),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, signinpag.id);
                                },
                                child: const Text(
                                  'Get Start',
                                  style: TextStyle(
                                    color: color2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: color2,
                                  elevation: 0,
                                  fixedSize: const Size(60, 60),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  pageController.nextPage(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.ease);
                                },
                                child: const Icon(Icons.arrow_forward)),
                      ]),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

class containerWidget extends StatelessWidget {
  const containerWidget({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 10,
        width: isSelected ? 20 : 12,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isSelected ? Colors.white : Colors.white24,
        ));
  }
}

class onboardingData {
  final String image;
  final String image2;
  final String title;
  final String subtitle;
  final String background;

  onboardingData(
      {required this.image,
      required this.image2,
      required this.title,
      required this.subtitle,
      required this.background});
}
