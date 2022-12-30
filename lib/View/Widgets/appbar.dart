import 'package:flutter/material.dart';

import 'package:freelancer_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;
  final Widget? icon;
  const CustomAppBar({super.key, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/goeclogo.png",
              height: 33,
              width: 68,
            ),
          ],
        ),
        Row(
          children: [
            if (text != null)
              Text(
                text!,
                style: kAppSkipButtonTextStyle,
              ),
            if (icon != null)
              IconButton(
                onPressed: () {},
                icon: icon!,
              ),
          ],
        )
      ],
    );
  }
}

// Widget CustomAppBar({String? text, Widget? icon}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children: [
//           Image.asset(
//             "assets/images/goeclogo.png",
//             height: 33,
//             width: 68,
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Text(
//             text!,
//             style: kAppSkipButtonTextStyle,
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: icon!,
//           ),
//         ],
//       )
//     ],
//   );
// }
