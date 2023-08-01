import 'package:flutter/material.dart';
import '../../constants.dart';
import '../Widgets/apptext.dart';

class CustomCards extends StatelessWidget {
  final String image;
  final String subText;
  const CustomCards({
    super.key,
    required this.image,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        //margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset(image),
            Spacer(
              flex: 2,
            ),
            CustomBigText(
              text: subText,
              align: TextAlign.center,
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
