import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Learning',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('English'),
        ),
        // body: Center(
        //   child: Text('English'),
        // ),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("images/pic6-1.jpg"),
          ),
        ),
      ),
    );
  }
}
