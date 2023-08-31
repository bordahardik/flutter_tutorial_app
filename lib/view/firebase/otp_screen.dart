import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.verificationID}) : super(key: key);

  final String verificationID;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  String? verifyId;

  @override
  void initState() {
    verifyId = widget.verificationID;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: otpController,
            decoration: const InputDecoration(
              hintText: "Enter otp",
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
              onPressed: () async {
                FocusScope.of(context).unfocus();

                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verifyId!, smsCode: otpController.text);

                  await FirebaseAuth.instance.signInWithCredential(credential);
                  customFlutterToast('Verification done!!!');
                } on FirebaseAuthException catch (e) {
                  customFlutterToast(e.code, bgColor: Colors.red);
                }
              },
              child: const Text("Submit Otp")),
        ],
      ),
    );
  }

  customFlutterToast(String msg, {Color bgColor = Colors.green}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
