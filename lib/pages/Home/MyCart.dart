import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

var data;
Future detail() async {
  final response = await http.get(
      Uri.parse(
          'https://wpr.intertoons.net/kmshoppyapi/api/v2/ProductDetails?urlKey=greenchef-lpg-stove-glass-top-crystal-3-burner&custId='
          '&guestId=4653631114&pincode="kmshoppy"&vendorUrlKey="kmshoppy"'),
      headers: {"vendorUrlKey": "kmshoppy"});
  if (response.statusCode == 200) {
    data = jsonDecode(response.body.toString());
  }
  // print("object");
  print(data["Data"]["TopCategories"].length);
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: detail(),
          builder: (context, snapshot) {
            return Text("data");
          }),
    );
  }
}
