import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

class AssetsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AssetsState();
}

class AssetsState extends State<AssetsWidget> {
  Future<String> loadAsset() async {
    // rootBundle 用来访问资源文件
    return await rootBundle.loadString('assets/config.json');
  }

  @override
  Widget build(BuildContext context) {
    // return new DecoratedBox(decoration: new BoxDecoration(
    //   image: new DecorationImage(
    //     image:new AssetImage('graphics/background.png')
    //   )
    // ),);
    return Image.asset('graphics/background.png');
  }
}
