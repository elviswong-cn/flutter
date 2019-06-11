import 'package:flutter/material.dart';

class FocusWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FocusState();
}

class _FocusState extends State<FocusWidget> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode _scopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListener();
  }

  void addListener() {
    // 监听焦点变化
    _focusNode1.addListener(() {
      print('Has Focus: ${_focusNode1.hasFocus}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Focus'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: _focusNode1,
            ),
            TextField(
              autofocus: false,
              focusNode: _focusNode2,
            ),
            Builder(
              builder: (context) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('切换焦点'),
                      onPressed: () {
//                      FocusScope.of(context).requestFocus(_focusNode2);
                        if (null == _scopeNode) {
                          _scopeNode = FocusScope.of(context);
                        }
                        _scopeNode.requestFocus(_focusNode2);
                      },
                    ),
                    RaisedButton(
                      child: Text('清除焦点(隐藏软键盘)'),
                      onPressed: () {
                        _focusNode1.unfocus();
                        _focusNode2.unfocus();
//                      _scopeNode.unfocus();
                      },
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
