import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnix_store/utils/constants/colors.dart';

void toast (String message) {
    Fluttertoast.showToast(msg: message,toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 1,textColor: Colors.white,fontSize: 16.0,backgroundColor: FColors.primaryColor);
}