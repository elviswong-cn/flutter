import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';

class LocalNav extends StatefulWidget {
  final List<CommonModel> localNavList;

  // @required 该参数为必填
  const LocalNav({Key key, @required this.localNavList}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<LocalNav> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 64,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            )),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            children: _items(context),
          ),
        ));
  }

  _items(BuildContext context) {
    if (widget.localNavList == null) return null;
    List<Widget> widgets = [];
    widget.localNavList.forEach((value) => widgets.add(_item(context, value)));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    );
  }

  Widget _item(BuildContext context, CommonModel value) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            value.url,
            height: 32,
            width: 32,
          ),
          Text(
            value.title,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
