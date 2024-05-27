import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/auth/pages/login_screen.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/content_divider.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/custom_profile_appbar.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/widgets/profile_items.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      appBar: customProfileAppBar(context),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            scrollBehavior: ScrollConfiguration.of(context)
                .copyWith(physics: const BouncingScrollPhysics()),
            slivers: [
              SliverToBoxAdapter(
                child: Column(children: [

                  
                  CircleAvatar(
                    radius: getWidth(context) * 0.2,
                    backgroundColor: FColors.primaryBgColor,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Muhammed Sinan M P',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Kakkanchery,Malappuram,Kerala',
                        style: TextStyle(
                          color:
                              FColors.onBoardingSubTitleColor.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context) * 0.07,
                      ),
                    ],
                  ),
                  profileItems(authBloc, context)
                ]),
              )
            ],
          );
        },
      ),
    );
  }
}
