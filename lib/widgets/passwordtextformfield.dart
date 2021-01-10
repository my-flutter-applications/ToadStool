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
      style: TextStyle(color: Theme.of(context).primaryColor),
      onChanged: onChanged,
      validator: validator,
      obscureText: obserText,
      decoration: InputDecoration(
        hintText: name,

        ////////
        hintStyle: TextStyle(color: Colors.grey.shade300),
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
        suffixIcon: GestureDetector(
            onTap: onTap,
            child: obserText
                ? Icon(
                    Icons.visibility,
                    color: Colors.grey.shade200,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: Colors.grey.shade200,
                  )),
      ),
    );
  }
}
