import 'package:decorated_icon/decorated_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/auth/auth.bloc.dart';
import 'package:furnix_store/bloc/bottom_nav/bottom_nav.bloc.dart';
import 'package:furnix_store/controller/main_screen_size_controller/main_screen_size_controller.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/navigations/right_to_left.dart';
import 'package:furnix_store/services/auth/firebase_auth.service.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/home_page.dart';
import 'package:furnix_store/views/screens/home/pages/orders_page/orders_page.dart';
import 'package:furnix_store/views/screens/home/pages/profile_page/profile_page.dart';
import 'package:furnix_store/views/screens/home/pages/wishlist_page/wishlist_page.dart';
import 'package:furnix_store/views/screens/home/widgets/bottom_navigation_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class MainScreenBody extends StatelessWidget {
  final UserModel user;
  const MainScreenBody({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    
    int currentIndex = 0;
     double screenWidth = getWidth(context);
     double screenHeight = getHeight(context);
     SizerUtil.width = getWidth(context);
    final List<String> listOfStrings = [
      'Home',
      'Wishlist',
      'Orders',
      'Profile'
    ];
    final List<IconData> listOfIcons = [
      Icons.home,
      Icons.shopping_bag_outlined,
      Icons.menu_book_rounded,
      Icons.person_outline_sharp,
    ];
    final List<Widget> _mainScreens = [
      HomePage(user:user),
      WishListPage(user:user),
      OrdersPage(user:user),
      ProfilePage(user: user,),
    ];

    return Scaffold(
      body:
          BlocBuilder<BottomNavBloc, BottomNavState>(builder: (context, state) {
            
        if (state is BottomNavItemState) {
          currentIndex = state.selectedIndex;
        }
        return _mainScreens[currentIndex];
      }),
      bottomNavigationBar: bottomNavigationBar(currentIndex, screenWidth, listOfStrings, screenHeight, listOfIcons),
    );
  }

  
}
