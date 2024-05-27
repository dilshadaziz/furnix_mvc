import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/bottom_nav/bottom_nav.bloc.dart';
import 'package:furnix_store/controller/main_screen_size_controller/main_screen_size_controller.dart';
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
  const MainScreenBody({super.key});

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
      const HomePage(),
      const WishListPage(),
      const OrdersPage(),
      const ProfilePage(),
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
