import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/firebase_options.dart';
import 'package:prodsubecom/repository/global_var.dart';
import 'package:prodsubecom/view/auth/login_page.dart';
import 'package:prodsubecom/view/home_page.dart';
import 'package:prodsubecom/view/product_details_page.dart';
import 'package:prodsubecom/view/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
