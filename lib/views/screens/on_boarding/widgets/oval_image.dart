
import 'package:furnix_store/utils/constants/screen_images.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:flutter/material.dart';

Widget ovalImage(BuildContext context, index) {
  List<String> images = [
    OnImages.onBoarding1,
    OnImages.onBoarding2,
    OnImages.onBoarding3,
  ];
  return Container(
    height: getHeight(context) * 0.7,
    width: getWidth(context),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(100),
        bottomRight: Radius.circular(100),
        
      ),
      image: DecorationImage(
        image: AssetImage(images[index]),
        fit: BoxFit.fill
      ),
    ),
  );
}
