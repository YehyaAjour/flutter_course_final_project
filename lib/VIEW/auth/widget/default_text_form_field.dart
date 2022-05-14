import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController controller;
  final TextInputType keyboardType;
  final String validateText;
  final String labelText;
  final IconData prefix;
  final IconData suffix;
  final bool isPassword;
  final Function suffixPressed;

  DefaultTextFormField(
      {Key key,
        this.controller,
      this.keyboardType,
      this.validateText,
      this.labelText,
      this.prefix,
      this.suffix,
      this.isPassword=false,
      this.suffixPressed})
      : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return validateText;
          }else{return null;}
        },
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xff69A03A)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff69A03A),
            ),
          ),
          prefixIcon: Icon(
            prefix,
            color: Color(0xff69A03A),
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                    color: Color(0xff69A03A),
                  ),
                )
              : null,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
