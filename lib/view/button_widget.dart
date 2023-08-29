import 'dart:developer';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Button Widget'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1500));
          },
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  log('ELEVATEDBUTTON');
                },
                onLongPress: () {
                  log('===long press===');
                },
                child: const Text('ElevatedButton'),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text('Material Button'),
                color: Colors.yellow,
                height: 150,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: Colors.red,
                elevation: 10,
                textColor: Colors.red,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Text('Sign Up'),
              ),
              SizedBox(height: 20),
              InkResponse(
                onTap: () {},
                child: Text('Sign Up'),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              Chip(
                label: Text('chip'),
                avatar: CircleAvatar(),
                onDeleted: () {},
              ),
              Tooltip(
                message: 'Hello',
                child: GestureDetector(
                  onTap: () {
                    log('GestureButton');
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
              TextButton(onPressed: () {}, child: Text('TextButton')),
              ButtonBar(
                children: [
                  TextButton(onPressed: () {}, child: Text('TextButton')),
                  TextButton(onPressed: () {}, child: Text('TextButton')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
