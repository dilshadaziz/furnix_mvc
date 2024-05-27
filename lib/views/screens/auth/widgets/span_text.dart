import 'package:furnix_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

RichText spanText(
    {required String text, required String span, required VoidCallback onTap}) {
  return RichText(
    text: TextSpan(
        text: text,
        children: [
          WidgetSpan(
            child: GestureDetector(
              child: Text(
                span,
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: FColors.primaryColor),
              ),
              onTap: onTap,
            ),
          ),
        ],
        style: const TextStyle(color: Colors.black)),
  );
}
