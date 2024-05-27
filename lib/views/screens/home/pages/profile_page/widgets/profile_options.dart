import 'package:flutter/material.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:sizer/sizer.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions(
      {required this.onTap,
      required this.item,
      required this.icon,
      super.key});

  final VoidCallback onTap;
  final String item;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        splashColor: FColors.primaryColor.withOpacity(0.1),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.5),
        ),
        onTap: () {
          onTap();
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? FColors.primaryBgColor.withOpacity(0.1)
                  : const Color.fromARGB(255, 25, 25, 25),
              child: Icon(icon,
                  color: Theme.of(context).brightness == Brightness.light
                      ? FColors.primaryColor
                      : const Color.fromARGB(255, 171, 170, 170)),
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              item,
              style: TextStyle(fontSize: 14.sp),
            )
          ],
        ),
      ),
    );
  }
}
