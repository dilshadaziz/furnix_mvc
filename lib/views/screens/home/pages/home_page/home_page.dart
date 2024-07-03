import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/product/product_bloc.dart';
import 'package:furnix_store/models/products_model.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/widgets/carousel_slider.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/widgets/category_items.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/widgets/location.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/widgets/product_items.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/widgets/search_bar.dart';
class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    List<ProductsModel> products = [];
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductsLoaded) {
            products = state.products!;
          }
        },
        builder: (context, state) {
          if (state is ProductInitial) {
            productBloc.add(LoadProductsRequested());
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  locationDetails(),
                  const SearchBarField(),
                  const SizedBox(height: 30,),
                  // Image Slider
                  carouselSlider(context, products),

                  // Category Section
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  // Row of Category Icons
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCategoryItem('Sofa', 'assets/icons/sofa_icon.svg'),
                        getCategoryItem('Lamp', 'assets/icons/lamp_icon.svg'),
                        getCategoryItem('Bed', 'assets/icons/bed_icon.svg'),
                        getCategoryItem(
                            'Trundle', 'assets/icons/trundle_icon.svg'),
                      ],
                    ),
                  ),

                  // Flash Sale Section
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Flash Sale',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.sort, size: 16.0),
                            Text('Newest'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Row of Flash Sale Products
                  SizedBox(
                      height: getHeight(context) * 0.18,
                      child: getProductItem(products)),

                  // Recommended For You Section
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommend For You',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // List of Recommended Products (implement logic to fetch & display data)
                  // ... Replace with your product list widget
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
