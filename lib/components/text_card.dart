import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class TextCard extends StatelessWidget {
  
  TextCard({@required this.label, @required this.isAndroid});
  
  final String label;
  final bool isAndroid;

  String textInput;

  String returnInput() {
    return textInput;
  }

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
      maxLines: null,
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Text(label, style: kLabelTextStyle,),
        ),
        SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: isAndroid ? androidText() : iOSText(),
        )
      ],
    );
  }
}