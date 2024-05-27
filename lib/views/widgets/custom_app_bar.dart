import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';

PreferredSize customAppBar({required BuildContext context,required String title}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(getHeight(context) * 0.06),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading:IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.arrow_back_ios_new_rounded,color: FColors.primaryColor,)),
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87.withOpacity(0.6)),
                    ),
              ],
            ),
          ),
          
        ],
      ));
}
