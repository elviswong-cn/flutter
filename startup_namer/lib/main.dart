import 'package:flutter/material.dart'; // Android MD UI 设计风格
import 'package:english_words/english_words.dart';
import 'package:startup_namer/custom_widget/CountDown.dart';
import 'package:startup_namer/custom_widget/RandomWords.dart';

// Dart语言的运行入口main函数
void main(List<String> args) => runApp(MyApp());

/**
 * 主界面
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Welcome to Flutter App",
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        //  appBar: AppBar(
        //    title: Text("Welcome to Flutter App"),
        //  ),
         body: Center(
           // child: Text("Hello Word"),
           // 此处替换为 StatefulWidget、State结合使用 Copy
           // child: Text(wordPair.asPascalCase),
          //  child: RandomWords(),
          child: CountDown(title:'Count Down'),
         ),
       ),
      // home: RandomWords(),
    );
  }
}
