import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/preference_utils.dart';
import 'package:flutter_app/view/bottom_nav_screen.dart';
import 'package:flutter_app/view/food_screen.dart';
import 'package:flutter_app/view/fruite_ui/fruit_screen.dart';
import 'package:flutter_app/view/home_screen.dart';
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

      home: FruitScreen(),
    );
  }
}
