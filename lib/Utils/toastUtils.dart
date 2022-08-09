import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading(String message) {
  EasyLoading.show(status: message);
}

void hideLoading() {
  EasyLoading.dismiss();
}

void showSuccess(String message) {
  EasyLoading.showSuccess(message);
}

void showError(String message) {
  EasyLoading.showError(message);
}

Widget helpCenterWidget(BuildContext context) {
  return InkWell(
    onTap: () {
      log('info');
      showDialog(
          context: context,
          builder: (_) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/profile/helpCenter.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('title',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xff333333))),
                          SizedBox(height: 10),
                          Text('details',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Color(0xff1B1B99).withOpacity(.6))),
                          // Text(kWhatsAppHelpDialogDetails2,
                          //     textAlign: TextAlign.center,
                          //     style: GoogleFonts.poppins(
                          //         fontWeight: FontWeight.normal,
                          //         fontSize: 13,
                          //         color: Color(0xff1B1B99).withOpacity(.6))),
                          SizedBox(height: 20),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                  // width: 150,
                                  height: 45,
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                  decoration: BoxDecoration(
                                    color: Color(0xff4DC85B),
                                  ),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent),
                                        shadowColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                      ),
                                      onPressed: () {
                                        //TOTO: help center link launch
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/profile/whatsapp.png',
                                            height: 25,
                                            width: 25,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Whatsapp',
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),

                                            //  text.text.color(Colors.white).size(16).make()),
                                          ),
                                        ],
                                      ))))
                        ],
                      ),
                    ],
                  ),
                ),
              ));
    },
    child: Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Icon(Icons.info_outline)
        // Image.asset(
        //   'assets/images/signup/info.png',
        //   height: 20,
        //   width: 20,
        // )
        ),
  );
}

Widget width(double size) {
  return SizedBox(width: size);
}

Widget height(double size) {
  return SizedBox(height: size);
}
