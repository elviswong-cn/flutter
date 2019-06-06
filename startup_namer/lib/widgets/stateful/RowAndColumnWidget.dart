import 'package:flutter/material.dart';

class RowAndColumnWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RowAndColumnState();
}

class _RowAndColumnState extends State<RowAndColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RowAndColumnWidget'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.green),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Text('Column1 Row1'),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text('Column1 Row2'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('Column1 Row3'),
                )
              ],
            ),
            Row(
              // mainAxisSize 为min时，MainAxisAlignment无效
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Text('Column1 Row4'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
