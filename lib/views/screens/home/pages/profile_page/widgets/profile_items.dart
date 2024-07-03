import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/address/address.bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/bloc/bottom_nav/bottom_nav.bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/navigations/right_to_left.dart';
import 'package:furnix_store/utils/helper/profile_screen_functions.dart';
import 'package:furnix_store/views/screens/auth/pages/forgot_password_page.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/pages/edit_profile_page.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/pages/my_address_page.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/content_divider.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/logout_bottom_sheet.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/profile_options.dart';
import 'package:ionicons/ionicons.dart';

Column profileItems(AuthBloc authBloc, AddressBloc addressBloc,
    BuildContext context, UserModel user) {
  return Column(
    children: [
      ProfileOptions(
        onTap: () {
          Navigator.of(context).push(rightToLeft(EditProfilePage(user: user),
              duration: const Duration(milliseconds: 350)));
        },
        item: 'Edit Profile',
        icon: Ionicons.person,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {
          context
              .read<BottomNavBloc>()
              .add(const BottomNavItemSelected(2)); // Dispatch event on tap
          HapticFeedback.lightImpact(); // Provide haptic feedback
        },
        item: 'My Orders',
        icon: Icons.menu_book_rounded,
      ),
      const ContentDivider(),
      ProfileOptions(
        onTap: () {
          addressBloc.add(FetchAddressRequested(userId: user.uid));
          Navigator.of(context).push(rightToLeft(MyAddressPage(
            userId: user.uid,
          )));
        },
        item: 'My Address',
        icon: CupertinoIcons.map_pin_ellipse,
      ),
      const ContentDivider(),
      if (user.password.isNotEmpty)
        ProfileOptions(
          onTap: () {
            Navigator.of(context).push(rightToLeft(ForgotPasswordPage(),
                duration: const Duration(milliseconds: 350)));
          },
          item: 'Security',
          icon: Ionicons.shield_checkmark_outline,
        ),
      if(user.password.isNotEmpty)const ContentDivider(),
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
