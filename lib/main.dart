import 'package:flutter/material.dart';
import 'package:intertoon/pages/Home/MyCart.dart';
import 'package:intertoon/pages/Home/ProductDetails.dart';
import 'package:intertoon/pages/NavBar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/third',
    routes: {
      '/': (context) => const NavBar(),
      '/second': (context) => const ProductDetails(),
      '/third': (context) => const details(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: ThemeData(), home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text("hello"),
          ),
    );
  }
}
