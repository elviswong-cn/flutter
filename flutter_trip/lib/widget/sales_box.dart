import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';
import 'package:flutter_trip/widget/webview.dart';

/// 活动卡片
/// 知识点：
///   GestureDetector：事件监听
///   alignment：内容对齐方式
///   mainAxisAlignment：Row/Column 元素间隔方式
class SalesBox extends StatefulWidget {
  final SalesBoxModel salesBox;

  // @required 该参数为必填
  const SalesBox({Key key, @required this.salesBox}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SalesBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Color(0xfff2f2f2), width: 1),
            )),
            height: 44,
            margin: EdgeInsets.only(left: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  widget.salesBox != null ? widget.salesBox.icon : null,
                  fit: BoxFit.fill,
                  height: 15,
                ),
                Container(
                  height: 20,
                  alignment: AlignmentDirectional.centerEnd,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffff4e63),
                          Color(0xffff6cc9),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.fromLTRB(5, 1, 5, 5),
                  margin: EdgeInsets.only(right: 7),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebView(
                                    url: widget.salesBox.moreUrl,
                                  )));
                    },
                    child: Text(
                      '参加更多活动 >',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _items(context),
        ],
      ),
    );
  }

  _items(BuildContext context) {
    if (widget.salesBox == null)
      return Container(
        child: Text('当前数据为空'),
      );
    List<Widget> widgets = [];
    widgets.add(_doubleItem(context, widget.salesBox.bigCard1,
        widget.salesBox.bigCard2, true, false));
    widgets.add(_doubleItem(context, widget.salesBox.smallCard1,
        widget.salesBox.smallCard2, false, false));
    widgets.add(_doubleItem(context, widget.salesBox.smallCard3,
        widget.salesBox.smallCard4, false, true));
    return Column(
      children: widgets,
    );
  }

  Widget _doubleItem(BuildContext context, CommonModel left, CommonModel right,
      bool big, bool last) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: <Widget>[
          _item(context, left, big, false, last),
          _item(context, right, big, true, last),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, CommonModel value, bool big, bool right,
      bool last) {
    BorderSide _borderSize = BorderSide(width: 1, color: Color(0xfff2f2f2));
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          right: right ? BorderSide.none : _borderSize,
          bottom: last ? BorderSide.none : _borderSize,
        )),
        child: Image.network(
          value.icon,
          width: MediaQuery.of(context).size.width / 2 - 14,
          height: big ? 129 : 80,
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: value.url,
                      title: value.title,
                    )));
      },
    );
  }
}
