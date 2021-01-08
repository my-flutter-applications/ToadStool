import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;

  MyButton({this.onPressed, this.name});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        color: Theme.of(context).accentColor,
        onPressed: () {
          onPressed();
        });
  }
}
