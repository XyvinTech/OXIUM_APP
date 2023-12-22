import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer_app/Controller/review_page_controller.dart';
import 'package:freelancer_app/Model/reviewMode.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            mainAxisSize: MainAxisSize.min,
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
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Expanded(
              //         flex: 2,
              //         child: Align(
              //           alignment: Alignment.center,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Container(
              //                 // height: size.height * .023,
              //                 padding: EdgeInsets.symmetric(
              //                   vertical: size.height * .005,
              //                   horizontal: size.width * .02,
              //                 ),
              //                 width: size.width * .17,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                     color: Color(0xffFFE1C7)),
              //                 child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Icon(
              //                         Icons.star,
              //                         color: Color(0xffF2994A),
              //                         size: 17,
              //                       ),
              //                       CustomText(
              //                           text: controller.totalRating.value,
              //                           size: 15,
              //                           fontWeight: FontWeight.bold,
              //                           color: Color(0xffF2994A)),
              //                     ]),
              //               ),
              //               height(size.height * .006),
              //               Obx(
              //                 () => CustomText(
              //                     text:
              //                         '${controller.totalElements.value} Reviews',
              //                     color: Colors.grey),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: size.width * .005,
              //         height: size.height * .1,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(8),
              //             color: Colors.grey.shade300),
              //       ),
              //       Expanded(
              //           flex: 3,
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: size.width * .09),
              //             child: Column(children: [
              //               reviewProgressBar('5', .3),
              //               reviewProgressBar('4', .7),
              //               reviewProgressBar('3', .5),
              //               reviewProgressBar('2', .8),
              //               reviewProgressBar('1', .1),
              //             ]),
              //           ))
              //     ],
              //   ),
              // ),

              height(size.height * .04),
              InkWell(
                onTap: () {
                  /// open review write dialog
                  controller.calistaCafePageController.selectedRating.value = 0;
                  controller.calistaCafePageController.reviewController.text =
                      '';
                  // Get.dialog(Dialogs()
                  //     .writeReviewDialog(controller.calistaCafePageController));
                  Get.toNamed(Routes.paymentfeedbackPageRoute, arguments: [
                    controller.calistaCafePageController.model.value.id
                        .toString(),
                    kChargingStatusModel
                  ]);
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
              height(size.height * .05),
            ],
          ),
        ));
  }

  // Widget reviewProgressBar(String title, double value) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       LinearPercentIndicator(
  //         width: size.width * .3,
  //         animation: true,
  //         lineHeight: 6.0,
  //         animationDuration: 1000,
  //         percent: value,
  //         barRadius: Radius.circular(15),
  //         progressColor: Color(0xff0047C3),
  //         padding: EdgeInsets.zero,
  //       ),
  //       Spacer(),
  //       CustomText(text: title, color: Colors.grey, size: 12)
  //     ],
  //   );
  // }

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
}
