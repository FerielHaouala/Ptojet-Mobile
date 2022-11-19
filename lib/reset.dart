
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class ResetPage extends StatefulWidget {

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> with SingleTickerProviderStateMixin {
   AnimationController _controller;
   final _emailController =TextEditingController();
   final auth =FirebaseAuth.instance;




  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('img/login.png'), fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left:35, top: 150),
                  child: Text('Reset\nyour password', style: TextStyle(
                    color: Colors.white, fontSize: 33
                  ),),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5, right :35, left: 35),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                           Container(
                            child: Material(
                            borderRadius: BorderRadius.circular((20.0)),
                            shadowColor: Color(0xff4c505b),
                            color: Color(0xff4c505b),
                            elevation: 7.0,
                            child :GestureDetector(
                               onTap: () {
                                 auth.sendPasswordResetEmail(email: _emailController.text.toString()).then((value){
                                   Utils().toastMessage('We have sent you an email to recover password, please check your emain');
                                 }).onError((error, stackTrace) {
                                   Utils().toastMessage(error.toString());
                                 })
                                 ;

    },
                              child: Center(
                              child:Text(
                            'Send request',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),),),),),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  icon: Icon(Icons.arrow_forward)
                            ),)
                          ],
                        ),


                      ],
                    ),
                  ),
                )
              ],
            ),
          )
          );
  }
}

class Utils {
  void toastMessage(String s) {}
}
