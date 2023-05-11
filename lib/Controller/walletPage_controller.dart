import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/orderModel.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../Singletones/common_functions.dart';
import '../Utils/toastUtils.dart';
import '../constants.dart';

class WalletPageController extends GetxController {
  RxBool enablemailTextfield = false.obs;
  final TextEditingController amountController = TextEditingController();
  RxList<OrderModel> modelList = RxList();

  RxInt reload = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWalletTransactions();
  }

  getWalletTransactions() async {
    showLoading(kLoading);
    modelList.value = await CommonFunctions()
        .getWalletTransactions(0.toString(), 10.toString());
    hideLoading();
  }

  orderTopUp() async {
    if (!isNumeric(amountController.text)) return;
    showLoading(kLoading);
    String order_id = await CommonFunctions()
        .getOrderIdRazorpay(int.parse(amountController.text));
    hideLoading();
    CommonFunctions().openRazorPay(
        amount: int.parse(amountController.text),
        order_id: order_id,
        descirption: 'Top up your account');
  }
}
