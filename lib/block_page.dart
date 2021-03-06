import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_generator/components/bottom_button.dart';
import 'package:schedule_generator/components/reusable_card.dart';
import 'package:schedule_generator/components/constants.dart';
import 'package:schedule_generator/components/text_card.dart';
import 'dart:io' show Platform;

class BlockPage extends StatelessWidget {

  BlockPage({@required this.jobNum, @required this.location, @required this.filterSize, @required this.filterColor, @required this.miters, @required this.jobFootage, @required this.stories, @required this.gutterFoot, @required this.gutterSize, @required this.payment});
  
  final String jobNum;
  final String location;
  final String filterSize;
  final String filterColor;
  final int miters;
  final int jobFootage;
  final String stories;
  final int gutterFoot;
  final String gutterSize;
  final String payment;

  String getNextJobNum() {
    var i = int.parse(jobNum);
    i++;
    return i.toString();
  }

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
          child: Column(
            children: <Widget>[
              ReusableCard(
                cardColor: Colors.white,
                cardChild: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        getNextJobNum(),
                        style: TextStyle(
                          fontSize: 32.0,
                        ),
                      ),
                      Text(
                        '$jobFootage\' $filterSize $filterColor $stories story ${miters}M',
                        style: TextStyle(
                          fontSize: 32.0,
                        ),
                      ),
                      Text(
                        '$gutterFoot\' gutter $gutterSize',
                        style: TextStyle(
                          fontSize: 32.0,
                        ),
                      ),
                      Text(
                        '$location  $payment',
                        style: TextStyle(
                          fontSize: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: TextCard(
                  label: 'NOTES',
                  isAndroid: Platform.isAndroid ? true : false,
                ),
              ),
              BottomButton(
                buttonTitle: 'RESET',
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}