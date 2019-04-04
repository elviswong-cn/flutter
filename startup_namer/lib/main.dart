import 'package:flutter/material.dart'; // Android MD UI 设计风格
import 'package:english_words/english_words.dart';

// Dart语言的运行入口main函数
void main(List<String> args) => runApp(MyApp());

/**
 * 主界面
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Welcome to Flutter App",
      home: Scaffold(
         appBar: AppBar(
           title: Text("Welcome to Flutter App"),
         ),
         body: Center(
           // child: Text("Hello Word"),
           // 此处替换为 StatefulWidget、State结合使用
           // child: Text(wordPair.asPascalCase),
           child: RandomWords(),
         ),
       ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
      ),
      body: _buildSuggestions(),
    );
  }

  // 创建ListView
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (conetxt, i) {
          // isEvent 是否为偶数  isOdd 是否为奇数
          if (i.isEven) return Divider(); // 偶数行为分割线
          final index = i ~/ 2;
          // if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
          return _buildRow(_suggestions[i]);
          // }
        });
  }

  // 创建ListView的Item ListTile
  Widget _buildRow(WordPair wordPair) {
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
