import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: const  Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}


class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final _suggesions = <WordPair>[];
    const _biggerFont = TextStyle(fontSize: 18);
    return ListView.builder(
      padding: const EdgeInsets.all(16.0), 
      /**
       * Lớp ListView cung cấp thuộc tính itemBuilder
       * nó là factory builder và hàm callback là 1 hàm ẩn danh
       * 
       * itemBuilder callback được gọi một lần trên mỗi hàng
       */
      itemBuilder: (context, i){
        // Đối với hàng lẽ, thêm đường phần cách
        if(i.isOdd) return const Divider();

      /**
       * The expression i ~/ 2 divides i by 2 and returns an integer result. For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2. This calculates the actual number of word pairings in the ListView, minus the divider widgets.
       */
        final index = i ~/ 2;

        if(index >= _suggesions.length){
          _suggesions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggesions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      });
  }
}