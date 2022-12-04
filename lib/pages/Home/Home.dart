import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

var data;
Future getProducts() async {
  final response = await http.get(
      Uri.parse(
          'https://wpr.intertoons.net/kmshoppyapi/api/v2/Products/HomeProducts'),
      headers: {"vendorUrlKey": "kmshoppy"});
  if (response.statusCode == 200) {
    data = jsonDecode(response.body.toString());
  }
  // print("object");
  print(data["Data"]["TopCategories"].length);
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        // itemCount: data["Data"]["MobileMainBanners"][snapshot]
                        //         ["teID"]
                        //     .length,
                        // itemCount: data["Data"]["TopCategories"].length,
                        itemCount: data["Data"]["Category4in1x2"].length,
                        itemBuilder: (context, index1) {
                          // String oldUrl =
                          //     data["Data"]["MobileMainBanners"][index]["imageUrl"];
                          // String newUrl =
                          //     "https://wpr.intertoons.net/kmshoppyadmin/$oldUrl";
                          return Center(
                            // child: Text("data"),
                            child: Column(
                              children: [
                                // Text(data["Data"]["MobileMainBanners"][index]
                                //         ["teId"]
                                //     .toString()),
                                // Container(
                                //     width: 100,
                                //     height: 50,
                                //     decoration: BoxDecoration(
                                //         image: DecorationImage(
                                //             image: NetworkImage(newUrl)))),
                                // // Image.network(newUrl),
                                // Text(data["Data"]["TopCategories"][index]["catName"]
                                //     .toString())
                                Text(data["Data"]["Category4in1x2"][index1]
                                        ["catname"]
                                    .toString())
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 50),
                  Expanded(
                      child: ListView.builder(
                          itemCount: data["Data"]["Category4in1x2"].length,
                          itemBuilder: (contex, index2) {
                            return Center(
                                child: Column(
                              children: [
                                Text(data["Data"]["Category4in1x2"][index2]
                                        ["catname"]
                                    .toString())
                              ],
                            ));
                          })),
                  SizedBox(height: 50),
                  Expanded(
                      child: ListView.builder(
                          itemCount: data["Data"]["Category4in1"].length,
                          itemBuilder: (contex, index3) {
                            return Center(
                                child: Column(
                              children: [
                                Text(data["Data"]["Category4in1"][index3]
                                        ["catname"]
                                    .toString())
                              ],
                            ));
                          })),
                  SizedBox(height: 50),
                  Expanded(
                      child: ListView.builder(
                          itemCount: data["Data"]["Category5in1x2"].length,
                          itemBuilder: (contex, index4) {
                            return Center(
                                child: Column(
                              children: [
                                Text(data["Data"]["Category5in1x2"][index4]
                                        ["catname"]
                                    .toString())
                              ],
                            ));
                          }))
                ],
              );
            }
          }),
    );
  }
}
