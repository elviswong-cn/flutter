import 'package:flutter/cupertino.dart';
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(), // ios滑动效果，阻尼
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: new Column(
            textDirection: TextDirection.ltr,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              FlatButton(
                child: Text('Learn Row And Column'),
                onPressed: () {
                  Navigator.pushNamed(context, 'row_column');
                },
              ),
              FlatButton(
                child: Text('TextWidget'),
                onPressed: () {
                  Navigator.pushNamed(context, 'text_widgetful');
                },
              ),
              RaisedButton(
                child: Text('Button Learn'),
                onPressed: () {
                  Navigator.pushNamed(context, 'button_widgetful');
                },
              ),
              RaisedButton(
                child: Text('Switch And Checkbox'),
                onPressed: () {
                  Navigator.pushNamed(context, 'switchAndCb_widget');
                },
              ),
              OutlineButton(
                child: Text('Login Widget'),
                onPressed: () {
                  Navigator.pushNamed(context, 'textField_widget');
                },
              ),
              OutlineButton(
                child: Text('Focus Learning'),
                onPressed: () {
                  Navigator.pushNamed(context, 'focus_widget');
                },
              ),
              RaisedButton(
                child: Text('Form Learning'),
                onPressed: () {
                  Navigator.pushNamed(context, 'form_widget');
                },
              ),
              RaisedButton(
                child: Text('Flex Learning'),
                onPressed: () {
                  Navigator.pushNamed(context, 'flex_widget');
                },
              ),
              RaisedButton(
                child: Text('Wrap And Flow Learning'),
                onPressed: () {
                  Navigator.pushNamed(context, 'wrapFlow_widget');
                },
              ),
              RaisedButton(
                child: Text('Stack And Positioned Learning'),
                onPressed: () {
                  Navigator.pushNamed(context, 'stackPositioned_widget');
                },
              ),
              RaisedButton(
                child: Text('Padding Widget'),
                onPressed: () {
                  Navigator.pushNamed(context, 'padding_widget');
                },
              ),
              GestureDetector(
                child: RaisedButton(
                  child: Text('Constrained Learning'),
                  color: Colors.transparent,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('constrained_widget');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
