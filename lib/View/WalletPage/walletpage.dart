import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/Controller/walletPage_controller.dart';
import 'package:freelancer_app/Model/orderModel.dart';
import 'package:freelancer_app/Singletones/dialogs.dart';
import 'package:freelancer_app/Utils/toastUtils.dart';
import 'package:freelancer_app/Utils/utils.dart';
import 'package:freelancer_app/View/WalletPage/topup_page.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Singletones/app_data.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with AutomaticKeepAliveClientMixin {
  WalletPageController controller = Get.find();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: kwhite,
              expandedHeight: size.height * 0.562 + 0 * controller.reload.value,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: size.height * 0.58,
                          width: size.width,
                          color: Color(0xffF5F9FF),
                          child: Column(
                            children: [
                              Container(
                                height: size.height * 0.46,
                                width: size.width,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                      Color(0xff202020),
                                      Color(0xff4F4F4F),
                                    ])),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        child: SvgPicture.asset(
                                            "assets/svg/g1.svg"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.44,
                          top: size.height * 0.02,
                          child: SafeArea(
                            child: CustomBigText(
                              text: "Wallet",
                              color: Color(0xffF2F2F2),
                              size: 18,
                            ),
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.11,
                          top: size.height * 0.12,
                          child: SvgPicture.asset("assets/svg/goeclogo.svg"),
                        ),
                        Positioned(
                            right: size.width * 0.11,
                            top: size.height * 0.11,
                            child: CustomBigText(
                              text: '₹ 1 = 1 Coins',
                              color: Color(0xffF2F2F2),
                            )
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     CustomBigText(
                            //       text:
                            //           "${appData.userModel.value.total_sessions}",
                            //       size: 18,
                            //       color: Color(0xffF2F2F2),
                            //     ),
                            //     height(size.height * 0.003),
                            //     CustomSmallText(
                            //       text: "No of Charges",
                            //     )
                            //   ],
                            // ),
                            ),
                        Positioned(
                          right: size.width * 0.11,
                          top: size.height * 0.23,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomBigText(
                                text:
                                    "${appData.userModel.value.total_sessions}",
                                size: 18,
                                color: Color(0xffF2F2F2),
                              ),
                              height(size.height * 0.003),
                              CustomSmallText(
                                text: "No of Charges",
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.11,
                          top: size.height * 0.23,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSmallText(
                                text: "Balance Credits",
                              ),
                              height(size.height * 0.003),
                              Obx(
                                () => CustomBigText(
                                  text:
                                      "₹ ${appData.userModel.value.balanceAmount.toStringAsFixed(2)}",
                                  size: 26,
                                  color: Color(0xff00FFB3),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: size.height * 0.083,
                          left: size.width * .02,
                          right: size.width * .02,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => PopUpPage());
                            },
                            child: _walletCard(
                                title: "TopUp",
                                assets: "assets/svg/circledoller.svg",
                                color: Color(0xff0047C3),
                                shadowColor: Color(0xff000000).withOpacity(.33),
                                textColor: Color(0xff00FFB3)),
                          ),
                        ),
                        // Positioned(
                        //   bottom: size.height * 0.025,
                        //   right: size.width * 0.04,
                        //   child: _walletCard(
                        //       title: "Scan Code",
                        //       assets: "assets/svg/qr_code.svg",
                        //       color: kwhite,
                        //       shadowColor: Color(0xff000000).withOpacity(.06),
                        //       textColor: Color(0xff0047C3)),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.1),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.008,
                        width: size.width * 0.34,
                        decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      CustomBigText(
                        text: "Payments",
                        size: 14,
                        color: Color(0xff828282),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Container(
                  height:
                      controller.modelList.length * (size.height * 0.15 * 1.18),
                  child: Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                              itemCount: controller.modelList.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * .03,
                                      vertical: size.height * .01),
                                  child: InkWell(
                                    onTap: () {
                                      Dialogs().wallet_transaction_popup(
                                          model: controller.modelList[index]);
                                    },
                                    child: _creditCard(
                                        model: controller.modelList[index]),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _walletCard(
      {required String title,
      required String assets,
      required Color color,
      required Color shadowColor,
      required Color textColor}) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              spreadRadius: 0,
              color: shadowColor,
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assets,
            width: 30.h,
          ),
          width(size.width * 0.025),
          CustomBigText(
            text: title,
            size: 14,
            color: textColor,
          )
        ],
      ),
    );
  }

  Widget _creditCard({
    required OrderModel model,
  }) {
    String title = '';
    Color color = Colors.transparent;
    if (model.status == 'P') {
      title = 'Success';
      color = Color(0xff219653);
    } else if (model.status == 'I') {
      title = 'Pending';
      color = Color(0xffDF8600);
    } else {
      title == 'Failed';
      color = Color(0xffDC2525);
    }
    return Container(
      height: size.height * 0.15,
      padding: EdgeInsets.symmetric(
          vertical: size.height * .01, horizontal: size.width * .03),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                spreadRadius: 0,
                color: Color(0xff000000).withOpacity(.08))
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    child: SvgPicture.asset(model.statusUpdateBy == 'M'
                        ? 'assets/svg/wallet_topup.svg'
                        : 'assets/svg/admin_topup.svg')),
                width(size.width * .02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSmallText(
                      text: 'Credit',
                      size: 10.sp,
                    ),
                    CustomBigText(
                      text: model.statusUpdateBy == 'M'
                          ? 'Wallet Topup'
                          : 'Admin Topup',
                      letterspacing: -0.408,
                      color: Color(0xff828282),
                      size: 18.sp,
                      fontWeight: FontWeight.w500,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset("assets/svg/arrow_forward_ios.svg")
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                width(size.width * .03),
                SvgPicture.asset(
                  "assets/svg/calendar_month.svg",
                  width: size.width * 0.045,
                ),
                CustomSmallText(
                  text: getTimeFromTimeStamp(
                      model.pgOrderGenTime, 'dd MMM yyyy hh:mm a'),
                  size: 12.sp,
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomBigText(
                      text: "${model.amount}",
                      size: 20.sp,
                      color: color,
                    ),
                    width(5.w),
                    CustomSmallText(
                      text: 'Coins',
                      size: 12.sp,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
