import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ButtonState();
}

class _ButtonState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonWidget'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('RaisedButton'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('FlatButton'),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text('OutlineButton'),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Custmize Button'),
              highlightColor: Colors.blue,
              // 按钮背景色
              disabledColor: Colors.grey,
              // 不可用背景色
              color: Colors.blueAccent,
              // 默认背景色
              textColor: Colors.green,
              // 默认字体颜色
              disabledTextColor: Colors.blueGrey,
              // 不可用字体颜色
              splashColor: Colors.green,
              // 水波纹颜色
//              padding: EdgeInsetsGeometry(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
