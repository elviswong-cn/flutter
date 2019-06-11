import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget> {
  // 包含文本变化监听、设置默认值、选择文本
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化时，添加回调设置
    _controller.text = 'hello world';
    _controller.addListener(() {
      print(_controller.text);
    });
    _controller.selection = TextSelection(
        baseOffset: 2, // 从下标为2开始
        extentOffset: _controller.text.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: ThemeData(
          hintColor: Colors.grey[200], // 下划线颜色
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey),
              hintStyle: TextStyle(color: Colors.green, fontSize: 14.0))),
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: _controller,
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
              border: InputBorder.none),
            ),
            TextField(
              autofocus: false,
              // 跟Controller类似,但仅支持监听文本变化
              onChanged: (v) {
                print('onChange: $v');
              },
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  prefixIcon: Icon(Icons.lock),
                  hintStyle: TextStyle(color: Colors.red, fontSize: 18.0)),
              obscureText: true, // 是否隐藏编辑文本
            ),
//          Expanded(child:
            RaisedButton(
              child: Text('登录'),
              color: Colors.green,
              highlightColor: Colors.lightGreen,
              disabledColor: Colors.grey,
              colorBrightness: Brightness.dark,
              onPressed: () {},
            ),
//          )
          ],
        ),
      ),
    );
  }
}
