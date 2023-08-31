import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/firebase/otp_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final mobileController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: mobileController,
                decoration: const InputDecoration(
                  hintText: "Mobile number",
                ),
                keyboardType: TextInputType.number,
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

                    if (formKey.currentState!.validate()) {
                      auth.verifyPhoneNumber(
                        phoneNumber: "+91${mobileController.text}",
                        verificationCompleted: (phoneAuthCredential) {},
                        verificationFailed: (error) {
                          customFlutterToast(error.code, bgColor: Colors.red);
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          customFlutterToast('Code Sent');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OTPScreen(verificationID: verificationId),
                              ));
                        },
                        codeAutoRetrievalTimeout: (verificationId) {},
                      );
                    }
                  },
                  child: const Text("Send Otp")),
            ],
          ),
        ),
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
