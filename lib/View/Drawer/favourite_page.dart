import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/toastUtils.dart';
import '../Widgets/apptext.dart';
import '../Widgets/customText.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF0F1F6),
      body: Column(
        children: [
          height(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child:
                            SvgPicture.asset('assets/svg/arrow_back_ios.svg'))),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: CustomBigText(
                        text: 'Favourites',
                        size: 16,
                        color: Color(0xff828282),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                width(24.w)
              ],
            ),
          ),
          height(20.h),
          Expanded(
            child: ListView.builder(
                itemCount: 40,
                itemBuilder: (_, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //TODO: Replace the CachedNetworkImage with Image.asset() below
                        // CachedNetworkImage(imageUrl: imageUrl)
                        Row(
                          children: [
                            Container(
                              height: 97.h,
                              width: 97.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/svg/cafe_image.png'))),
                            ),
                            width(20.w),
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffF2994A),
                                            size: 15.sp,
                                          ),
                                          CustomText(
                                              text: '5.6',
                                              size: 12,
                                              color: Color(0xffF2994A)),
                                        ]),
                                  ),
                                  height(10.h),
                                  CustomText(
                                      text: 'Calista Cafe',
                                      color: Color(0xff4F4F4F),
                                      fontWeight: FontWeight.bold),
                                  CustomSmallText(
                                    text: "13 km Away",
                                    size: 13,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                        width(size.width * .035),
                        Container(
                          height: 35.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xffBDBDBD),
                              )),
                          child: Center(
                            child: Image.asset(
                              "assets/images/favorite1.png",
                              height: 25.h,
                              width: 25.w,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
