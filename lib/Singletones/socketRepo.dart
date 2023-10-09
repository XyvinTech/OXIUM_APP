import 'dart:convert';

import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:web_socket_channel/status.dart' as status;

import '../Utils/api.dart';

class SocketRepo {
  //make it singleTone class
  static final SocketRepo _singleton = SocketRepo._internal();
  factory SocketRepo() {
    return _singleton;
  }
  SocketRepo._internal();
  WebSocketChannel? channel;
  RxBool isCharging = false.obs;
  initSocket(
      {required int bookingId, required int tranId, required Function fun}) {
    final wsUrl = Uri.parse(
        '${CallAPI().socketHost}/mobileAppChargingStatus/$bookingId/$tranId');
    channel = WebSocketChannel.connect(wsUrl);
    bool isMessageNull = false;
    channel?.stream.listen((message) {
      kLog(message);
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
      if (Get.isDialogOpen == true) Get.back();
      isCharging.value = false;
    });
  }

  closeSocket() async {
    kLog('called close socket');
    channel?.sink.close(status.goingAway);
  }
}
