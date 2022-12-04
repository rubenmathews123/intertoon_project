import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

var data;
Future homePageProducts() async {
  final response = await http.get(
      Uri.parse(
          'https://wpr.intertoons.net/kmshoppyapi/api/v2/FeaturedProduct?custId='
          '&guestId='
          ''),
      headers: {"vendorUrlKey": "kmshoppy"});
  if (response.statusCode == 200) {
    data = jsonDecode(response.body.toString());
  }
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdbdbde),
      body: FutureBuilder(
          future: homePageProducts(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: data["Data"].length,
                itemBuilder: (context, index) {
                  String oldUrl = data["Data"][index]["imageUrl"];
                  String newUrl =
                      "https://wpr.intertoons.net/kmshoppyadmin/$oldUrl";
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFf3f3f4),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: Column(
                              children: [Image.network(newUrl)],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
          }),
    );
  }
}
