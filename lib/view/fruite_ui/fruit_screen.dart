import 'package:flutter/material.dart';

class FruitScreen extends StatefulWidget {
  const FruitScreen({Key? key}) : super(key: key);

  @override
  State<FruitScreen> createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Material(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: screenSize.width / 1.8,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFB9B53B),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 70),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        buildAppBar(),
                        const SizedBox(height: 20),
                        searchBarWidget()
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) {
                        return Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFFB9B53B).withOpacity(0.2),
                                  blurRadius: 15,
                                )
                              ]),
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.free_breakfast_outlined,
                                size: 45,
                                color: Color(0xFFB9B53B),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Vegetables',
                                style: TextStyle(
                                  color: Color(0xFFB9B53B),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          labelWidget(title: 'Popular Foodstuffs'),
        ],
      ),
    );
  }

  /// LABEL WIDGET
  Widget labelWidget({String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          TextButton(
            child: const Text(
              'View all >',
              style: TextStyle(color: Color(0xFFB9B53B)),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  /// SEARCHBAR WIDGET
  Widget searchBarWidget() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Search foodstuffs',
          hintStyle: const TextStyle(color: Color(0xFFB9B53B)),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFFB9B53B),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
    );
  }

  /// APPBAR
  Widget buildAppBar() {
    return Row(
      children: [
        const Icon(Icons.menu, color: Colors.white),
        const Spacer(),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                color: Color(0xFFB9B53B),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: const Color(0xFFB9B53B),
                    borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                child: const Text(
                  '4',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: const Color(0xFFFDC64C),
              borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          child: const Icon(
            Icons.person,
            color: Color(0xFFB9B53B),
          ),
        ),
      ],
    );
  }
}
