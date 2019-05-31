import 'package:flutter/material.dart';

class CountDown extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new CountDownState();
}

class CountDownState extends State<CountDown>{
  int _counter = 0;
  void _incrementCounter(){
    this.setState((){
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Text('Count Down')
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times:'),
            new Text(
              '$_counter',
              style:Theme.of(context).textTheme.display1
            )
          ],
        ),
      ),
      floatingActionButton:new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: new Icon(Icons.add),    
      )
    );
  }
}