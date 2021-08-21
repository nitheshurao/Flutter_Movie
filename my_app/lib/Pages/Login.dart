// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/util/%20UserSimplePreferences.dart';
// import 'package:my_app/util/%20UserSimplePreferences.dart';
// import 'package:my_app/util/UserSimplePreferences.dart';
// import 'package:my_app/util/%20UserSimplePreferences.dart';
// import 'package:flushbar/flushbar_route.dart';
import 'package:my_app/util/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  String username = '';
  String password = '';
  String Upassword = '';

  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;

  @override
  void initState() {
    super.initState();
    name = UserSimplePreferences.getUsername() as String;
    password = UserSimplePreferences.getUserpassword() as String;
  }

//

//

  moveToHome(BuildContext context) async {
    // if (_formKey.currentState!.validate()) {
    if (name == username && password == Upassword) {
      setState(() {
        changeButton = true;
      });
      // await UserSimplePreferences.setUsername(username);
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }

    // }
  }

  moveToSignup(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.RRouter);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepPurple,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Login_Page.png",
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  "Welcome $name  ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter User Name",
                            labelText: "User name"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Cant be Emapty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          username = value;
                          // setState(() {
                          //   username = value;
                          // });
                        },
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "User Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password Cant be Emapty";
                            } else if (value.length < 6) {
                              return "Password length should be at least 6";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            Upassword = value;
                            // setState(() {
                            //   Upassword = value;
                            // });
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 20 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),

                    //  async {
                    //   print("Hii");
                    //   setState(() {
                    //     changeButton = true;
                    //   });
                    // await Future.delayed(Duration(seconds: 1));
                    // await Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    // setState(() {
                    //   changeButton = false;
                    // });
                    // },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "LogIn",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                      //   decoration: BoxDecoration(
                      //       color: Colors.deepPurple,)
                    ),
                  ),
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 20 : 8),
                  child: InkWell(
                    onTap: () => moveToSignup(context),

                    //  async {
                    //   print("Hii");
                    //   setState(() {
                    //     changeButton = true;
                    //   });
                    // await Future.delayed(Duration(seconds: 1));
                    // await Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    // setState(() {
                    //   changeButton = false;
                    // });
                    // },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                      //   decoration: BoxDecoration(
                      //       color: Colors.deepPurple,)
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       print("Hii");
                //       Navigator.pushNamed(context, MyRoutes.HomeRoute);
                //     },
                //     child: Text("Login"),
                //     style: TextButton.styleFrom(minimumSize: Size(100, 30)))
              ],
            ),
          ),
        ));
  }
}
