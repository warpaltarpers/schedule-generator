import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockPage extends StatelessWidget {

  BlockPage({@required this.jobNum, @required this.location, @required this.filterSize, @required this.filterColor, @required this.miters, @required this.jobFootage, @required this.stories, @required this.payment});
  
  final String jobNum;
  final String location;
  final String filterSize;
  final String filterColor;
  final int miters;
  final int jobFootage;
  final String stories;
  final String payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
             begin: Alignment.bottomLeft,
             colors: [const Color(0xff56ab2f), const Color(0xffa8e063)],
          )
        ),
        child: Center(

        ),
      ),
    );
  }
}