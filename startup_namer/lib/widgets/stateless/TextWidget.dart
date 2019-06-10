import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidgetful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextState();
}

class _TextState extends State<TextWidgetful> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TextWidgetful'),
      ),
      body: Column(
        children: <Widget>[
          // Text: textAlign 文本对其位置    maxLines：最大横竖
          // overflow: 字体截断方式  textScaleFactor：字体缩放
          Text(
            'Hello World',
            style: TextStyle(fontSize: 11, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          Text(
            'Hello World' * 4,
            maxLines: 1,
            style: TextStyle(
              fontSize: 11,
              color: Colors.blue,
              fontFamily: 'PKFont',
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Hello World',
            style: TextStyle(
              fontSize: 11,
              color: Colors.green,
            ),
            textScaleFactor: 1.5,
          ),
          Text(
            'TextStyle Learn',
            style: TextStyle(
                fontSize: 11,
                color: Colors.amber,
                height: 1.2,
                fontFamily: 'Courier',
                // 行高
                background: Paint()..color = Colors.yellowAccent,
                // 下划线、中划线、上划线
                decoration: TextDecoration.underline,
                // 线条样式:虚线、点、双线条、单线条
                decorationStyle: TextDecorationStyle.solid),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: 'Home'),
            TextSpan(
              text: 'https://flutterchina.club',
              style: TextStyle(color: Colors.blue),
//                recognizer: _tapRecognizer
            )
          ])),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // 垂直方向对齐方式
              children: <Widget>[
                Text('DefaultTextStyle 1'),
                Text('DefaultTextStyle2'),
                Text(
                  'Not DefaultTextStyle 3',
                  style: TextStyle(
                    inherit: false, // 不使用默认style
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _tapRecognizer() {
    return null;
  }
}
