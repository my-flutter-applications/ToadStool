import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  final String pname;
  final String pvalue;

  MyTable({this.pname, this.pvalue});
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Text(
              pname,
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.3,
            ),
            Text(pvalue,
                style: TextStyle(
                  color: Colors.white,
                ),
                textScaleFactor: 1.3),
          ],
        ),
      ],
    );
  }
}
