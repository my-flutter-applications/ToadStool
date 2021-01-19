import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final String name;
  final Function onChanged;
  final IconData icon;

  MyTextFormField({this.name, this.validator, this.onChanged, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: name,
        prefix: Padding(
          padding: EdgeInsets.only(top: 0), // add padding to adjust icon
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        hintStyle: TextStyle(
            // color: Theme.of(context).primaryColorDark,
            color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
