import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';

PreferredSize customProfileAppBar(BuildContext context) {
  return PreferredSize(
      preferredSize: Size.fromHeight(getHeight(context) * 0.06),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '🏠 Furnish',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: FColors.primaryColor),
                    ),
                    Text(
                      ' & Care ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                  ],
                ),
                Divider(color: Colors.grey.withOpacity(0.4),)
              ],
            ),
          ),
          
        ],
      ));
}
