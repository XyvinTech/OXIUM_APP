import 'package:flutter/material.dart';

import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/View/Onboarding/enternumber_page.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kOnboardingBackgroundColors,
        body: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.055,
            right: size.width * 0.055,
            top: size.height * 0.020,
            bottom: size.height * 0.045,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginCustomAppBar(),
              Spacer(
                flex: 18,
              ),
              Text(
                kLoginJoinGoec,
                style: kAppJoinGOECTextStyle,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                kLoginRevolutions,
                style: kAppRevolutionsTextStyle,
              ),
              Spacer(
                flex: 4,
              ),
              //Create Account button

              StartedButton(
                color: Color(0xff00FFB3),
                text: "Get Started",
                onTap: () {
                  Get.toNamed(Routes.enternumberpageRoute);
                },
              ),
              Spacer(
                flex: 1,
              ),

              //Login button

              LoginButton(color: Colors.transparent, text: "Login"),
              Spacer(
                flex: 2,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text:
                            'By selecting one or the other option you are agreeing ',
                        style: kAppBottomTextSpanTextStyle1,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'to the',
                        style: kAppBottomTextSpanTextStyle1,
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms & Conditions ',
                            style: kAppBottomTextSpanTextStyle2,
                          ),
                          TextSpan(
                            text: ' and ',
                            style: kAppBottomTextSpanTextStyle1,
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: kAppBottomTextSpanTextStyle2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
