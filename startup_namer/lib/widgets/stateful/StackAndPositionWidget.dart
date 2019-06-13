import 'package:flutter/material.dart';

class StackAndPositionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StackAndPositionState();
}

class _StackAndPositionState extends State<StackAndPositionWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack And Position Widget'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Text(
                'HelloWorld',
                style: TextStyle(color: Colors.blue),
              ),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text('I am Jack'),
            ),
            Positioned(
              top: 18.0,
              child: Text('Your friend'),
            )
          ],
        ),
      ),
    );
  }
}
