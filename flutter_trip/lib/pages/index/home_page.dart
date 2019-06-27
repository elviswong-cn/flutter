import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/widget/local_nav.dart';

class HomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomePageView> {
  final int SCROLL_MAX = 160;
  double _opacity = 0;
  SwiperControl _swiperControll = SwiperControl();
  String resultString = "";
  HomeModel _homeModel;
  final List swiperUrls = [
    'http://live-static.utoooo.com/app/adv/2019_06_17/01f39400ae1438e0290da99ba12573c1.png',
    'http://live-static.utoooo.com/app/adv/2019_06_17/c7931534cd4a6590b1d9e39e06a62e22.png',
    'http://live-static.utoooo.com/app/adv/2019_06_17/ce08935665c37e310e3c20f496f66ce5.png',
  ];

  initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    HomeDao.fetch().then((result) {
      setState(() {
        this.resultString = json.encode(result);
        _homeModel = result;
      });
    }).catchError((e) {
      setState(() {
        resultString = e.toString();
      });
    });

//    try {
//      HomeModel model = await HomeDao.fetch();
//      setState(() {
//        resultString = json.encode(model);
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
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.depth == 0) {
                  _scroll(notification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: swiperUrls.length,
                      autoplay: true,
                      itemBuilder: (context, index) {
                        return Image.network(
                          swiperUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
//                      control: _swiperControll,
                    ),
                  ),
                  Container(
                    child: LocalNav(
                      localNavList: _homeModel.localNavList,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
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
          )
        ],
      ),
    );
  }
}
