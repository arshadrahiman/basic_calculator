import 'package:basic_calculator/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Basic Calculator';

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: OrientationList(
        title: appTitle,
      ),
    );
  }
}

class OrientationList extends StatelessWidget {
  final String title;

  const OrientationList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            title,
            style:const TextStyle(fontSize: 25),
          )),
      body: OrientationBuilder(builder: (context, orientation) {
        return const Home();
      }),
    );
  }
}
