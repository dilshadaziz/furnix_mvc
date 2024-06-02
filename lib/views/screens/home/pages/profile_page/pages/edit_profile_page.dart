import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:ionicons/ionicons.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [CircleAvatar(
              radius: getWidth(context) * 0.2,
              backgroundColor: FColors.primaryBgColor,
            ),
            Positioned(child: Icon(Icons.add_a_photo_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
