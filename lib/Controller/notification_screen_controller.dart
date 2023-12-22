import 'package:flutter/material.dart';
import 'package:freelancer_app/Model/notificationModel.dart';
import 'package:get/get.dart';

import '../Singletones/common_functions.dart';
import '../Utils/toastUtils.dart';
import '../constants.dart';

class NotificationScreenController extends GetxController {
  RxInt reload = 0.obs;
  RxList<NotificationModel> modelList = RxList([]);
  ScrollController scrollController = ScrollController();
  int page = 0, size = 10, totalElements = 0;
  bool isLoading = false;
  @override
  void onInit() {
    // / implement onInit
    super.onInit();
    getNotifications();
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
        // kLog(modelList.length.toString());
        page++;
        isLoading = true;
        await getNotifications();
        isLoading = false;
      }
    });
  }

  getNotifications() async {
    showLoading(kLoading);
    var res = await CommonFunctions()
        .getNotifications(page.toString(), size.toString());
    hideLoading();
    modelList.addAll(res);
  }
}
