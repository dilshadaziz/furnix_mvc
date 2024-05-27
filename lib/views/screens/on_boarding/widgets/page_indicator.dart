import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget smoothPageIndicator(BuildContext context,PageController pageController) {
  return SmoothPageIndicator(

    controller: pageController,
    count: 3,
    effect: const SwapEffect(activeDotColor: FColors.primaryColor),
  );
}