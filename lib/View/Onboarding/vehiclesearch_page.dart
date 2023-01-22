import 'package:flutter/material.dart';
import 'package:freelancer_app/Controller/vehicle_search_controller.dart';
import 'package:freelancer_app/View/Widgets/apptext.dart';
import 'package:get/get.dart';
import '../../Utils/routes.dart';
import '../../constants.dart';
import '../Widgets/appbar.dart';


class VehicleSearchScreen extends GetView<VehicleSearchController> {
  const VehicleSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * 0.09),
            child: CustomAppBar(
              text: "Skip",
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              icononTap: () {},
              skiponTap: (){},
            ),
          ),
          backgroundColor: kscaffoldBackgroundColor,
          body: Padding(
            padding:  EdgeInsets.only(
               left: size.width * 0.055,
            right: size.width * 0.055,
            top: size.height * 0.020,
           ),
            child: Column(
              children: [
                _searchVehicleSection(),
             SizedBox(height: size.height *0.02,),
             Align(
              alignment: Alignment.bottomLeft,
              child: CustomSmallText(text: "Result 16",size: 14,)),
             SizedBox(height: size.height *0.02,),
             _resultSearchVehicle(),
             Visibility(
              visible: controller.isVisible.value,
               child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.055,
                      right: size.width * 0.055,
                      bottom: size.height * 0.03),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65),
                    color: Color(0xff0047C3),
                  ),
                  child: Center(
                    child: Text(
                      "Add Vehicles",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xffF2F2F2),
                      ),
                    ),
                  ),
                ),
                         ),
             ),
             ],
            ),
          ),
      ),
    );
  }

  _searchVehicleSection(){
    return    Row(
                  children: [
                    Icon(Icons.arrow_back_ios,size: 20,color: Color(0xff828282),),
                    SizedBox(width: size.width *0.01,),
                    Container(
                      height: size.height *0.06,
                      width: size.width *0.82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kwhite,
                      ),
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.6,
                            child: Padding(
                              padding:  EdgeInsets.only(left: size.width *0.05),
                              child: TextFormField(
                                controller: controller.searchTextFieldcontroller,

                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "Search Vehicle",
                                  hintStyle: kApphintTextStyle,
                                  focusedBorder: InputBorder.none,
                                  
                                  enabledBorder: InputBorder.none,),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: size.width *0.02),
                            child: Image.asset("assets/images/search.png",height: size.height * 0.05,),
                          ),
                        ],
                      )),
                    )

                  ],
                );
             
  }


  _resultSearchVehicle(){
    return        Expanded(
            child: Container(
              color: kscaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: size.width * .05),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 100,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:  InkWell(
                          onTap: (() {
                          controller.isVisible.value=true;
                          }),
                          child: Container(
                            height: size.height * 0.155,
                            width: size.width * 0.075,
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 1,
                                color:
                                     Color(0xffE0E0E0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/images/jeep1.png",
                                  height: size.height * 0.12,
                                  width: size.width * 0.32,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: size.height *0.025,
                                              color: Color.fromRGBO(
                                                  184, 210, 255, 0.6),
                                              child: Center(
                                                child: CustomSmallText(
                                                  text: "Type2 CCS",
                                                  color: Color(0xff0047C3),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.02,
                                            ),
                                            Container(
                                             height: size.height *0.025,
                                              color: Color.fromRGBO(
                                                  184, 210, 255, 0.6),
                                              child: Center(
                                                child: CustomSmallText(
                                                  text: "Type2 CCS",
                                                  color: Color(0xff0047C3),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: size.height *0.01,),
                                            Container(
                                           height: size.height *0.025,
                                          color: Color.fromRGBO(
                                              184, 210, 255, 0.6),
                                          child: Center(
                                            child: CustomSmallText(
                                              text: "Type2 CCS",
                                              color: Color(0xff0047C3),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    
                                  
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                     
                  );
                },
              ),
            ),
          );
  }
}