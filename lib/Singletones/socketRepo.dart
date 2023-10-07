import 'dart:convert';

import 'package:freelancer_app/Model/chargingStatusModel.dart';
import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/Utils/debouncer.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/state_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../Model/filterModel.dart';
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
  initSocket({required int bookingId,required int transId, required Function fun}) {
    final wsUrl =
        Uri.parse('${CallAPI().socketHost}/mobileAppChargingStatus/$bookingId/$transId');
    channel = WebSocketChannel.connect(wsUrl);

    channel?.stream.listen((message) {
      kLog(message);
      if (message !=
          'Welcome! You are now connected to booking id: $bookingId.')
        fun(jsonDecode(message));
      channel?.sink.add('received!');
    }).onDone(() {});
  }

  closeSocket() async {
    channel?.sink.close(status.goingAway);
  }
}
