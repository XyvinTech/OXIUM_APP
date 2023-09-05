import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/Singletones/app_data.dart';
import 'package:freelancer_app/Utils/firebase_notifications.dart';
import 'package:freelancer_app/Utils/routes.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/appbutton.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Utils/utils.dart';
import 'onboarding_cards.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/OnboardingBackground.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.055,
                right: size.width * 0.055,
                top: size.height * 0.020,
                bottom: size.height * 0.045,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  OnboardingCustomAppBar(),

                  //OnboardingCards(),
                  Center(
                    child: SizedBox(
                      height: size.height / 2.1,
                      child: PageView(
                        controller: controller.cardController,
                        children: [
                          CustomCards(
                            image: "assets/images/OnboardingCard1.png",
                            subText: "Locate chargers",
                          ),
                          CustomCards(
                            image: "assets/images/OnboardingCard2.png",
                            subText: "Monitor charging \nsessions",
                          ),
                          CustomCards(
                            image: "assets/images/OnboardingCard3.png",
                            subText: "Pay conveniently",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: controller.cardController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Color.fromARGB(255, 14, 224, 157),
                          dotColor: kOnboardingColors,
                          expansionFactor: 2,
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),

                  //Create Account button

                  StartedButton(
                    color: kOnboardingColors,
                    iconColor: Colors.white,
                    isIcon: true,
                    text: "Get Started",
                    textColor: Colors.white,
                    onTap: () async {
                      await FireBaseNotification().setNotificationId();
                      await Clipboard.setData(
                          ClipboardData(text: appData.notification_token));
                      Get.toNamed(Routes.enternumberpageRoute);
                    },
                  ),

                  //Login button

                  // LoginButton(color: Colors.transparent, text: "Login"),
                  Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'By selecting get started, you are agreeing to the ',
                                textAlign: TextAlign.center,
                                style: kAppBottomTextSpanTextStyle1,
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     controller.onTermsCondition();
                            //   },
                            //   child: RichText(
                            //     text: TextSpan(
                            //       text: '',
                            //       style: kAppBottomTextSpanTextStyle2,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.onTermsCondition();
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'Terms & Conditions',
                                  style: kAppBottomTextSpanTextStyle2,
                                ),
                              ),
                            ),
                            Text(
                              ' and ',
                              style: kAppBottomTextSpanTextStyle1,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.onPrivacyPolicy();
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'Privacy Policy.',
                                  style: kAppBottomTextSpanTextStyle2,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
