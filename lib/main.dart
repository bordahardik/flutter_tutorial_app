import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/preference_utils.dart';
import 'package:flutter_app/view/firebase/firebase_auth_screen.dart';
import 'package:flutter_app/view/home_screen.dart';
import 'package:flutter_app/view/listview_widget.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    log('===IS LOGIN===${PreferenceUtils.getIsLogin()}');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.green),

      home: PreferenceUtils.getIsLogin() ? HomeScreen() : FirebaseAuthScreen(),
    );
  }
}
