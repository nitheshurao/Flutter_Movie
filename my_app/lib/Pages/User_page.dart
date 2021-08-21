import 'package:flutter/material.dart';
import 'package:my_app/util/%20UserSimplePreferences.dart';
import 'package:my_app/util/routes.dart';

import 'package:my_app/widgets/Button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  // final String idUser;

  // const UserPage({
  //   required Key key,
  //   required this.idUser,
  // }) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String Password = '';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    // name = UserSimplePreferences.getUsername() ?? '';
  }

  moveToHome(BuildContext context) async {
    // if (_formKey.currentState!.validate()) {
    setState(() {
      changeButton = true;
    });
    await UserSimplePreferences.setUsername(name);
    await UserSimplePreferences.setPassword(Password);
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.LoginRoute);
    setState(() {
      changeButton = false;
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepPurple,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                Text(
                  "Welcome ",
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
                          name = value;
                          setState(() {});
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
                          Password = value;
                          setState(() {});
                        },
                      )
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

  // @override
  // Widget build(BuildContext context) => Scaffold(
  //       body: SafeArea(
  //         child: ListView(
  //           padding: EdgeInsets.all(16),
  //           children: [
  //             // TitleWidget(icon: Icons.save_alt, text: 'Shared\nPreferences'),
  //             const SizedBox(height: 32),
  //             buildName(),
  //             const SizedBox(height: 12),
  //             buildPassword(), const SizedBox(height: 12),

  //             buildButton(),
  //           ],
  //         ),
  //       ),
  //     );

//   Widget buildName() => buildTitle(
//         title: 'Name',
//         child: TextFormField(
//           initialValue: name,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Your Name',
//           ),
//           onChanged: (name) => setState(() => this.name = name),
//         ),
//       );
//   Widget buildPassword() => buildTitle(
//         title: 'Password',
//         child: TextFormField(
//           initialValue: name,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Your Password',
//           ),
//           onChanged: (Password) => setState(() => this.Password = Password),
//         ),
//       );

//   Widget buildButton() => ButtonWidget(
//       text: 'Save',
//       onClicked: () async {
//         await UserSimplePreferences.setUsername(name);
//         await UserSimplePreferences.setPassword(Password);

//         await Navigator.pushNamed(context, MyRoutes.LoginRoute);
//       });

//   Widget buildTitle({
//     required String title,
//     required Widget child,
//   }) =>
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             "Welcome  ",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           child,
//         ],
//       );
// }
