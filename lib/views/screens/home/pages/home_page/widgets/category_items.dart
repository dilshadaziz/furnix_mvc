import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getCategoryItem(String title, String imagePath) {
    return Column(
      children: [
        SvgPicture.asset(
          imagePath,
          height: 50.0,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }