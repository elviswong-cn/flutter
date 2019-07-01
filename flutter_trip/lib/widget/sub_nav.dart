import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/widget/webview.dart';

/// 活动卡片
class SubNav extends StatefulWidget {
  final List<CommonModel> subNavList;

  // @required 该参数为必填
  const SubNav({Key key, @required this.subNavList}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SubNav> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            children: <Widget>[
              _items(context),
            ],
          ),
        ));
  }

  _items(BuildContext context) {
    if (widget.subNavList == null)
      return Container(
        child: Text('当前数据为空'),
      );
    List<Widget> widgets = [];
    widget.subNavList.forEach((value) => widgets.add(_item(context, value)));
    int separate = (widget.subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgets.sublist(0, separate),
        ),
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgets.sublist(separate, widget.subNavList.length),
          ),
        )
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel value) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebView(
                        url: value.url,
                        statusBarColor: value.statusBarColor,
                        hideAppBar: value.hideAppBar,
                        title: value.title,
                      )));
        },
        child: Column(
          children: <Widget>[
            Image.network(
              value.icon,
              height: 20,
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                value.title,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
