import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Color(0xffad32fe),
      ),
      body: Center(
        child: Text('Messages content goes here'),
      ),
    );
  }
}
