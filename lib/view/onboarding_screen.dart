import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/view/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);

  int pageChange = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  log('===page index===$value');
                  setState(() {
                    pageChange = value;
                  });
                },
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(
                        'assets/images/onBoarding1.png',
                        height: 300,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        'Share your vision',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'uef wer wer weri9 qweri ir weir werqWOPEq eqwire weiru 23e3r 348r 34wefxcmvf',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(
                        'assets/images/onBoarding2.png',
                        height: 300,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        'Setup and customization',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'uef wer wer weri9 qweri ir weir werqWOPEq eqwire weiru 23e3r 348r 34wefxcmvf',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(
                        'assets/images/onBoarding3.png',
                        height: 300,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        'Launch to Success',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'uef wer wer weri9 qweri ir weir werqWOPEq eqwire weiru 23e3r 348r 34wefxcmvf',
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    pageController.jumpToPage(2);
                  },
                  child: const Text('Skip',
                      style: TextStyle(color: Colors.black45)),
                ),
                Row(
                  children: List.generate(3, (index) {
                    return Container(
                      height: pageChange == index ? 12 : 8,
                      width: pageChange == index ? 12 : 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          color:
                              pageChange == index ? Colors.blue : Colors.grey,
                          shape: BoxShape.circle),
                    );
                  }),
                ),
                TextButton(
                  onPressed: () {
                    if (pageChange == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Text(pageChange == 2 ? 'Get Started!' : 'Next'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
