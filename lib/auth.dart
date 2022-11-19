import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'login_page.dart';
import 'reset.dart';
class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "user message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account creation failed"),
          messageText: Text(
            e.toString(),
            style: TextStyle(
                color: Colors.white
            ),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed"),
          messageText: Text(
            e.toString(),
            style: TextStyle(
                color: Colors.white
            ),
          ));
    }
  }

  }

