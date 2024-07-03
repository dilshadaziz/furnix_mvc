import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/pages/add_address_page.dart';

GestureDetector addNewAddressButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddAddressPage()));
    },
    child: Padding(
      padding: EdgeInsets.only(
          left: getWidth(context) * 0.05, right: getWidth(context) * 0.05),
      child: DottedBorder(
        padding: const EdgeInsets.all(0),
        borderPadding: const EdgeInsets.all(0),
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        strokeWidth: 2,
        color: FColors.primaryColor,
        dashPattern: const [5, 5],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: FColors.primaryBgColor,
          ),
          height: getHeight(context) * 0.065,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: FColors.primaryColor,
              ),
              Text(
                'Add New Delivery Address',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: FColors.primaryColor),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
