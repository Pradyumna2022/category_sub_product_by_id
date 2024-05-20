import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/view/auth/login_page.dart';
import 'package:prodsubecom/view/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (timer) {
      if (user != null) {
        if (mounted) {
          Get.off(HomePage(),
              transition: Transition.fade, duration: Duration(seconds: 1));
        }
      } else {
        if (mounted) {
          Get.off(LoginPage(),
              transition: Transition.fadeIn, duration: Duration(seconds: 1));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset(
      'lib/assets/return.png',
      width: 120,
    )));
  }
}
