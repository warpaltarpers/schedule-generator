import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaffilter_generator/components/all.dart';
import 'dart:io' show Platform;
import 'package:leaffilter_generator/block_page.dart';

class GeneratorScroll extends StatefulWidget {
  @override
  _GeneratorScrollState createState() => _GeneratorScrollState();
}

class _GeneratorScrollState extends State<GeneratorScroll> {
  TextCard jobNumCard = new TextCard(label: 'LAST JOB #', isAndroid: Platform.isAndroid ? true : false,);
  TextCard cityCard = new TextCard(label: 'LOCATION', isAndroid: Platform.isAndroid ? true : false,);
  
  int jobFoot = 0;
  int gutterFoot = 0;
  int numMiters = 0;
  String filterSize = '5\"';
  String filterColor = 'W';
  String gutterSize = '5\"';
  String storyCount = '1';
  String paymentType = 'C';
  
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
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
              Row(
                children: <Widget>[
                  // Filter size dropdown
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardChild: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
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
                          padding: const EdgeInsets.all(15.0),
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
              ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'GUTTER FOOTAGE',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          gutterFoot.toString(),
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
                        value: gutterFoot.toDouble(),
                        min: 0.0,
                        max: 1000.0,
                        onChanged: (double newValue) {
                          setState(() {
                            gutterFoot = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text('GUTTER SIZE', style: kLabelTextStyle,),
                        SizedBox(height: 5.0),
                        DropdownButton<String>(
                          items: gSizes,
                          onChanged: (String newValue) {
                            setState(() {
                              gutterSize = newValue;
                            });
                          },
                          value: gutterSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
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
                                    paymentType = newValue;
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
                onTap: (){
                  if(jobNumCard.returnInput() != null && cityCard != null) {
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BlockPage(
                      jobNum: jobNumCard.returnInput(),
                      location: cityCard.returnInput(),
                      jobFootage: jobFoot,
                      filterSize: filterSize,
                      filterColor: filterColor,
                      miters: numMiters,
                      stories: storyCount,
                      payment: paymentType,
                      gutterFoot: gutterFoot,
                      gutterSize: gutterSize,
                    )));
                  } else {
                    return;
                  }
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}