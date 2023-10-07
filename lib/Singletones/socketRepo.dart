import 'dart:convert';


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

    channel?.stream.listen((message) {
      print(message);
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
