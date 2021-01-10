import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final String name;
  final Function onTap;

  ChangeScreen({this.whichAccount, this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(whichAccount, style: TextStyle(color: Colors.white)),
        SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        )
      ],
    );
  }
}
