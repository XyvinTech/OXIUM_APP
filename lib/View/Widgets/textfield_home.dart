import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.autofocus = false,
  });
  final Size size;
  final TextEditingController controller;
  final String hintText;
  final _debouncer = Debouncer(milliseconds: 1000);
  final GlobalKey<FormState>? formKey;
  final String Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffix;
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        key: formKey,
        controller: controller,
        autofocus: autofocus,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffix,
            suffixIconConstraints: BoxConstraints.loose(size),
            hintStyle: TextStyle(fontSize: 16.sp, color: Color(0xffBDBDBD)),
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 12.h, top: 14.h, left: 4.w),
            fillColor: Color.fromARGB(255, 255, 255, 255),
            border: OutlineInputBorder(),
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
