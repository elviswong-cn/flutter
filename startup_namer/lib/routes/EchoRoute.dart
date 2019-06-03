import 'package:flutter/material.dart';

class EchoRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 获取路由跳转传递的参数值
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar:AppBar(
        title: new Text('EchoRoute'),
      ),
      body: Center(
        // child:new Column(
          // children: <Widget>[
            // new Text(args),
          // ],
        // )
        child: new Text(args),
      ),
    );
  }
}