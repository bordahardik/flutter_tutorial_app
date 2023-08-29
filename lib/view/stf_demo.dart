import 'dart:developer';

import 'package:flutter/material.dart';

class STFDemo extends StatefulWidget {
  const STFDemo({Key? key}) : super(key: key);

  @override
  State<STFDemo> createState() => _STFDemoState();
}

class _STFDemoState extends State<STFDemo> {
  int counter = 25;
  bool onOff = false;
  bool isCheck = false;
  double isSlider = 20;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    log('=========build========');
    return Scaffold(
      appBar: AppBar(
        title: Text('STF Widget'),
      ),
      body: Column(
        children: [
          Text('Counter $counter'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });

              log('===$counter');
            },
            child: Text('Add'),
          ),
          Switch(
            value: onOff,
            onChanged: (value) {
              log('====Switch====$value');

              setState(() {
                onOff = value;
              });
            },
          ),
          Checkbox(
            value: isCheck,
            onChanged: (value) {
              setState(() {
                isCheck = value!;
              });
            },
          ),
          Slider(
            value: isSlider,
            divisions: 100,
            label: '${isSlider.round()}',
            onChanged: (value) {
              setState(() {
                isSlider = value;
              });
            },
            max: 100,
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: isVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'password',
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Image.asset(
                    isVisible
                        ? 'assets/icons/hide.png'
                        : 'assets/icons/visible.png',
                    scale: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
