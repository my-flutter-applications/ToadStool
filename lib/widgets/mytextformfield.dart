import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  // final Function validator;
  final TextEditingController controller;
  final String name;
  final Function onChanged;
  final IconData icon;
  final bool enableEdit;

  MyTextFormField({
    this.name,
    // this.validator,
    this.controller,
    this.onChanged,
    this.icon,
    this.enableEdit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enableEdit,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey.shade400,
        ),
        hintText: name,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white10,
          ),
        ),
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
