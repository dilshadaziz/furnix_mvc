import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';

Widget shopNowButton({
  required VoidCallback onTap,
  required String text,
  required double buttonWidth,
  double? buttonHeight,
}) {
  return ElevatedButton(
    onPressed: () => onTap(),
    child: Text(
      text,
      style:
          TextStyle(color: FColors.secondaryColor, fontWeight: FontWeight.bold),
    ),
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
        fixedSize: MaterialStatePropertyAll(buttonHeight != null ? Size(buttonWidth,buttonHeight) : null),
        backgroundColor: MaterialStatePropertyAll(
          FColors.primaryColor,
        ),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
  );
}
