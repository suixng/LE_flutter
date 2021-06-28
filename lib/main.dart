import 'dart:html';

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

class DragWidget extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<DragWidget> {
  double _top = 0.0;
  double _left = 0.0;
  Offset offset = Offset(10, kToolbarHeight + 100);

  Offset _calOffset(Size size, Offset offset, Offset nextOffset) {
    double dx = 0;
    if (offset.dx + nextOffset.dx <= 0) {
      dx = 0;
    } else if (offset.dx + nextOffset.dx >= (size.width - 50)) {
      dx = size.width - 50;
    } else {
      dx = offset.dx + nextOffset.dx;
    }
    double dy = 0;
    if (offset.dy + nextOffset.dy >= (size.height - 100)) {
      dy = size.height - 100;
    } else if (offset.dy + nextOffset.dy <= kToolbarHeight) {
      dy = kToolbarHeight;
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(
      dx,
      dy,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: GestureDetector(
        onPanDown: (detail) {
          print("tapped on");
        },
        onPanUpdate: (detail) {
          setState(() {
            // _left += e.delta.dx;
            // _top += e.delta.dy;
            offset =
                _calOffset(MediaQuery.of(context).size, offset, detail.delta);
          });
        },
        onPanEnd: (detail) {
          print("tapped down");
        },
        child: TextButton(
          child: Text("Tap"),
          onPressed: () {},
        ),
      ),
    );
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

    Widget DragSection = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: DragWidget(),
          )
        ],
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
        // body: Center(
        //   // child: Card(
        //   //   color: Colors.blueAccent,
        //   //   //z轴的高度，设置Card的阴影
        //   //   elevation: 20.0,
        //   //   shape: RoundedRectangleBorder(
        //   //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
        //   //   clipBehavior: Clip.antiAlias,
        //   //   semanticContainer: false,
        //   //   child: getChild(),
        //   // ),

        //   //child: CardSection,
        //   // child: ListView(
        //   //   children: [
        //   //     CardSection,
        //   //     DragSection,
        //   //   ],
        //   // ),
        // ),
        body: Center(
            child: Draggable(
          // child: Container(
          //   height: 100,
          //   width: 100,
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     // 背景色
          //     color: Colors.blueAccent,
          //     borderRadius: BorderRadius.all(Radius.circular(30)),
          //   ),
          //   child: Container(
          //     height: 200,
          //     width: 200,
          //   ),
          // ),
          child: CardSection,
          // feedback: Container(
          //   height: 100,
          //   width: 100,
          //   alignment: Alignment.center,
          //   // decoration: BoxDecoration(
          //   //     color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          //   decoration: BoxDecoration(
          //     // 背景色
          //     color: Colors.blueAccent,
          //     borderRadius: BorderRadius.all(Radius.circular(30)),
          //   ),
          //   child: Container(
          //     height: 200,
          //     width: 200,
          //   ),
          // ),
          feedback: CardSection,
        )
            // Row(
            //   children: [
            //     //CardSection,
            //     DragSection,
            //   ],
            // ),
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
