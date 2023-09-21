import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/preference_utils.dart';
import 'package:flutter_app/view/cart_screen.dart';
import 'package:flutter_app/view/favorites_screen.dart';
import 'package:flutter_app/view/firebase/firebase_auth_screen.dart';
import 'package:flutter_app/view/home_screen.dart';
import 'package:flutter_app/view/profile_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int bottomSelector = 0;

  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  var screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 150,
          height: 600,
          color: Colors.red,
        ),
      ),
      appBar: AppBar(),
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () async {
      //         await PreferenceUtils.setIsLogin(false);
      //         Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => FirebaseAuthScreen(),
      //             ));
      //       },
      //       icon: const Icon(Icons.logout),
      //     ),
      //   ],
      // ),
      body: screens[bottomSelector],
      // bottomNavigationBar: const BottomAppBar(
      //   height: 60,
      //   color: Colors.red,
      //   shape: CircularNotchedRectangle(),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: bottomSelector,
      //   onTap: (value) {
      //     setState(() {
      //       bottomSelector = value;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite), label: 'Favorite'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart), label: 'Cart'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle), label: 'Profile'),
      //   ],
      // ),

      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.titled,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }

  Future signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential authResult = await auth.signInWithCredential(credential);
    user = authResult.user;

    User? currentUser = auth.currentUser;
    assert(user!.uid == currentUser!.uid);

    log("====User Name==== ${user!.displayName}");
    log("====User Email==== ${user!.email}");
  }
}
