import 'package:flutter/material.dart';
import 'package:startup_namer/routes/MyRoute.dart';

// 计数器
 class CountDownWidget extends StatefulWidget{
  CountDownWidget({Key key,this.title}) : super(key:key);
  final String title;
  @override
  State<StatefulWidget> createState() => new CountDownWidgetState();
}

class CountDownWidgetState extends State<CountDownWidget>{
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
        title:new Text(widget.title)
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times:'),
            new Text(
              '$_counter',
              style:Theme.of(context).textTheme.display1
            ),
            FlatButton(
              child: Text('Jump To MyRoute'),
              textColor: Colors.blue,
              onPressed: (){
                // 匿名路由
                // Navigator.push(context,
                // new MaterialPageRoute(builder: (context){
                //   return new MyRoute();
                // }));
                // 相当于
                Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new MyRoute();
                }));
                // 路由表，在App在声明注册
                // Navigator.pushNamed(context, 'my_page');
              },
            ),
            FlatButton(child: Text('Jump To EchoRoute And Arguments'),
            textColor: Colors.green,
            onPressed: (){
              Navigator.pushNamed(context, 'echo_route',arguments:'Thie is EchoRoute And Arguments');
            },)
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