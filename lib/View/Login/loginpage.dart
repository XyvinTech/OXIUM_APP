import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../widgets/social_button.dart';

class LoginPageScreen extends GetView<LoginPageController> {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 6,
            ),
            Container(
              height: 157,
              width: 157,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/circleColor.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "A",
                  style: TextStyle(
                    fontFamily: "Sans Serif Shaded",
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 7,
            ),
            Text(
              kLoginAppName,
              style: TextStyle(
                fontFamily: "Sans Serif Shaded",
                fontSize: 40,
              ),
            ),

            Spacer(
              flex: 25,
            ),
            //google and facebook log in buttton
            Row(
              children: [
                SocialButton(
                  Image.asset(
                    "assets/images/google.png",
                    height: 36,
                    width: 36,
                    fit: BoxFit.fill,
                  ),
                  Colors.white,
                  kLoginButtonGoogle,
                  Color.fromRGBO(27, 27, 27, 0.6),
                  null,
                ),
                SizedBox(
                  width: 14,
                ),
                SocialButton(
                  Image.asset(
                    "assets/images/facebook.png",
                    height: 36,
                    width: 36,
                    fit: BoxFit.fill,
                  ),
                  Color(0xFF3B5994),
                  kLoginButtonFacebook,
                  Colors.white,
                  null,
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              height: 50,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF49488),
              ),
              child: Center(
                child: Text(
                  kLoginButtonPhone,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.61,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "By signing up you agree to our ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(27, 27, 27, 0.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: null,
                    child: Text(
                      "Terms.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(27, 27, 27, 0.5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "See how we use",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(27, 27, 27, 0.5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "your data in our ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(27, 27, 27, 0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: null,
                  child: Text(
                    " Privacy Policy.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(27, 27, 27, 0.5),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    ));
  }
}
  // Color(0xFF3B5994)





