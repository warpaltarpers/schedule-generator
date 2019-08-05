import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaffilter_generator/components/reusable_card.dart';
import 'package:leaffilter_generator/components/constants.dart';
import 'package:leaffilter_generator/components/text_card.dart';
import 'dart:io' show Platform;

class Generator extends StatefulWidget {
  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  TextCard jobNumCard = new TextCard(label: 'LAST JOB #', isAndroid: Platform.isAndroid ? true : false,);
  TextCard cityCard = new TextCard(label: 'LOCATION', isAndroid: Platform.isAndroid ? true : false,);
  
  int jobFoot = 0;
  String filterSize = '5\"';
  String filterColor;

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

  //TODO 2: Re-List as DropdownMenuItems
  List<String> colors = ['W', 'C', 'B', 'G']; // White, Clay, Beige, Gray

  List<Text> pickerItems = [];
  
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
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Job # and City cards
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
                // Job footage slider
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'JOB FOOTAGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              jobFoot.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' ft',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.white,
                            overlayColor: Color(0x29FFFFFF),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30.0,
                            ),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFFb9e682),
                          ),
                          child: Slider(
                            value: jobFoot.toDouble(),
                            min: 0.0,
                            max: 1000.0,
                            onChanged: (double newValue) {
                              setState(() {
                                jobFoot = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                      ),
                    ),
                  ),
                // Filter type and size
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardColor: kInactiveCardColor,
                        cardChild: Center(
                          child: DropdownButton<String>(
                            items: sizes,
                            onChanged: (String newValue) {
                              setState(() {
                                filterSize = newValue;
                              });
                            },
                            value: filterSize,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      //TODO 2: Add in selection for filter color
                      child: ReusableCard(
                        cardColor: kInactiveCardColor,
                        cardChild: Center(
                          child: DropdownButton<String>(
                            items: sizes,
                            onChanged: (String newValue) {
                              setState(() {
                                filterSize = newValue;
                              });
                            },
                            value: filterSize,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}