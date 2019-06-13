import 'package:flutter/material.dart';

class WrapFlowWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WrapFlowState();
}

class _WrapFlowState extends State<WrapFlowWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapFlow Widget'),
      ),
      body: Wrap(
        spacing: 8.0, // 水平方向间距
        runSpacing: 4.0, // 垂直方向间距
        alignment: WrapAlignment.center,
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('B'),
            ),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('C'),
            ),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('D'),
            ),
            label: Text('Laurens'),
          ),
        ],
      ),
    );
  }
}
