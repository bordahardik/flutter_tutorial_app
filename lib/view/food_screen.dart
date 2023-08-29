import 'dart:developer';

import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    log('===H===${screenSize.height}');
    log('===W===${screenSize.width}');

    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),

            /// AppBar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.more_vert, color: Colors.red),
                  Icon(Icons.filter_list, color: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 50,
                width: screenSize.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                      ),
                    ]),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(
                  Icons.search,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// label heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Favourites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// favourites widget
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Vegetables Sandwich',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '4.3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '(423)',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$24.00',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Vegetables Sandwich',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '4.3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '(423)',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$24.00',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Vegetables Sandwich',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '4.3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '(423)',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$24.00',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Vegetables Sandwich',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '4.3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '(423)',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$24.00',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: const Text(
                                    'Add',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg'),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Image.network(
                    'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg',
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
