import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding Widget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Hello World'),
            ),
            Padding(
              // 上下添加8像素留白
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('I am Jack'),
            ),
            Padding(
              // 4个方向补白
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text('Your friend'),
            )
          ],
        ),
      ),
    );
  }
}
