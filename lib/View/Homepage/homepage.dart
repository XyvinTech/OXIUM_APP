import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/homepage_controller.dart';
import 'package:freelancer_app/Model/chargeStationDetailsModel.dart';
import 'package:freelancer_app/Singletones/map_functions.dart';
import 'package:freelancer_app/Utils/my_flutter_app_icons.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/View/Charge/charge_page.dart';
import 'package:freelancer_app/View/Homepage/drawer.dart';
import 'package:freelancer_app/View/Homepage/map_screen.dart';
import 'package:freelancer_app/View/WalletPage/walletpage.dart';
import 'package:freelancer_app/View/Widgets/cached_network_image.dart';
import 'package:freelancer_app/View/Widgets/customText.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../Singletones/app_data.dart';
import '../../Singletones/common_functions.dart';
import '../../Utils/routes.dart';
import 'help_page_alive.dart';
import 'notification_page_alive.dart';
import 'notification_screen.dart';

class HomePageScreen extends GetView<HomePageController> {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    kContext = context;
    return appData.userModel.value.username.isNotEmpty
        ? Scaffold(
            key: controller.drawerKey,
            backgroundColor: kDefaultHomePageBackgroundColor,
            drawer: CustomDrawer(context),
            body: PageView(
              controller: controller.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                MapScreen(),
                NotiPageAlive(),
                ChargeScreen(),
                WalletScreen(),
                HelpPageAlive()
                //TripsScreen(),
              ],
            ),
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: Colors.transparent,
            //   splashColor: Colors.transparent,
            //   child: Container(
            //     alignment: Alignment.center,
            //     height: 120,
            //     width: 50,
            //     decoration: BoxDecoration(
            //       color: Color(0xff00FFB3),
            //       borderRadius: BorderRadius.circular(79),
            //     ),
            //     child: SvgPicture.asset(
            //       'assets/svg/qr_scan.svg',
            //       width: 25,
            //       height: 25,
            //     ),
            //   ),
            //   onPressed: () {
            //     // showBottomSheetWhenClickedOnMarker(null, controller);
            //     Get.toNamed(Routes.qrScanPageRoute);
            //   },
            // ),
            //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Obx(
              () => AnimatedBottomNavigationBar(
                  icons: [
                    CustomIcon.map,
                    CustomIcon.notifications,
                    CustomIcon.group_9024,
                    CustomIcon.wallet,
                    CustomIcon.support_agent,
                  ],
                  activeIndex: controller.activeIndex.value,
                  height: size.height * .085,
                  activeColor: Color(0xff0047C3),
                  inactiveColor: Color(0xffBDBDBD),
                  gapLocation: GapLocation.none,
                  notchSmoothness: NotchSmoothness.defaultEdge,
                  onTap: (index) {
                    controller.activeIndex.value = index;
                    controller.pageController.animateToPage(index,
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 600));
                  }
                  //other params
                  ),
            ),
          )
        : Scaffold(
            key: controller.drawerKey,
            drawer: CustomDrawer(context),
            body: MapScreen(),
          );
  }
}

showBottomSheetWhenClickedOnMarker(
    ChargeStationDetailsModel model, HomePageController controller) async {
  // CalistaCafePageController calcontroller =
  //     Get.put(CalistaCafePageController());
  double distance = 0;
  if (MapFunctions().curPos != null) {
    distance = (MapFunctions.distanceBetweenCoordinates(
                MapFunctions().curPos.latitude,
                MapFunctions().curPos.longitude,
                model.lattitude,
                model.longitude) /
            1000.0)
        .toPrecision(2);
  }
  List<String> amenities = model.amenities.split(',');
  bool available = false;
  List res = [];
  model.Chargers.forEach((element) {
    res = calculateAvailabiliy(
        element.evports, element.ocppStatus == 'Connected');
    kLog(res.toString());
    if (res[1] > 0) available = true;
  });
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: kContext,
    isScrollControlled: true,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        // calcontroller.dispose();
        return true;
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          SlidingUpPanel(
            color: Colors.transparent,
            controller: controller.panelController,
            minHeight: size.height * .32,
            maxHeight: size.height * .80,
            onPanelSlide: (value) {
              // kLog(value.toString());
            },
            onPanelClosed: () {},

            onPanelOpened: () {
              Get.offNamed(Routes.calistaCafePageRoute, arguments: model);
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * .06),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.grey,
                              height: 90.w,
                              // width: 90.w,
                              child: cachedNetworkImage(model.image),
                            )),
                      ),
                      width(size.width * .035),
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * .023,
                              width: size.width * .14,
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
                                        text: model.rating.isEmpty
                                            ? '0'
                                            : double.parse(model.rating)
                                                .toStringAsFixed(2),
                                        size: 12,
                                        color: Color(0xffF2994A)),
                                  ]),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: CustomText(
                                      text: model.name,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff4F4F4F),
                                      fontWeight: FontWeight.bold),
                                ),
                                width(size.width * .017),
                              ],
                            ),
                            CustomText(
                                text: '${distance} km away',
                                color: Color(0xff828282),
                                fontWeight: FontWeight.normal,
                                size: 12),
                            if (amenities.isNotEmpty &&
                                amenities[0].isNotEmpty) ...[
                              height(8.h),
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 4.7),
                                itemCount: amenities.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/${amenities[index]}.svg'),
                                      width(size.width * .01),
                                      Expanded(
                                        child: CustomText(
                                            text:
                                                amenities[index].toTitleCase(),
                                            color: Color(0xff828282),
                                            fontWeight: FontWeight.normal,
                                            size: 12),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              height(8.h),
                            ],
                          ],
                        ),
                      ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .035),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: available
                                ? Color(0xff219653)
                                : Color.fromARGB(255, 221, 90, 90)),
                        child: Row(
                          children: [
                            available
                                ? SvgPicture.asset('assets/svg/tick.svg')
                                : Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                            width(size.width * .01),
                            CustomText(
                                text: available
                                    ? 'Chargers Available'
                                    : 'Chargers Unavailable',
                                size: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF2F2F2)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                         
                          InkWell(
                            onTap: () async {
                              showLoading(kLoading);
                              bool res = await CommonFunctions().changeFavorite(
                                  stationId: model.id,
                                  makeFavorite: !model.isFavorite);
                              if (res) {
                                model.isFavorite = !model.isFavorite;
                                controller.reload++;
                              }
                              hideLoading();
                            },
                            child: Obx(
                              () => Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * .01 +
                                        controller.reload.value * 0),
                                padding: EdgeInsets.all(size.width * .02),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Color(0xffBDBDBD))),
                                child: SvgPicture.asset(model.isFavorite
                                    ? 'assets/svg/favorite1.svg'
                                    : 'assets/svg/favorite.svg'),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
           
           
            ),
          ),
        ],
      ),
    ),
  );
}
