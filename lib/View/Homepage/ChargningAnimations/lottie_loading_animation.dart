import 'package:flutter/material.dart';
import 'package:freelancer_app/constants.dart';
import 'package:lottie/lottie.dart';

class LottieLoadingWidget extends StatefulWidget {
  LottieLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LottieLoadingWidget> createState() => _LottieLoadingWidgetState();
}

class _LottieLoadingWidgetState extends State<LottieLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animationController.repeat(reverse: false);
    // _controller.forward();
  }

  @override
  void dispose() {
    // kLog('lottie animaiton disposed');
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lotty/loading.json',
        controller: _animationController);
  }
}
