import 'package:flutter/material.dart';
import 'constants.dart';

class TextCard extends StatelessWidget {
  
  TextCard({@required this.label});
  
  final String label;


  String textInput;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label, style: kLabelTextStyle,),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: TextField(
            decoration: InputDecoration(
              labelStyle: kCardTextStyle,
            ),
            cursorColor: kCardTextColor,
            style: kCardTextStyle,
            onChanged: (value){
              textInput = value;
            },
          ),
        )
      ],
    );
  }
}