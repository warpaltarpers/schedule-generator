import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class TextCard extends StatelessWidget {
  
  TextCard({@required this.label, @required this.isAndroid});
  
  final String label;
  final bool isAndroid;

  String textInput;

  TextField androidText() {
    return TextField(
      decoration: InputDecoration(
        labelStyle: kCardTextStyle,
      ),
      cursorColor: kCardTextColor,
      style: kCardTextStyle,
      onChanged: (value){
        textInput = value;
      },
    );
  }

  CupertinoTextField iOSText() {
    return CupertinoTextField(
      cursorColor: kCardTextColor,
      style: kCardTextStyle,
      onChanged: (value){
        textInput = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label, style: kLabelTextStyle,),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: isAndroid ? androidText() : iOSText(),
        )
      ],
    );
  }
}