import 'package:flutter/material.dart';
import 'package:leaffilter_generator/components/reusable_card.dart';
import 'package:leaffilter_generator/components/constants.dart';
import 'package:leaffilter_generator/components/text_card.dart';

class Generator extends StatefulWidget {
  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  TextCard cityCard = new TextCard(label: 'LOCATION');
  
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
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: cityCard,
                    onPress: (){},
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}