import 'package:freelancer_app/Model/userModel.dart';
import 'package:freelancer_app/Utils/debouncer.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/state_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../Model/filterModel.dart';
import 'package:web_socket_channel/status.dart' as status;

class SocketRepo {
  //make it singleTone class
  static final SocketRepo _singleton = SocketRepo._internal();
  factory SocketRepo() {
    return _singleton;
  }
  SocketRepo._internal();
  WebSocketChannel? channel;
  initSocket({required int bookingId}) {
    final wsUrl = Uri.parse(
        'ws://cms.goecworld.com:5609/mobileAppChargingStatus/$bookingId');
    channel = WebSocketChannel.connect(wsUrl);

    channel?.stream.listen((message) {
      kLog(message);
      channel?.sink.add('received!');
    });
  }

  closeSocket() async {
    channel?.sink.close(status.goingAway);
  }
}
