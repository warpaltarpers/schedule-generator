import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaffilter_generator/components/reusable_card.dart';
import 'package:leaffilter_generator/components/constants.dart';
import 'package:leaffilter_generator/components/text_card.dart';
import 'dart:io' show Platform;
import 'components/bottom_button.dart';
import 'package:leaffilter_generator/block_page.dart';

class GeneratorScroll extends StatefulWidget {
  @override
  _GeneratorScrollState createState() => _GeneratorScrollState();
}

class _GeneratorScrollState extends State<GeneratorScroll> {
  TextCard jobNumCard = new TextCard(label: 'LAST JOB #', isAndroid: Platform.isAndroid ? true : false,);
  TextCard cityCard = new TextCard(label: 'LOCATION', isAndroid: Platform.isAndroid ? true : false,);
  
  int jobFoot = 0;
  int numMiters = 0;
  String filterSize = '5\"';
  String filterColor = 'W';
  String storyCount = '1';
  String paymentType = 'C';

  List<DropdownMenuItem<String>> sizes = [
    DropdownMenuItem(
      value: '5\"',
      child: Text('5\"'),
    ),
    DropdownMenuItem(
      value: '6\"',
      child: Text('6\"'),
    ),
    DropdownMenuItem(
      value: 'HR 5\"',
      child: Text('HR 5\"'),
    ),
    DropdownMenuItem(
      value: 'HR 6\"',
      child: Text('HR 6\"'),
    ),
    DropdownMenuItem(
      value: 'HR 7\"',
      child: Text('HR 7\"'),
    ),
  ];

  List<DropdownMenuItem<String>> colors = [
    DropdownMenuItem(
      value: 'W',
      child: Text('White'),
    ),
    DropdownMenuItem(
      value: 'C',
      child: Text('Clay'),
    ),
    DropdownMenuItem(
      value: 'B',
      child: Text('Beige'),
    ),
    DropdownMenuItem(
      value: 'G',
      child: Text('Gray'),
    ),
  ]; // White, Clay, Beige, Gray

  List<DropdownMenuItem<String>> stories = [
    DropdownMenuItem(
      value: '1',
      child: Text('1'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('2'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('3'),
    ),
    DropdownMenuItem(
      value: '1/2',
      child: Text('1/2'),
    ),
    DropdownMenuItem(
      value: '1/3',
      child: Text('1/3'),
    ),
    DropdownMenuItem(
      value: '2/3',
      child: Text('2/3'),
    ),
    DropdownMenuItem(
      value: '1/2/3',
      child: Text('1/2/3'),
    ),
  ];

  List<DropdownMenuItem<String>> payments = [
    DropdownMenuItem(
      value: 'C',
      child: Text('Cash'),
    ),
    DropdownMenuItem(
      value: 'CK',
      child: Text('Check'),
    ),
    DropdownMenuItem(
      value: 'CC',
      child: Text('Credit Card'),
    ),
    DropdownMenuItem(
      value: 'F',
      child: Text('Finance'),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
             begin: Alignment.bottomLeft,
             colors: [const Color(0xff56ab2f), const Color(0xffa8e063)],
          )
        ),
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  // Job # card
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: jobNumCard,
                    ),
                  ),
                  // City card
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: cityCard,
                    ),
                  ),
                ],
              ),
              ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  children: <Widget>[
                    Text(
                      'JOB FOOTAGE',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}