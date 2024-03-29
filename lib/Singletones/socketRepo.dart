import 'dart:convert';
import '../Utils/api.dart';
import 'package:get/get.dart';
import '../Utils/routes.dart';
import 'package:freelancer_app/constants.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketRepo {
  //make it singleTone class
  static final SocketRepo _singleton = SocketRepo._internal();
  factory SocketRepo() {
    return _singleton;
  }
  SocketRepo._internal();
  WebSocketChannel? channel;
  RxBool isCharging = false.obs;
  int count = 0;
  initSocket(
      {required int bookingId, required int tranId, required Function fun}) {
    final wsUrl = Uri.parse(
        '${CallAPI().socketHost}/mobileAppChargingStatus/$bookingId/$tranId');
    channel = WebSocketChannel.connect(wsUrl);
    bool isMessageNull = false;

    if (count < 0) {
      kLog('false return $count');
      return;
    }
    count++;
    channel?.stream.listen((message) {
      kLog('connected to $wsUrl  and count = $count');
      // kLog(message);
      isMessageNull = message == null ||
          (message ==
                  'Welcome! You are now connected to booking id: $bookingId.' ||
              message ==
                  'Closing connection: Transaction is not active for bookingID: $bookingId');
      fun(isMessageNull ? null : jsonDecode(message));
      isCharging.value = true;
      // channel?.sink.add('received!');
    }).onDone(() {
      kLog('connection closed with ocpp');
      if (Get.currentRoute == Routes.chargingPageRoute &&
          Get.isDialogOpen == true) Get.back();
      isCharging.value = false;
      count--;
    });
  }

  closeSocket() async {
    kLog('called close socket');
    channel?.sink.close(status.goingAway);
  }
}
