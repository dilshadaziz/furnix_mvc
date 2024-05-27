import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';

Row containerWithIcon(bool isSelected, double screenWidth, int index,
    BuildContext context, List<IconData> listOfIcons) {
  return Row(
    children: [
      // Animated container for spacing after text
      AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        width: isSelected ? screenWidth * 0.03 : 20,
      ),

      // Conditional rendering of icon based on index (first item)
      index == 0
          ? Image.asset(
              'assets/icons/icons8-exterior-48.png',
              width: screenWidth * 0.084,
              color: isSelected
                  ? FColors.primaryColor
                  : Theme.of(context).brightness == Brightness.light
                      ? FColors.primaryColor.withOpacity(0.4)
                      : Colors.white54,
            )
          : Icon(
              listOfIcons[index],
              size: screenWidth * 0.076,
              color: isSelected
                  ? FColors.primaryColor
                  : FColors.primaryColor.withOpacity(0.4),
            ),
    ],
  );
}
