import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class WordWidget extends StatefulWidget {
  @override
  _WordWidgetState createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  bool _isPressed = false;
  String _word = 'English';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isPressed();
        print("tap");
      },
      child: Card(
        color: Colors.blueAccent,
        //z轴的高度，设置Card的阴影
        elevation: 20.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        clipBehavior: Clip.antiAlias,
        semanticContainer: false,
        child: getChild(),
      ),
    );
  }

  getChild() {
    return Container(
      color: Colors.deepPurpleAccent,
      width: 300,
      height: 250,
      alignment: Alignment.center,
      child: Text(
        '$_word',
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
    );
  }

  void isPressed() {
    setState(() {
      if (_isPressed) {
        _isPressed = false;
        _word = '英语, 英文的';
      } else {
        _isPressed = true;
        _word = "English";
      }
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget CardSection = Container(
      child: Center(
        child: WordWidget(),
      ),
    );

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
          // child: Card(
          //   color: Colors.blueAccent,
          //   //z轴的高度，设置Card的阴影
          //   elevation: 20.0,
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   clipBehavior: Clip.antiAlias,
          //   semanticContainer: false,
          //   child: getChild(),
          // ),
          child: CardSection,
        ),
      ),
    );
  }

  getChild() {
    return Container(
      color: Colors.deepPurpleAccent,
      width: 300,
      height: 250,
      alignment: Alignment.center,
      child: Text(
        'English',
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
    );
  }
}
