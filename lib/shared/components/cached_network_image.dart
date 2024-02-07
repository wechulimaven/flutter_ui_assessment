import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets.dart';

class CustomImageWidget extends StatelessWidget {
  final String mediaUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  const CustomImageWidget(
    this.mediaUrl, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (mediaUrl.contains('http')) {
      return CachedNetworkImage(
        imageUrl: mediaUrl,
        fit: fit,
        errorWidget: (context, url, error) => Image.asset(Assets.defaultImg),
        height: height,
        width: width,
      );
    } else if (mediaUrl.contains('assets')) {
      if (mediaUrl.contains("svg")) {
        return SvgPicture.asset(
          mediaUrl,
          height: height,
          width: width,
          color: color,
        );
      }
      return Image.asset(
        mediaUrl,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (mediaUrl.contains('file://') ||
        mediaUrl.contains('data/user/')) {
      return Image.file(
        File(mediaUrl),
        fit: fit,
        height: height,
        width: width,
      );
    } else if (mediaUrl == "null") {
      return Image.asset(
        Assets.defaultImg,
        height: height,
        width: width,
      );
    } else {
      return Image.file(
        File(mediaUrl),
        fit: fit,
        height: height,
        width: width,
      );
    }
  }
}
