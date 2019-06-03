import 'package:flutter/material.dart';

/// 自定义StatelessWidget
class EchoWidget extends StatelessWidget{
   const EchoWidget({
     key:Key,
     @required this.text,
     @required this.backgroundColor
   }):super(key:key);
   final String text;
   final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}