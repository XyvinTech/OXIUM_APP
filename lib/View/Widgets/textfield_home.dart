import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Utils/debouncer.dart';

class textField extends StatelessWidget {
  textField({
    super.key,
    required this.size,
    required this.controller,
    required this.hintText,
    this.validator,
    this.formKey,
    this.onChanged,
    this.suffix,
  });
  final Size size;
  final TextEditingController controller;
  final String hintText;
  final _debouncer = Debouncer(milliseconds: 1000);
  final GlobalKey<FormState>? formKey;
  final String Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        key: formKey,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffix,
            suffixIconConstraints: BoxConstraints.loose(size),
            hintStyle: TextStyle(fontSize: 16, color: Color(0xffBDBDBD)),
            contentPadding:
                EdgeInsets.only(left: size.width * .01, top: 0, bottom: 2),
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
        onChanged: (value) {
          if (onChanged != null) onChanged!(value);
          _debouncer.run(() {
            log('typing stoped');
          });
        },
        validator: validator,
      ),
    );
  }
}
