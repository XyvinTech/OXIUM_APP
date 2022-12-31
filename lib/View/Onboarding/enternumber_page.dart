import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class EnterNumberPage extends GetView<LoginPageController> {
  const EnterNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: CustomAppBar(
            text: "skip",
            icon: Icon(Icons.arrow_forward),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.055,
            right: size.width * 0.055,
            top: size.height * 0.020,
            // bottom: size.height * 0.045,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomBigText(text: "Sign up with your Phone Number"),
              SizedBox(
                height: size.height * 0.04,
              ),
              // enterphnnumber button
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      width: 2,
                      color: Color(0xffE0E0E0),
                    )),
                child: Row(
                  children: [
                    Text(
                      "+880",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4F4F4F),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: size.height * 0.03,
                      width: size.width * 0.06,
                      child: Icon(
                        Icons.chevron_left,
                        color: Color(0xff4F4F4F),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.014,
                    ),
                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.008,
                      color: Color(0xffE0E0E0),
                    ),
                    SizedBox(
                      width: size.width * 0.035,
                    ),
                    Form(
                      child: Container(
                        height: size.height * 0.065,
                        width: size.width * 0.5,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(15),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: "Phone Number",
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
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomSmallText(text: "We will send an OTP to verify yor Number"),
              SizedBox(
                height: size.height * 0.035,
              ),

              //send OTP button
              AppButton(
                color: Color(0xff0047C3),
                text: "Send OTP",
                textColor: Color(
                  0xffF2F2F2,
                ),
                iconColor: Color(0xffF2F2F2),
              ),

              SizedBox(
                height: size.height * 0.045,
              ),
              Row(
                children: [
                  Container(
                    height: size.height * 0.003,
                    width: size.width * 0.4,
                    color: Color(0xffE0E0E0),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  CustomSmallText(text: "OR"),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Container(
                    height: size.height * 0.003,
                    width: size.width * 0.4,
                    color: Color(0xffE0E0E0),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              SignUpButton(
                borderWidth: 2,
                borderColor: Color(0xffE0E0E0),
                color: kwhite,
                text: "Sign up with Google",
                logo: Image.asset("assets/images/google1.png"),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              SignUpButton(
                textColor: Color(0xffF2F2F2),
                color: kblack,
                text: "Sign up with Apple",
                logo: Image.asset("assets/images/apple.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
