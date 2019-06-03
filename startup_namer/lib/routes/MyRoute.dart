import 'package:flutter/material.dart';

/**
 * 我的界面
 */
class MyRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page')
      ),
      body:new Center(
        child: Text('This is new route'),
      ),
    );
  }
}