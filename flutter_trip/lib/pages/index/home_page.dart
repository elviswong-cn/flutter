import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/grid_nav.dart';
import 'package:flutter_trip/widget/loading_container.dart';
import 'package:flutter_trip/widget/local_nav.dart';
import 'package:flutter_trip/widget/sales_box.dart';
import 'package:flutter_trip/widget/sub_nav.dart';
import 'package:flutter_trip/widget/webview.dart';

/// 知识点：
///   1. 下拉刷新组件：RefreshIndicator->onRefresh返回Future来实现
///   2. ListView滑动监听：NotificationListener
///   3. Swiper 第三方banner插件
///   4. MediaQuery.removePadding 系统Padding移除
///   5. Opacity：设置Widget透明度
class HomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomePageView> {
  final int SCROLL_MAX = 160;
  double _opacity = 0;
  SwiperControl _swiperControll = SwiperControl();
  String resultString = "";
  HomeModel _homeModel = HomeModel();
  bool _isLoading = true;

//  final List swiperUrls = [
//    'http://live-static.utoooo.com/app/adv/2019_06_17/01f39400ae1438e0290da99ba12573c1.png',
//    'http://live-static.utoooo.com/app/adv/2019_06_17/c7931534cd4a6590b1d9e39e06a62e22.png',
//    'http://live-static.utoooo.com/app/adv/2019_06_17/ce08935665c37e310e3c20f496f66ce5.png',
//  ];

  initState() {
    super.initState();
    _loadData();
  }

  Future<Null> _loadData() async {
    HomeDao.fetch().then((result) {
      setState(() {
        this.resultString = json.encode(result);
        _homeModel = result;
        _isLoading = false;
        print("Http mainItem:" + _homeModel.gridNav.hotel.mainItem.title);
      });
    }).catchError((e) {
      setState(() {
        resultString = e.toString();
        _isLoading = false;
      });
    });
    return null;
//    try {
//      _homeModel = await HomeDao.fetch();
//      setState(() {
//        resultString = json.encode(_homeModel.gridNav.travel.mainItem.url);
//      });
//    } catch (e) {
//      setState(() {
//        resultString = e.toString();
//      });
//    }
  }

  _scroll(position) {
    double alpha = position / SCROLL_MAX;
    if (alpha <= 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _opacity = alpha;
    });
    print(_opacity);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: LoadingContainer(
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: RefreshIndicator(
                onRefresh: _loadData,
                child: NotificationListener(
                  onNotification: (notification) {
                    if (notification is ScrollUpdateNotification &&
                        notification.depth == 0) {
                      _scroll(notification.metrics.pixels);
                    }
                  },
                  child: _listView,
                ),
              ),
            ),
            _appBar,
          ],
        ),
        isLoading: _isLoading,
      ),
    );
  }

  /// 首页banner
  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        itemCount:
            _homeModel.bannerList != null ? _homeModel.bannerList.length : 0,
        autoplay: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                WebView(
                  title: _homeModel.bannerList[index].title,
                  url: _homeModel.bannerList[index].url,
                  hideAppBar: _homeModel.bannerList[index].hideAppBar,
                  statusBarColor: _homeModel.bannerList[index].statusBarColor,
                );
              }));
            },
            child: Image.network(
              _homeModel.bannerList[index].icon,
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }

  /// 首页appBar
  Widget get _appBar {
    return Opacity(
      opacity: _opacity,
      child: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('首页'),
          ),
        ),
      ),
    );
  }

  /// 首页列表
  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: Container(
            child: LocalNav(
              localNavList: _homeModel.localNavList,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: GridNav(
            gridNavModel: _homeModel.gridNav,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: SubNav(
            subNavList: _homeModel.subNavList,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: SalesBox(
            salesBox: _homeModel.salesBox,
          ),
        ),
      ],
    );
  }
}
