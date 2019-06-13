import 'package:flutter/material.dart';

class FlexWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FlexState();
}

class _FlexState extends State<FlexWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Widget'),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                // flex指定后，width无效 flex相当于childer的比例
                // 等同于android LinearLayout中的Weight
                flex: 1,
                child: Container(
                  height: 30,
                  width: 1000,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 28),
            child: SizedBox(
              height: 100,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  // flex指定后，height无效
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 60,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    // Spacer对Expanded的包装，可直接查看源码
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
