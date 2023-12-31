import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/preference_utils.dart';
import 'package:flutter_app/view/firebase/phone_number_screen.dart';
import 'package:flutter_app/view/home_screen.dart';

class FirebaseAuthScreen extends StatefulWidget {
  const FirebaseAuthScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseAuthScreen> createState() => _FirebaseAuthScreenState();
}

class _FirebaseAuthScreenState extends State<FirebaseAuthScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                accountName: Text('Hello'),
                accountEmail: Text('abc@gmail.com')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formGlobalKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: userController,
                  decoration: const InputDecoration(hintText: "Username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '*';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (formGlobalKey.currentState!.validate()) {
                        log('===EMAIL===${emailController.text}');
                        log('===PASSWORD===${passController.text}');

                        auth
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passController.text)
                            .then((value) => log('===REGISTER RES===$value'))
                            .catchError((e) {
                          log('===REGISTER ERROR===Code ${e.code}');
                          log('===REGISTER ERROR===Message ${e.message}');

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.message),
                          ));
                        });
                      }
                    },
                    child: const Text("Register")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (formGlobalKey.currentState!.validate()) {
                        log('===EMAIL===${emailController.text}');
                        log('===PASSWORD===${passController.text}');

                        auth
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passController.text)
                            .then((value) => log('===LOGIN RES===$value'))
                            .catchError((e) {
                          log('===LOGIN ERROR===Code ${e.code}');
                          log('===LOGIN ERROR===Message ${e.message}');

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(e.message),
                          ));
                        });
                      }
                    },
                    child: const Text("Firebase Auth LOGIN")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      log('===UID===${auth.currentUser!.uid}');
                      log('===EMAIL===${auth.currentUser!.email}');
                    },
                    child: const Text("Current User")),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      await auth.signOut();
                    },
                    child: const Text("LogOut")),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneNumberScreen(),
                          ));
                    },
                    child: const Text("Phone OTP")),
                ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      await PreferenceUtils.setIsLogin(true);
                      await PreferenceUtils.setUserName(userController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    child: const Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
