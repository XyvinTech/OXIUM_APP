import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class BookASlotScreenController extends GetxController {
  RxBool isTodayButtonPress = true.obs;
  // RxBool isNextDayButtonPress = false.obs;
  RxInt id = (-1).obs;
  DateTime today = DateTime.now();
  late DateTime tomorrow;
  RxBool isLoading = false.obs;
  bool isReschedule = Get.arguments ?? false;
  String weekDay = DateFormat('E').format(DateTime.now()).toLowerCase();
  String nextWeekDay = DateFormat('E')
      .format(DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day + 1, 0, 0, 0, 0, 0))
      .toLowerCase();
  var timeSlots;
  String daySelected = '';
  @override
  void onInit() async {
    tomorrow = DateTime(today.year, today.month, today.day + 1);
    super.onInit();
  }
}
