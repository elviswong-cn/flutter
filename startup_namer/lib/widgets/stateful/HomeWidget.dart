import 'package:flutter/material.dart';
import 'package:startup_namer/widgets/stateful/CouterWidgetState.dart';
import 'package:startup_namer/widgets/stateless/EchoWidget.dart';

import 'CountDownWidget.dart';
import 'RandomWordsWidget.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: new Column(
          children: <Widget>[
            FlatButton(
              child: Text('Jump CountDown Page'),
              textColor: Colors.blue,
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new CountDownWidget(title: 'CoutDown');
                    }))
                  },
            ),
            FlatButton(
              child: Text('Jump RandomWords'),
              textColor: Colors.green,
              onPressed: () => {
                    // 打印Debug日志
                    debugDumpApp(),
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      return new RandomWordsWidget();
                    }))
                  },
            ),
            FlatButton(
              child: Text('Jump MyRoute'),
              textTheme: ButtonTextTheme.accent,
              onPressed: () => {Navigator.pushNamed(context, 'my_page')},
            ),
            FlatButton(
              child: Text('Jump EchoRoute And Arguments'),
              textTheme: ButtonTextTheme.normal,
              onPressed: () => {
                    Navigator.pushNamed(context, 'echo_route',
                        arguments: 'EchoRoute And Arguments')
                  },
            ),
            FlatButton(
              child: Text('Jump Echo Stateless'),
              onPressed: () => {
                    Navigator.of(context)
                        .push(new MaterialPageRoute(builder: (context) {
                      //key: new Key('stack_echo')
                      return new EchoWidget(
                          text: 'EchoWidget', backgroundColor: Colors.green);
                    }))
                  },
            ),
            FlatButton(
              child: Text('Look At State Lifecycle'),
              onPressed: () {
                // Navigator.pushNamed(context, 'couter_widget_state');
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return CouterWidgetState(initValue: 0);
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
