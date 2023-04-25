import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences/home.dart';
import 'package:shared_prefrences/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    logedIn();
  }

  void logedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool logedIn = sp.getBool("logedIn") ?? false;
    if (logedIn) {
      Timer(const Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeSctreen()));
      });
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  LoginPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        width: double.infinity,
        height: double.infinity,
        child: const Image(
          image: AssetImage("assets/images/abc.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
