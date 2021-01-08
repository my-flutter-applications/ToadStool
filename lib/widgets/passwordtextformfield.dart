import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final String name;
  final Function onTap;
  final Function onChanged;

  PasswordTextFormField(
      {this.obserText, this.validator, this.name, this.onTap, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obserText,
      decoration: InputDecoration(
        hintText: name,
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColorDark,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        suffixIcon: GestureDetector(
            onTap: onTap,
            child: obserText
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off)),
      ),
    );
  }
}
