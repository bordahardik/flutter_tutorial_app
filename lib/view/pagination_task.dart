import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginationTask extends StatefulWidget {
  const PaginationTask({Key? key}) : super(key: key);

  @override
  State<PaginationTask> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationTask> {
  List<dynamic> productsItem = [];
  ScrollController scrollController = ScrollController();

  bool loading = false;
  int offset = 20;

  @override
  void initState() {
    super.initState();
    getProduct(offset);
    handleNext();
  }

  void getProduct(paraOffset) async {
    setState(() {
      loading = true;
    });

    log('===URL=== https://dummyjson.com/products?limit=$paraOffset');
    http.Response response = await http
        .get(Uri.parse('https://dummyjson.com/products?limit=$paraOffset'));
    var result = jsonDecode(response.body);

    log('===RES=== $result');

    productsItem = result['products'];
    int localOffset = offset + 20;
    setState(() {
      productsItem;
      loading = false;
      offset = localOffset;
    });
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        getProduct(offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Search Pagination Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: productsItem.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 3)
                        ]),
                    alignment: Alignment.center,
                    child: Text(productsItem[index]['title']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
