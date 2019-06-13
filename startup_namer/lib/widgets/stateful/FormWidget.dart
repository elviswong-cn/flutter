import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<FormWidget> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _key = GlobalKey<FormState>();
  String _uname = '';
  String _pwd = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _unameController.addListener(() {
      _uname = _unameController.text;
    });
    _pwdController.addListener(() {
      _pwd = _pwdController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Widget'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          key: _key,
          autovalidate: true, // 开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _unameController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  icon: Icon(Icons.person),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : '用户名不能为空';
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '您的登录密码',
                  icon: Icon(Icons.lock),
                ),
                validator: (v) {
                  return v.trim().length >= 6 && v.trim().length <= 13
                      ? null
                      : '密码长度为6~13位';
                },
                obscureText: true,
              ),
              Padding(
                // padding必须加此属性，否则运行会报错
                padding: const EdgeInsets.only(top: 28),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('登录'),
                        onPressed: () {
                          // form表单内容填写通过
                          if ((_key.currentState as FormState).validate()) {
                            print('登录用户名：$_uname,密码为$_pwd');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
