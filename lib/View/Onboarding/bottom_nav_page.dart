import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/bottom_nav_screen_controller.dart';
import 'package:freelancer_app/View/Charge/charge_page.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

class BottomNavScreen extends GetView<BottomNavScreenController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          height: size.height * 0.08,
          width: size.width * 0.12,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/scan.png",
                  ),
                  fit: BoxFit.fill)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Obx(
            () => Container(
              height: size.height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.pageController.jumpToPage(0);
                      controller.IsMapiconColor.value = true;
                      controller.IschargeiconColor.value = false;
                      controller.IstripiconColor.value = false;
                      controller.IswalleticonColor.value = false;
                    },
                    icon: Icon(
                      Icons.map_outlined,
                      size: size.height * 0.03,
                      color: controller.IsMapiconColor == true
                          ? Color(0xff0047C3)
                          : Color(0xffBDBDBD),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.IsMapiconColor.value = false;
                      controller.IschargeiconColor.value = true;
                      controller.IstripiconColor.value = false;
                      controller.IswalleticonColor.value = false;
                      controller.pageController.jumpToPage(1);
                    },
                    icon: Icon(
                      Icons.bolt_outlined,
                      size: size.height * 0.03,
                      color: controller.IschargeiconColor == true
                          ? Color(0xff0047C3)
                          : Color(0xffBDBDBD),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.IstripiconColor.value = true;
                      controller.IsMapiconColor.value = false;
                      controller.IschargeiconColor.value = false;
                      controller.IswalleticonColor.value = false;
                      controller.pageController.jumpToPage(2);
                    },
                    icon: Icon(
                      Icons.mode_of_travel_outlined,
                      size: size.height * 0.03,
                      color: controller.IstripiconColor == true
                          ? Color(0xff0047C3)
                          : Color(0xffBDBDBD),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.IstripiconColor.value = false;
                      controller.IsMapiconColor.value = false;
                      controller.IschargeiconColor.value = false;
                      controller.IswalleticonColor.value = true;
                      controller.pageController.jumpToPage(3);
                    },
                    icon: Icon(
                      Icons.wallet_outlined,
                      size: size.height * 0.03,
                      color: controller.IswalleticonColor == true
                          ? Color(0xff0047C3)
                          : Color(0xffBDBDBD),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          children: [
            Center(
              child: Text("Maps Page"),
            ),
            ChargeScreen(),
            Center(
              child: Text("Trips Page"),
            ),
            Center(
              child: Text("Wallet Page"),
            ),
          ],
        ),
      ),
    );
  }
}
