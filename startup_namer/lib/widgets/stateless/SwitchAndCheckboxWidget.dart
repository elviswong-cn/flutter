import 'package:flutter/material.dart';

class SwitchAndCheckboxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwitchAndCheckboxState();
}

class _SwitchAndCheckboxState extends State<SwitchAndCheckboxWidget> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchAndCheckbxo'),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) => {
                  setState(() => {
                        _switchSelected = value,
                      }),
                },
          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.green,
            onChanged: (value) {
              // setState 是为了刷新页面，页面会重新build
              setState(() {
                _checkboxSelected = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
