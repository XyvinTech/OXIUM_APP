import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freelancer_app/Model/orderModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  RxList<String> payment_mode = RxList();
  RxList<String> payment_status = RxList();
  bool lock = false;
  RxBool isFailed = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWalletTransactions();
    _scrollListen();
  }

  onClose() {
    super.onClose();
    scrollController.dispose();
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
        page++;
        isLoading = true;
        await getWalletTransactions();
        isLoading = false;
      }
    });
  }

  getWalletTransactions() async {
    showLoading(kLoading);
    String start = '';
    String end = '';
    if (startDate.text.isNotEmpty && endDate.text.isNotEmpty) {
      start = DateFormat('dd-MMM-yyyy')
          .format(DateFormat('dd/MM/yyyy').parse(startDate.text));
      end = DateFormat('dd-MMM-yyyy')
          .format(DateFormat('dd/MM/yyyy').parse(endDate.text));
    }
    if (payment_status.isEmpty && isFailed.value) {
      payment_mode.clear();
    }
    if (isFailed.value && !payment_status.contains('I')) {
      payment_status.add('I');
    }

    var res = await CommonFunctions().getWalletTransactions(
        page.toString(),
        size.toString(),
        start,
        end,
        payment_mode.join(',') + (isFailed.value ? ',' : ''),
        payment_status.join(','));
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

  getUserProfile() async {
    showLoading('Checking Balance...');
    await CommonFunctions().getUserProfile();
    hideLoading();
  }

  addRemoveOptionToMode(String value, bool isSelected) {
    payment_mode.clear();
    payment_status.clear();
    isFailed.value = false;
    if (isSelected) {
      payment_mode.add(value);
    }
    update();
  }

  addRemoveOptionToStatus(String value) {
    if (payment_status.contains(value))
      payment_status.remove(value);
    else
      payment_status.add(value);
  }

  clearFilter() async {
    startDate.clear();
    endDate.clear();
    payment_mode.clear();
    payment_status.clear();
    isFailed.value = false;
    await getWalletTransactions();
  }

  applyFilter() async {
    if (lock) return;
    if (startDate.text.isEmpty && startDate.text.isNotEmpty) {
      EasyLoading.showInfo('Please select Start Date');
      return;
    } else if (startDate.text.isNotEmpty && startDate.text.isEmpty) {
      EasyLoading.showInfo('Please select Start Date');
      return;
    }

    lock = true;
    page = 0;
    totalElements = 0;
    modelList.clear();
    await getWalletTransactions();

    Get.back();
    lock = false;
  }
}
