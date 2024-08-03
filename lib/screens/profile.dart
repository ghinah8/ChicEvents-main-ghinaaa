// ignore_for_file: override_on_non_overriding_member, must_be_immutable, sort_child_properties_last, camel_case_types, prefer_const_constructors_in_immutables

import 'package:chic_events/const.dart';
import 'package:chic_events/core/widgets/button.dart';
import 'package:chic_events/core/widgets/textfield.dart';
import 'package:chic_events/screens/auth/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});
  static String id = 'myprofile';
  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color4,
        title: const Text('Profile'),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 580,
                width: 380,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3))
                ], borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 580,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 140, left: 20, right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    EditProfile.id1,
                                  );
                                },
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              width: 170,
                            ),
                            const Icon(FontAwesomeIcons.angleRight)
                          ],
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 202, 202, 202),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              const Icon(FontAwesomeIcons.teamspeak),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      support.id3,
                                    );
                                  },
                                  child: const Text(
                                    'Support',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 196,
                              ),
                              const Icon(FontAwesomeIcons.angleRight)
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 202, 202, 202),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              const Icon(
                                  FontAwesomeIcons.arrowRightFromBracket),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const signinpag()),
                                        (route) => false);
                                  },
                                  child: const Text(
                                    'Log Out',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                width: 198,
                              ),
                              const Icon(FontAwesomeIcons.angleRight)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/profile-circle-icon-2048x2048-cqe5466q.png'),
                    maxRadius: 65,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Ghina Habib',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '099435646',
                  style: TextStyle(fontSize: 18, color: color3),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  static String id1 = 'editprofile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile-circle-icon-2048x2048-cqe5466q.png'),
                maxRadius: 65,
              ),
              const SizedBox(
                height: 40,
              ),
              const Align(
                child: Text(
                  'User name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 5,
              ),
              textfield(
                lab: '',
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                child: Text(
                  'Phone Number',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 5,
              ),
              textfield(
                lab: '',
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                child: Text(
                  'Email address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 5,
              ),
              textfield(
                lab: '',
              ),
              const SizedBox(
                height: 30,
              ),
              button(name: 'Save')
            ],
          ),
        ]),
      ),
    );
  }
}

class support extends StatelessWidget {
  const support({super.key});

  static String id3 = 'support';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(
              height: 250,
              width: 300,
              child: Image(
                  image: AssetImage(
                'assets/images/servicihho-post-venta.png',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Write us',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Let\'s us know your requirement ',
                      style: TextStyle(color: color3),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textfield(
                    lab: '',
                    hint: 'Enter your name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textfield(
                    lab: '',
                    hint: 'Enter your Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Message',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textfield(
                    lab: '',
                    hint: 'Write message here',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  button(name: 'Send')
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
