import 'package:flutter/cupertino.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';

class GridNav extends StatefulWidget {
  final GridNavModel gridNavModel;
  final String name;

  @override
  _State createState() => _State();

  // @required 该参数为必填
  const GridNav({Key key, @required this.gridNavModel, this.name = "elvis"})
      : super(key: key);
}

class _State extends State<GridNav> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Text(widget.name),
        ],
      ),
    );
  }
}
