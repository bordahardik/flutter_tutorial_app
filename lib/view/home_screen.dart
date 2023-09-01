import 'package:flutter/material.dart';
import 'package:flutter_app/utils/preference_utils.dart';
import 'package:flutter_app/view/firebase/firebase_auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () async {
              await PreferenceUtils.setIsLogin(false);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirebaseAuthScreen(),
                  ));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          // Stack(
          //   alignment: Alignment.center,
          //   clipBehavior: Clip.none,
          //   children: [
          //     Container(
          //       height: 200,
          //       width: 200,
          //       color: Colors.red,
          //     ),
          //     Container(
          //       height: 150,
          //       width: 150,
          //       color: Colors.yellow,
          //     ),
          //     Positioned(
          //       top: -20,
          //       right: -20,
          //       child: Container(
          //         height: 100,
          //         width: 100,
          //         color: Colors.blue,
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 20),
          Text(PreferenceUtils.getUserName()),
        ],
      ),
    );
  }
}
