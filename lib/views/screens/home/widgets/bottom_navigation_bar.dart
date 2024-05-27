import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/bottom_nav/bottom_nav.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/views/screens/home/widgets/bottom_nav_icon.dart';
import 'package:furnix_store/views/screens/home/widgets/bottom_nav_text.dart';

BlocBuilder<BottomNavBloc, BottomNavState> bottomNavigationBar(
  // Current selected index in the bottom navigation bar
  int currentIndex,

  // Screen width (used for dynamic sizing)
  double screenWidth,

  // List of strings for bottom navigation bar labels
  List<String> listOfStrings,

  // Screen height (potential use for dynamic sizing)
  double screenHeight,

  // List of icons for bottom navigation bar items
  List<IconData> listOfIcons,
) {
  return BlocBuilder<BottomNavBloc, BottomNavState>(
    builder: (context, state) {
      if (state is BottomNavItemState) {
        currentIndex =
            state.selectedIndex; // Update currentIndex based on state
      }

      // Padding around the bottom navigation bar
      return Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 0, right: 6, left: 6),
        child: SizedBox(
          // Fixed height for the bottom navigation bar
          height: screenWidth * 0.155,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, // Distribute items evenly
            children: List.generate(4, (index) {
              final isSelected =
                  index == currentIndex; // Check if current item is selected

              return InkWell(
                onTap: () {
                  context.read<BottomNavBloc>().add(
                      BottomNavItemSelected(index)); // Dispatch event on tap
                  HapticFeedback.lightImpact(); // Provide haptic feedback
                },
                splashColor: Colors.transparent, // Remove splash effect
                highlightColor: Colors.transparent, // Remove highlight effect
                child: Stack(
                  children: [
                    // Animated container for background color based on selection
                    AnimatedContainer(
                      duration:
                          const Duration(seconds: 1), // Animation duration
                      curve: Curves.fastLinearToSlowEaseIn, // Animation curve
                      width:
                          isSelected ? screenWidth * 0.32 : screenWidth * 0.18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: isSelected ? screenWidth * 0.12 : 0,
                        width: isSelected ? screenWidth * 0.32 : 0,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? FColors.primaryBgColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),

                    // Animated container for text and icon based on selection
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width:
                          isSelected ? screenWidth * 0.31 : screenWidth * 0.18,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          containerWithText(isSelected, screenWidth,
                              listOfStrings, index, screenHeight),
                          containerWithIcon(isSelected, screenWidth, index,
                              context, listOfIcons),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    },
  );
}
