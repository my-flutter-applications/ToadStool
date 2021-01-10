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
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }
}

// class MyButton2 extends StatelessWidget {
//   final Function onPressed;
//   final String name;

//   MyButton2({this.name, this.onPressed});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       child: RaisedButton(
//         child: Text(
//           name,
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
//         ),
//         color: Theme.of(context).accentColor,
//         onPressed: () {
//           onPressed();
//         },
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }
