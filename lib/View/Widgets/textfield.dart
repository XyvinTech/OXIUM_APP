import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class AppTextField extends GetView<LoginPageController> {
  final String hintText;
  final Widget icon;
  final TextInputType keyboardtype;
  final TextEditingController Controller;
  final void Function(String) onChanged;
  AppTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.keyboardtype,
      required this.Controller,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: size.width * 0.07,
        right: size.width * 0.07,
      ),
      height: size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          border: Border.all(
            width: 2,
            color: Color(0xffE0E0E0),
          )),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: size.height * 0.04,
            width: size.width * 0.05,
            // color: Colors.red,
            child: icon,
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Form(
            child: Container(
              height: size.height * 0.065,
              width: size.width * 0.5,
              child: TextFormField(
                controller: Controller,
                onChanged: onChanged,
                keyboardType: keyboardtype,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffBDBDBD),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
