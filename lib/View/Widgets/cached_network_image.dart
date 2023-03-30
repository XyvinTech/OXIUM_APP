import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedNetworkImage(String imageUrl, {double? width}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.fill,
    width: width,
    progressIndicatorBuilder: (context, url, downloadProgress) => Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(value: downloadProgress.progress)),
    errorWidget: (context, url, error) =>
        Align(alignment: Alignment.center, child: Icon(Icons.error)),
  );
}
