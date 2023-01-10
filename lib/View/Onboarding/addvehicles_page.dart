import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freelancer_app/Controller/loginpage_controller.dart';
import 'package:freelancer_app/Model/vehiclesModel.dart';
import 'package:freelancer_app/View/Widgets/appbar.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:freelancer_app/constants.dart';
import 'package:get/get.dart';

import '../../Utils/routes.dart';

class AddVehiclesPage extends GetView<LoginPageController> {
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
              SizedBox(
                height: 20,
              ),
              //vehicles section
              _vehicles(),
              SizedBox(
                height: 20,
              ),
              CustomSmallText(text: "Vehicle Models"),
              SizedBox(
                height: 10,
              ),
              //vehicles model
              Container(
                height: 125,
                width: 320,
                child: ListView.builder(itemBuilder: (_, index) {
                  return Container(
                      height: 125,
                      width: 320,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 2,
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/jeep1.png",
                            height: 85,
                            width: 126,
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomSmallText(
                                    text: "Jeep",
                                    color: Color(0xff828282),
                                  ),
                                  CustomBigText(
                                    text: "RUBICON",
                                    size: 16,
                                    color: Color(0xff4F4F4F),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomSmallText(
                                    text: "Type2 CCS",
                                    color: Color(0xff0047C3),
                                  ),
                                  CustomSmallText(
                                    text: "Type2 CCS",
                                    color: Color(0xff0047C3),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _ok() {
    return Center(
      child: ListTile(
        leading: Image.asset(
          "assets/images/jeep1.png",
          height: 85,
          width: 126,
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomSmallText(
                    text: "Jeep",
                    color: Color(0xff828282),
                  ),
                  CustomBigText(
                    text: "RUBICON",
                    size: 16,
                    color: Color(0xff4F4F4F),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomSmallText(
                    text: "Type2 CCS",
                    color: Color(0xff0047C3),
                  ),
                  CustomSmallText(
                    text: "Type2 CCS",
                    color: Color(0xff0047C3),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _vehicles() {
    return Row(
      children: [
        Container(
          height: 89,
          width: 89,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: kwhite,
            border: Border.all(
              width: 1,
              color: Color(0xffE0E0E0),
            ),
          ),
          child: Center(
            child: CustomBigText(text: "All"),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 95,
            width: 280,
            child: ListView.builder(
              itemCount: controller.vehiclesdata.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 89,
                    width: 89,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: kwhite,
                      border: Border.all(
                        width: 1,
                        color: Color(0xffE0E0E0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    controller.vehiclesdata[index].image),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomSmallText(
                          text: controller.vehiclesdata[index].vehiclesName,
                          color: Color(0xff828282),
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
