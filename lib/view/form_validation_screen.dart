import 'package:flutter/material.dart';
import 'package:flutter_app/view/button_widget.dart';

class FormValidationScreen extends StatelessWidget {
  FormValidationScreen({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form validation example'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formGlobalKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter password";
                      } else {
                        bool result = validatePassword(value);
                        if (result) {
                          return null;
                        } else {
                          return "Password should contain Capital, small letter & Number & Special";
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: cPassController,
                    decoration: const InputDecoration(
                      labelText: "Confirm password",
                    ),
                    obscureText: false,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Empty';
                      }
                      if (val != passController.text) {
                        return 'Not Match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                        }
                      },
                      child: const Text("Submit")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ButtonWidget(),
                            ));
                      },
                      child: const Text("Next"))
                ],
              ),
            ),
          ),
        ));
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  bool validatePassword(String pass) {
    RegExp passValid =
        RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?=.*[0-9])");
    String password = pass.trim();
    if (passValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }
}
