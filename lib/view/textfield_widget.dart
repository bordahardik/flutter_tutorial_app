import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Widget'),
        // centerTitle: true,

        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.search),
          Icon(Icons.settings),
        ],
        actionsIconTheme: IconThemeData(color: Colors.red),
        elevation: 10,
        shadowColor: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      // appBar: PreferredSize(
      // child: Container(
      //   color: Colors.red,
      // ),
      // preferredSize: Size.fromHeight(100)),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                // controller: emailController,
                cursorColor: Colors.red,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                // initialValue: 'hardik',
                textCapitalization: TextCapitalization.sentences,

                // enabled: false,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                  label: Text('address'),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  // FilteringTextInputFormatter.allow(
                  //     RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]')),
                ],
                decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    fillColor: Colors.red.withOpacity(0.4),
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.lock)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*';
                  } else {
                    return null;
                  }
                },
                // obscureText: true,
                // obscuringCharacter: '*',
              ),
              const SizedBox(height: 20),
              TextFormField(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: Text('submit'),
              ),
              const SizedBox(height: 20),
              RotatedBox(
                quarterTurns: 3,
                child: Text('Vagetable'),
              ),
              Transform.rotate(
                angle: -math.pi / 4,
                child: Text('Vagetable'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
