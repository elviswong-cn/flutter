import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const WHITE_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5', 'm.ctrip.com/html5/'];

/// 网页
/// 知识点：
///   引用第三方插件：flutter_webview_plugin
///   Color必须传入16进制数字
///   Stack：相当于Android FrameLayout
///   Position：绝对定位
class WebView extends StatefulWidget {
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;
  final bool backForbid;

  const WebView(
      {Key key,
      this.title = '',
      @required this.url,
      this.hideAppBar = false,
      this.statusBarColor,
      this.backForbid = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<WebView> {
  var _webViewPlugin = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription _onHttpError;
  bool isExisting = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addListener();
  }

  _addListener() {
    // 监听url
    _webViewPlugin.onUrlChanged.listen((url) {
      print('WebView LoadUrl:$url');
    });
    _webViewPlugin.onStateChanged.listen((webViewStateChanged) {
      switch (webViewStateChanged.type) {
        case WebViewState.startLoad:
          if (_isToMain(webViewStateChanged.url) && !isExisting) {
            if (widget.backForbid) {
              _webViewPlugin.launch(widget.url);
              isExisting = false;
            } else {
              Navigator.pop(context);
              isExisting = true;
            }
          }
          break;
        case WebViewState.shouldStart:
          break;
        case WebViewState.finishLoad:
          break;
        default:
          break;
      }
    });
    _webViewPlugin.onHttpError.listen((e) {
      print(e);
    });
  }

  _isToMain(String url) {
    bool contain = false;
    for (String value in WHITE_URLS) {
      print('url.endsWith:${url.endsWith(value)}');
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  Widget build(BuildContext context) {
    String statubBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statubBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Column(
      children: <Widget>[
        _appBar(Color(int.parse('0xff' + statubBarColorStr)), backButtonColor),
        Expanded(
          child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
          ),
        )
      ],
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backButtonColor,
        height: 30,
      );
    }
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _onUrlChanged?.cancel();
    _onHttpError?.cancel();
    _onStateChanged?.cancel();
    // 需要在页面的dispose之前
    _webViewPlugin.dispose();
    super.dispose();
  }
}
