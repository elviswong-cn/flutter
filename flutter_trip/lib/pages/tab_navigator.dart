import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/index/travel_page.dart';
import 'package:flutter_trip/pages/index/home_page.dart';
import 'package:flutter_trip/pages/index/me_page.dart';
import 'package:flutter_trip/pages/index/search_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TabNavigator> {
  var _defaultColor = Colors.grey;
  var _activeColor = Colors.blue;
  int _currentIndex;
  PageController _controller;

  @override
  initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _controller.addListener(() {});
    _currentIndex = 0;
  }

  @override
  void didUpdateWidget(TabNavigator oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          _controller.jumpToPage(value);
          setState(() {
            print('onTapValue:$value');
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            title: Text(
              '首页',
              style: TextStyle(
                  color: _currentIndex == 0 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: _activeColor,
            ),
            title: Text(
              '搜索',
              style: TextStyle(
                  color: _currentIndex == 1 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.camera_alt,
              color: _activeColor,
            ),
            title: Text(
              '旅拍',
              style: TextStyle(
                  color: _currentIndex == 2 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.person,
              color: _activeColor,
            ),
            title: Text(
              '我的',
              style: TextStyle(
                  color: _currentIndex == 3 ? _activeColor : _defaultColor),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePageView(),
          SearchPageView(),
          TravelPageView(),
          MePageView(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
