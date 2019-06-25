import 'package:flutter/material.dart'; // Android MD UI 设计风格
import 'package:startup_namer/routes/EchoRoute.dart';
import 'package:startup_namer/routes/MyRoute.dart';
import 'package:startup_namer/widgets/stateful/CouterWidgetState.dart';
import 'package:startup_namer/widgets/stateful/HomeWidget.dart';

// Dart语言的运行入口main函数
void main(List<String> args) => runApp(MyApp());


// 主界面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: "Welcome to Flutter App",
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        'my_page':(context)=>new MyRoute(),
        'echo_route':(context)=>new EchoRoute(),
        // 'couter_widget_state':(context)=>new CouterWidgetState()
      },
      home: Scaffold(
        //  appBar: AppBar(
        //    title: Text("Welcome to Flutter App"),
        //  ),
         body: Center(
           // child: Text("Hello Word"),
           // 此处替换为 StatefulWidget、State结合使用 Copy
           // child: Text(wordPair.asPascalCasre),
          //  child: RandomWords(),
          // child: CountDown(title:'Count Down')
          child: HomeWidget()
          ),
         ),
      // home: RandomWords(),
    );
  }
}
