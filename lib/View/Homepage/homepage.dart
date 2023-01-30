import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/chargePage_controller.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Controller/trips_screen_controller.dart';
import 'package:freelancer_app/Model/chargingCafeModel.dart';
import 'package:freelancer_app/Utils/my_flutter_app_icons.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/View/Charge/charge_page.dart';
import 'package:freelancer_app/View/Homepage/drawer.dart';
import 'package:freelancer_app/View/Homepage/map_screen.dart';
import 'package:freelancer_app/View/Trips/trips_page.dart';
import 'package:freelancer_app/View/WalletPage/walletpage.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Utils/routes.dart';

class HomePageScreen extends GetView<HomePageController> {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (size.height == 0) size = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.drawerKey,
      backgroundColor: kDefaultHomePageBackgroundColor,
      drawer: CustomDrawer(),
      body: PageView(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MapScreen(),
          ChargeScreen(),
          TripsScreen(),
          WalletScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xff00FFB3),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(
            'assets/svg/qr_scan.svg',
            width: 20,
            height: 20,
          ),
        ),
        onPressed: () {
          showBottomSheetWhenClickedOnMarker(null, controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
            icons: [
              CustomIcon.map,
              CustomIcon.bolt,
              CustomIcon.mode_of_travel,
              CustomIcon.account_balance_wallet,
            ],
            activeIndex: controller.activeIndex.value,
            height: size.height * .085,
            activeColor: Color(0xff0047C3),
            inactiveColor: Color(0xffBDBDBD),
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) {
              controller.activeIndex.value = index;
              controller.pageController.jumpToPage(index);
            }
            //other params
            ),
      ),
    );
  }
}

showBottomSheetWhenClickedOnMarker(
    ChargingCafeModel? model, HomePageController controller) {
  // CalistaCafePageController calcontroller =
  //     Get.put(CalistaCafePageController());
  Get.bottomSheet(WillPopScope(
    onWillPop: () async {
      // calcontroller.dispose();
      return true;
    },
    child: SlidingUpPanel(
      color: Colors.transparent,
      controller: controller.panelController,
      minHeight: size.height * .32,
      maxHeight: size.height * .80,
      onPanelSlide: (value) {},
      onPanelClosed: () {},
      onPanelOpened: () {
        Get.offNamed(Routes.calistaCafePageRoute);
      },
      // panel: CalistaCafeScreen(),
      panel: Container(
        color: Colors.white,
      ),
      collapsed: Container(
        height: size.height * .32,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(children: [
          height(size.height * .01),
          Container(
            height: size.height * .006,
            width: size.width * .25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffD9D9D9)),
          ),
          height(size.height * .05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              children: [
                //TODO: Replace the CachedNetworkImage with Image.asset() below
                // CachedNetworkImage(imageUrl: imageUrl)
                Expanded(
                    flex: 3, child: Image.asset('assets/svg/cafe_image.png')),

                width(size.width * .035),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * .023,
                        width: size.width * .12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFE1C7)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffF2994A),
                                size: 15,
                              ),
                              CustomText(
                                  text: '5.6',
                                  size: 12,
                                  color: Color(0xffF2994A)),
                            ]),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                              text: 'Calista Cafe',
                              color: Color(0xff4F4F4F),
                              fontWeight: FontWeight.bold),
                          width(size.width * .017),
                          CustomText(
                              text: '13 km Away',
                              color: Color(0xff828282),
                              fontWeight: FontWeight.normal,
                              size: 12),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/wc.svg'),
                              width(size.width * .01),
                              CustomText(
                                  text: 'Rest Room',
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.normal,
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/hotel.svg'),
                              width(size.width * .01),
                              CustomText(
                                  text: 'Hotel',
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.normal,
                                  size: 12),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/local_cafe.svg'),
                              width(size.width * .01),
                              CustomText(
                                  text: 'Cafe',
                                  color: Color(0xff828282),
                                  fontWeight: FontWeight.normal,
                                  size: 12),
                            ],
                          ),
                        ],
                      ),
                      height(size.height * .01),
                      CustomText(
                          text: 'Mannampatta . Near Govt. College , Kearal ',
                          size: 12,
                          color: Color(0xff4F4F4F))
                    ],
                  ),
                )
              ],
            ),
          ),
          height(size.height * .05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * .04,
                  padding: EdgeInsets.symmetric(horizontal: size.width * .035),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff219653)),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/tick.svg'),
                      width(size.width * .01),
                      CustomText(
                          text: 'Charges Available',
                          size: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF2F2F2)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(size.width * .02),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * .01),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffBDBDBD))),
                      child: SvgPicture.asset('assets/svg/share.svg'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * .01),
                      padding: EdgeInsets.all(size.width * .02),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffBDBDBD))),
                      child: SvgPicture.asset('assets/svg/telegram.svg'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * .01),
                      padding: EdgeInsets.all(size.width * .02),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffBDBDBD))),
                      child: SvgPicture.asset('assets/svg/favorite.svg'),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    ),
  ));
}
