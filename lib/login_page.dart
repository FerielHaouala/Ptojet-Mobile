import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voice_app/reset.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
   AnimationController _controller;



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
    var emailController = TextEditingController();
    var passwordContoller = TextEditingController();
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('img/login.png'), fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left:35, top: 150),
                  child: Text('Welcome\nBack', style: TextStyle(
                    color: Colors.white, fontSize: 33
                  ),),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5, right :35, left: 35),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
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
                        TextField(
                          controller: passwordContoller,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                           Container(
                             height: 60,
                             width: 100,
                            child: Material(
                            borderRadius: BorderRadius.circular((20.0)),
                            shadowColor: Color(0xff4c505b),
                            color: Color(0xff4c505b),
                            elevation: 7.0,
                            child :GestureDetector(
                               onTap: () async {
                                  AuthController.instance.login(emailController.text.trim(),passwordContoller.text.trim());
    },
                              child: Center(
                              child:Text(
                            'Sign In',
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
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  icon: Icon(Icons.arrow_forward)
                            ),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Color(0xff4c505b)
                                  ),
                                )),
                            TextButton(
                                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ResetPage())),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 18,
                                      color: Color(0xff4c505b)
                                  ),
                                ))
                          ],
                        )
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
