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
  ScrollController scrollController = ScrollController();
  int page = 0, size = 10, totalElements = 0;
  RxInt reload = 0.obs;
  bool isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWalletTransactions();
    _scrollListen();
  }

  _scrollListen() {
    scrollController.addListener(() async {
// nextPageTrigger will have a value equivalent to 80% of the list size.
      var nextPageTrigger = 0.99 * scrollController.position.maxScrollExtent;

// _scrollController fetches the next paginated data when the current postion of the user on the screen has surpassed
      if (modelList.length < totalElements &&
          !isLoading &&
          scrollController.position.pixels > nextPageTrigger) {
        // loading = true;
        // fetchData();
        kLog(modelList.length.toString());
        page++;
        isLoading = true;
        await getWalletTransactions();
        isLoading = false;
      }
    });
  }

  getWalletTransactions() async {
    showLoading(kLoading);
    var res = await CommonFunctions()
        .getWalletTransactions(page.toString(), size.toString());
    hideLoading();
    modelList.addAll(res);
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
