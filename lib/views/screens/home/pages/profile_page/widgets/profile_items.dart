import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/helper/profile_screen_functions.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/content_divider.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/logout_bottom_sheet.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/profile_options.dart';
import 'package:ionicons/ionicons.dart';

Column profileItems(AuthBloc authBloc, BuildContext context) {
  return Column(
    children: [
      ProfileOptions(
        onTap: () {},
        item: 'Edit Profile',
        icon: Ionicons.person,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {},
        item: 'My Orders',
        icon: Icons.menu_book_rounded,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {},
        item: 'My Address',
        icon: CupertinoIcons.map_pin_ellipse,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {},
        item: 'Security',
        icon: Ionicons.shield_checkmark_outline,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () async {
          await ProfileScreenFunctions().launchEmail();
        },
        item: 'Feedback',
        icon: Icons.feedback_outlined,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {},
        item: 'Privacy Policy',
        icon: Ionicons.newspaper_outline,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {},
        item: 'Terms and Conditions',
        icon: Ionicons.newspaper_outline,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {
          _onLogoutClicked(authBloc, context);
        },
        item: 'Log out',
        icon: Ionicons.log_out_outline,
      ),
      const ContentDivider(),
    ],
  );
}

Future<void> _onLogoutClicked(AuthBloc authBloc, BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return logoutBottomSheet();
      });
}
