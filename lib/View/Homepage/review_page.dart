import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/Controller/review_page_controller.dart';
import 'package:freelancer_app/Model/reviewMode.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../Utils/routes.dart';
import '../../Utils/toastUtils.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';
import '../Widgets/customText.dart';

class ReviewPage extends GetView<ReviewPageController> {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0047C3),
          foregroundColor: Colors.white,
          elevation: 0,
          title: CustomBigText(
            text: 'Customer Review',
            color: Color(0xffffffff),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              }),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              height(size.height * .01),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              // CustomBigText(
              //   text: 'Customer Review',
              //   color: Color(0xff4f4f4f),
              // ),
              // CustomText(
              //     text: 'View Reviews',
              //     color: Color(0xff0047C3),
              //     size: 13)
              //     ],
              //   ),
              // ),
              height(size.height * .022),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // height: size.height * .023,
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * .005,
                                horizontal: size.width * .02,
                              ),
                              width: size.width * .17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffFFE1C7)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffF2994A),
                                      size: 17,
                                    ),
                                    CustomText(
                                        text: controller.totalRating.value,
                                        size: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffF2994A)),
                                  ]),
                            ),
                            height(size.height * .006),
                            Obx(
                              () => CustomText(
                                  text:
                                      '${controller.totalElements.value} Reviews',
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * .005,
                      height: size.height * .1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .09),
                          child: Column(children: [
                            reviewProgressBar('5', .3),
                            reviewProgressBar('4', .7),
                            reviewProgressBar('3', .5),
                            reviewProgressBar('2', .8),
                            reviewProgressBar('1', .1),
                          ]),
                        ))
                  ],
                ),
              ),
              height(size.height * .04),
              InkWell(
                onTap: () {
                  //TODO: open review write dialog
                  controller.calistaCafePageController.selectedRating.value = 0;
                  controller.calistaCafePageController.reviewController.text =
                      '';
                  Get.dialog(_dialougebox());
                },
                child: Text('Write Review',
                    style: GoogleFonts.poppins(
                        color: Color(0xff0047C3),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline)),
              ),
              height(size.height * .02),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.modelList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return customerReviewCard(controller.modelList[index]);
                  }),
                ),
              ),
              height(size.height * .2),
            ],
          ),
        ));
  }

  Widget reviewProgressBar(String title, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LinearPercentIndicator(
          width: size.width * .3,
          animation: true,
          lineHeight: 6.0,
          animationDuration: 1000,
          percent: value,
          barRadius: Radius.circular(15),
          progressColor: Color(0xff0047C3),
          padding: EdgeInsets.zero,
        ),
        Spacer(),
        CustomText(text: title, color: Colors.grey, size: 12)
      ],
    );
  }

  Widget customerReviewCard(ReviewModel model) {
    DateTime dateTime = DateTime.parse(model.creationDateTime);
    String time = timeago.format(dateTime);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .04, vertical: size.height * .00),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Container(
          // color: Colors.amber,
          alignment: Alignment.topRight,
          child: Container(
            height: size.height * .045,
            width: size.height * .045,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          ),
        )),
        width(size.width * .03),
        Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomBigText(
                      text: model.userName,
                      size: 17,
                      color: Color(0xff4f4f4f),
                    ),
                    width(size.width * .02),
                    Row(
                      children: List.generate(
                        model.rating.toInt(),
                        (index) => Icon(
                          Icons.star,
                          color: Color(0xffF2994A),
                          size: 17,
                        ),
                      ),
                    ),
                    Spacer(),
                    CustomSmallText(text: time),
                  ],
                ),
                height(size.height * .01),
                CustomText(
                  color: Color(0xff4f4f4f),
                  size: 15,
                  text: model.review.trim(),
                ),
                // height(size.height * .01)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Divider(),
                )
              ],
            ))
      ]),
    );
  }

  Widget _dialougebox() {
    return AlertDialog(
      backgroundColor: kwhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.all(0),
      content: Container(
          padding: EdgeInsets.all(20.w),
          height: 460.h,
          width: 348.w,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 32,
                  color: Color(0xff000000).withOpacity(0.06),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSmallText(
                text: "How is your Experience?",
                size: 16.sp,
                letterspacing: -0.41,
              ),
              height(20.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Obx(
                  () => Row(
                    children: List.generate(
                        5,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: GestureDetector(
                                onTap: () {
                                  controller.calistaCafePageController
                                      .selectedRating.value = index + 1;
                                },
                                child: SvgPicture.asset(
                                  controller.calistaCafePageController
                                                  .selectedRating.value ==
                                              0 ||
                                          controller.calistaCafePageController
                                                      .selectedRating.value -
                                                  1 <
                                              index
                                      ? "assets/svg/star_rate.svg"
                                      : "assets/svg/star_rate3.svg",
                                ),
                              ),
                            )),
                  ),
                ),
              ),
              height(25.h),
              TextFormField(
                minLines: 7,
                maxLines: 7,
                controller:
                    controller.calistaCafePageController.reviewController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "Leave Your Feedback here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Color(0xff908484),
                        )),
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.41,
                        color: Color(0xffBDBDBD)),
                    contentPadding: EdgeInsets.only(left: 20.w, top: 25.h)),
              ),
              height(20.h),
              _button(
                  button: "Leave feedback",
                  onTap: () async {
                    bool status = await controller.calistaCafePageController
                        .postReviewForChargeStation();
                    if (status) Get.dialog(_responseDialougebox());
                  }),
              height(20.h),
              CustomBigText(
                ontap: () {
                  Get.back();
                },
                text: "Cancel",
                size: 15.sp,
                color: Color(0xff0047C3),
              )
            ],
          )),
    );
  }

  Widget _button({required String button, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        width: 237.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: Color(0xff0047C3),
        ),
        child: Center(
          child: CustomBigText(
            text: button,
            size: 14.sp,
            color: Color(0xffF2F2F2),
          ),
        ),
      ),
    );
  }

  Widget _responseDialougebox() {
    return AlertDialog(
      backgroundColor: kwhite,
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
      content: Container(
        padding: EdgeInsets.all(20.w),
        height: 265.h,
        width: 348.w,
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEBF8F1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.w,
                          color: Color(0xff05A660),
                        )),
                    child: Center(
                      child: Image.asset(
                        "assets/images/vector1.png",
                        height: 17,
                        width: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height(15.h),
            CustomBigText(
              text: "Thank you for your response",
              size: 20.sp,
              color: Color(0xff4F4F4F),
            ),
            height(10.h),
            CustomSmallText(
              text: "Your response has been added",
              size: 13.sp,
            ),
            height(10.h),
            InkWell(
              onTap: () {
                Get.offAllNamed(Routes.homePageRoute);
              },
              child: Container(
                height: 56.h,
                width: 156.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Color(0xff0047C3),
                ),
                child: Center(
                  child: CustomBigText(
                    text: "Back to Maps",
                    size: 15.sp,
                    color: Color(0xffF2F2F2),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
