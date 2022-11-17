

import 'package:flutter/material.dart';
import 'package:voice_app/login_page.dart';
import 'package:voice_app/register.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
    routes: {
      'login':(context) => LoginPage(),
      'register':(context) =>RegisterPage()
    }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}

