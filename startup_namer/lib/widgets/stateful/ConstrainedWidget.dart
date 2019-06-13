import 'package:flutter/material.dart';

class ConstrainedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConstrainedState();
}

class _ConstrainedState extends State<ConstrainedWidget> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Constrained Widget'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity, // 宽度尽可能大
          minHeight: 50,
        ),
        child: Container(
          height: 5,
          child: redBox,
        ),
      ),
    );
  }
}
