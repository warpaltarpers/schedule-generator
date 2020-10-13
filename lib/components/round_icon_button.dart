import 'package:flutter/material.dart';
import 'package:schedule_generator/components/constants.dart';

class RoundIconButton extends StatelessWidget {
  
  RoundIconButton({@required this.icon, @required this.onPressed});
  
  final IconData icon;
  final Function onPressed;
  
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFFb9e682),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      elevation: 0,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}