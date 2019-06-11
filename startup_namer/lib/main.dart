import 'package:flutter/material.dart'; // Android MD UI 设计风格
import 'package:startup_namer/routes/EchoRoute.dart';
import 'package:startup_namer/routes/MyRoute.dart';
import 'package:startup_namer/widgets/stateless/ButtonWidget.dart';
import 'package:startup_namer/widgets/stateful/CouterWidgetState.dart';
import 'package:startup_namer/widgets/stateful/HomeWidget.dart';
import 'package:startup_namer/widgets/stateful/RowAndColumnWidget.dart';
import 'package:startup_namer/widgets/stateless/FocusWidget.dart';
import 'package:startup_namer/widgets/stateless/SwitchAndCheckboxWidget.dart';
import 'package:startup_namer/widgets/stateless/TextFieldWidget.dart';
import 'package:startup_namer/widgets/stateless/TextWidget.dart';

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
        'my_page': (context) => MyRoute(),
        'echo_route': (context) => EchoRoute(),
        'couter_widget_state': (context) => CouterWidgetState(initValue: 0),
        'row_column': (context) => RowAndColumnWidget(),
        'text_widgetful': (context) => TextWidgetful(),
        'button_widgetful': (context) => ButtonWidget(),
        'switchAndCb_widget': (context) => SwitchAndCheckboxWidget(),
        'textField_widget': (context) => TextFieldWidget(),
        'focus_widget':(context)=>FocusWidget(),
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
            child: HomeWidget()),
      ),
      // home: RandomWords(),
    );
  }
}
