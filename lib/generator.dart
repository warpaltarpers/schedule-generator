import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaffilter_generator/components/reusable_card.dart';
import 'package:leaffilter_generator/components/constants.dart';
import 'package:leaffilter_generator/components/text_card.dart';
import 'dart:io' show Platform;
import 'components/bottom_button.dart';

class Generator extends StatefulWidget {
  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
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
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'JOB FOOTAGE',
                            style: kLabelTextStyle,
                          ),
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
                    // Filter size dropdown
                    Expanded(
                      child: ReusableCard(
                        cardColor: kActiveCardColor,
                        cardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('SIZE', style: kLabelTextStyle,),
                                SizedBox(height: 5.0),
                                DropdownButton<String>(
                                  items: sizes,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      filterSize = newValue;
                                    });
                                  },
                                  value: filterSize,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // Filter color dropdown
                      child: ReusableCard(
                        cardColor: kActiveCardColor,
                        cardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('COLOR', style: kLabelTextStyle,),
                                SizedBox(height: 5.0),
                                DropdownButton<String>(
                                  items: colors,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      filterColor = newValue;
                                    });
                                  },
                                  value: filterColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Miter slider
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '# OF MITERS',
                            style: kLabelTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              numMiters.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' miters',
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
                            value: numMiters.toDouble(),
                            min: 0.0,
                            max: 100.0,
                            onChanged: (double newValue) {
                              setState(() {
                                numMiters = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardColor: kActiveCardColor,
                        cardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('STORIES', style: kLabelTextStyle,),
                                SizedBox(height: 5.0),
                                DropdownButton<String>(
                                  items: stories,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      storyCount = newValue;
                                    });
                                  },
                                  value: storyCount,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardColor: kActiveCardColor,
                        cardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('PAYMENT', style: kLabelTextStyle,),
                                SizedBox(height: 5.0),
                                DropdownButton<String>(
                                  items: payments,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      filterSize = paymentType;
                                    });
                                  },
                                  value: paymentType,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BottomButton(
                  buttonTitle: 'GENERATE',
                  onTap: (){},
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}