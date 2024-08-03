// ignore_for_file: camel_case_types, use_super_parameters, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:chic_events/const.dart';
import 'package:chic_events/core/helper/showsnackbar.dart';
import 'package:chic_events/core/widgets/button.dart';
import 'package:chic_events/core/widgets/textfield.dart';
import 'package:chic_events/screens/auth/signin_page.dart';
import 'package:chic_events/screens/home/presentation/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class signupag extends StatefulWidget {
  signupag({Key? key}) : super(key: key);
  static String id = 'signupag';

  @override
  State<signupag> createState() => _signupagState();
}

class _signupagState extends State<signupag> {
  String? email;

  String? password;
  String? firstname;
  String? lastname;
  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formkey,
          child: ListView(children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Chic Events',
                  style: TextStyle(
                      fontSize: 32, fontFamily: 'pacifico', color: color2),
                ),
                const SizedBox(
                  height: 50,
                ),
                //i cann but a row widget
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign UP',
                      style: TextStyle(
                        fontSize: 24,
                        color: color2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: textfield(
                    onchange: (data) {
                      email = data;
                    },
                    lab: 'Email',
                    hint: 'youremail@gmail.com',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: textfield(
                      onchange: (data) {
                        password = data;
                      },
                      lab: 'Password',
                      obscuretext: true,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: textfield(
                    onchange: (data) {
                      firstname = data;
                    },
                    lab: 'User Name ',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: button(
                        ontap: () async {
                          if (formkey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            try {
                              await sginupuser();
                              Navigator.pushNamed(context, HomePage.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showsnackbar(context, 'weak password');
                              } else if (e.code == 'email-already-in-use') {
                                showsnackbar(context, 'email already exsist');
                              }
                            } catch (e) {
                              showsnackbar(context, 'there was an erorr');
                            }
                            isloading = false;
                            setState(() {});
                          }
                        },
                        name: 'Sign Up'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account:',
                      style: TextStyle(color: color3),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          signinpag.id,
                        );
                      },
                      child: const Text(' Sign in',
                          style: TextStyle(
                            color: color3,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 92,
                ),
                Image.asset(
                  'assets/images/pngimg.com - party_PNbG45.png',
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> sginupuser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
