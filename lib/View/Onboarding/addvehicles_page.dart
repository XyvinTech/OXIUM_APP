import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';

class AddVehiclesPage extends StatelessWidget {
  const AddVehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.09),
          child: CustomAppBar(
            text: "skip",
            icon: Icon(Icons.arrow_forward),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.055,
            top: size.height * 0.020,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBigText(text: "Add Your Vehicles"),
                  Container(
                    margin: EdgeInsets.only(
                      right: size.width * 0.055,
                    ),
                    child: Image.asset(
                      "assets/images/search.png",
                      height: size.height * 0.05,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
