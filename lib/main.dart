import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:voice_app/auth.dart';
import 'package:voice_app/login_page.dart';
import 'package:voice_app/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
    routes: {
      'login':(context) => LoginPage(),
      'register':(context) =>RegisterPage()
    }
  ));
}





