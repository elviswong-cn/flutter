import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<FormWidget> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Widget'),
      ),
      body:
          Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
    );
  }
}
