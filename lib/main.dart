import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sportify/screens/app.dart';
import 'package:flutter/services.dart';
import 'package:sportify/screens/signIn.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sportify/screens/firebase/auth_conf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));

  runApp(
    GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
      title: 'Spotify Clone',
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: const SignInScreen(),
    ),
  );
}
