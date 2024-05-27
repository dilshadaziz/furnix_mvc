import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';

Widget expandedElevatedButton(
    {required String text,
    required BuildContext context,
    required bool cancelButton,
    required VoidCallback onTap}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
          fixedSize: MaterialStatePropertyAll(
            Size(getWidth(context), 55),
          ),
          backgroundColor: cancelButton ? const MaterialStatePropertyAll(FColors.primaryBgColor) : const MaterialStatePropertyAll(FColors.primaryColor),
          foregroundColor:cancelButton ? const MaterialStatePropertyAll(FColors.primaryColor) :  const MaterialStatePropertyAll(Colors.white)),
      child: Text(text),
    ),
  );
}