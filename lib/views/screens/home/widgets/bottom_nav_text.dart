import 'package:flutter/material.dart';
import 'package:furnix_store/controller/main_screen_size_controller/main_screen_size_controller.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:sizer/sizer.dart';

Row containerWithText(bool isSelected, double screenWidth, List<String> listOfStrings, int index, double screenHeight) {
  return Row(
                          children: [
                            // Animated container for spacing between text and icon
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: isSelected ? screenWidth * 0.13 : 0,
                            ),

                            // Animated opacity for text based on selection
                            AnimatedOpacity(
                              opacity: isSelected ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                isSelected ? listOfStrings[index] : '',
                                style: TextStyle(
                                  color: FColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: MainScreenSizeCntrl()
                                      .calculateBottomNavFontSize(screenHeight: screenHeight, screenWidth: screenWidth)
                                      .sp, // Use sp for scalable font size
                                ),
                              ),
                            ),
                          ],
                        
                        );
}
