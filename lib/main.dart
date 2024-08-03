// ignore_for_file: use_super_parameters

import 'package:chic_events/firebase_options.dart';
import 'package:chic_events/screens/auth/signin_page.dart';
import 'package:chic_events/screens/auth/signup_page.dart';
import 'package:chic_events/screens/cart.dart';
import 'package:chic_events/screens/home/presentation/home.dart';
import 'package:chic_events/screens/home/presentation/navbar.dart';
import 'package:chic_events/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/bloc/home_bloc.dart';
import 'screens/vendors/bloc/vendors_bloc.dart';
import 'screens/vendors/presentation/one.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      BlocProvider(
        create: (context) => VendorsBloc(),
      ),
    ],
    child: const Checevents(),
  ));
}

class GetStart1 extends StatelessWidget {
  const GetStart1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff4b173d),
    );
  }
}

class Checevents extends StatelessWidget {
  const Checevents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        signinpag.id: (context) => const signinpag(),
        signupag.id: (context) => signupag(),
        Myprofile.id: (context) => const Myprofile(),
        EditProfile.id1: (context) => const EditProfile(),
        support.id3: (context) => const support(),
        Payment.id2: (context) => Payment(),
        HomePage.id: (context) => HomePage(),
        One.id: (context) => const One(),
        Mtn.id: (context) => const Mtn(),
        SyriaTel.id: (context) => const SyriaTel(),
        creditcard.id: (context) => const creditcard(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'signinpag',
      home: const navbar(),
    );
  }
}
