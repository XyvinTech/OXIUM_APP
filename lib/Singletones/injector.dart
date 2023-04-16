import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/constants.dart';

  class Injector {
    //make it singleTone class
    static final Injector _singleton = Injector._internal();
    factory Injector() {
      return _singleton;
    }
    Injector._internal();

//  THIS METHOD IS FOR INJECTING THE STARTUP ASSETS OR ANY OTHER KIND OF DEPENDENIES
  inject() async {}

  injectImages(BuildContext context) async {
    List<String> _asset_svg_list = await _getAssetImageList(true);
    List<String> _asset_png_list = await _getAssetImageList(false);
    _asset_svg_list.forEach((element) async {
      // await precacheImage(
      //     ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, element), null);
    });
    _asset_png_list.forEach((element) async {
      await precacheImage(AssetImage(element),context);
    });
  }

  Future<List<String>> _getAssetImageList(bool isSVG) async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines
    print(manifestContent);
    List<String> imagePaths = manifestMap.keys
        .where((String key) => key.contains(isSVG ? '.svg' : '.png'))
        .toList();

    return imagePaths;
  }
}
