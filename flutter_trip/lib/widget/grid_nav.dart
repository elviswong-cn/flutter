import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/widget/webview.dart';

/// 顶部方格
/// 知识点：
///   PhysicalModel：多层级View处理形状时。使用BoxDecoration无效，会被遮挡
///   gradient：LinearGradient  线性渐变
///   Expanded：垂直占满父布局
///   FractionallySizedBox：水平占满父布局
class GridNav extends StatefulWidget {
  final GridNavModel gridNavModel;

  @override
  _State createState() => _State();

  // @required 该参数为必填
  const GridNav({Key key, @required this.gridNavModel}) : super(key: key);
}

class _State extends State<GridNav> {
  GridNavModel _gridNavModel;

  @override
  Widget build(BuildContext context) {
    _gridNavModel = widget.gridNavModel;
    // TODO: implement build
    // 多层view实现同步圆角
    return PhysicalModel(
      borderRadius: BorderRadius.circular(6),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> mainNavItems = [];
    if (_gridNavModel == null) {
      mainNavItems.add(Text("数据为空"));
      return mainNavItems;
    }
    if (_gridNavModel.hotel != null) {
      mainNavItems.add(_gridItem(context, _gridNavModel.hotel, true));
    }
    if (_gridNavModel.flight != null) {
      mainNavItems.add(_gridItem(context, _gridNavModel.flight, false));
    }
    if (_gridNavModel.travel != null) {
      mainNavItems.add(_gridItem(context, _gridNavModel.travel, false));
    }
    return mainNavItems;
  }

  _gridItem(BuildContext context, GridNavItem value, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, value.mainItem));
    items.add(_doubleItem(context, value.item1, value.item2, true));
    items.add(_doubleItem(context, value.item3, value.item4, false));
    List<Widget> expandItems = [];
    items.forEach((item) {
      expandItems.add(Expanded(
        child: item,
      ));
    });
    return Container(
      height: 88,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(int.parse("0xff" + value.startColor)),
          Color(int.parse("0xff" + value.endColor)),
        ],
      )),
      margin: first ? null : EdgeInsets.only(top: 3),
      child: Row(
        children: expandItems,
      ),
    );
  }

  // mainItem
  _mainItem(BuildContext context, CommonModel mainItem) {
    return _wrapGesture(
        context,
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            // AlignmentDirectional 底部对齐
            Image.network(
              mainItem.icon,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                mainItem.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
        mainItem);
  }

  // 双排item
  _doubleItem(BuildContext context, CommonModel topModel,
      CommonModel bottomModel, bool middle) {
    return Column(
      children: <Widget>[
        // 垂直方向占满
        Expanded(
          child: _item(context, topModel, true, middle),
        ),
        Expanded(
          child: _item(context, bottomModel, false, middle),
        ),
      ],
    );
  }

  // double下的其中一个
  _item(BuildContext context, CommonModel model, bool top, bool middle) {
    BorderSide _borderSize = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              left: _borderSize, bottom: top ? _borderSize : BorderSide.none),
        ),
        child: _wrapGesture(
            context,
            Center(
              child: Text(
                model.title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            model),
      ),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: model.url,
                      statusBarColor: model.statusBarColor,
                      hideAppBar: model.hideAppBar,
                      title: model.title,
                    )));
      },
      child: widget,
    );
  }
}
