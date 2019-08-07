import 'package:flutter/material.dart';
import 'package:leaffilter_generator/generator_scroll.dart';
import 'package:leaffilter_generator/block_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: new GeneratorScroll(),
    );
  }
}