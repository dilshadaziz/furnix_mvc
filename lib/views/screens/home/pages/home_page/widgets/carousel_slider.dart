import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/models/products_model.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/widgets/shop_now_button.dart';

Container carouselSlider(BuildContext context, List<ProductsModel> products) {
    return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      focal: Alignment.centerRight,
                      radius: 7,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(158, 158, 158, 0.4),
                      ],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: getHeight(context) * 0.16,
                  width: getWidth(context) * 0.85,
                  child: CarouselSlider(
                    items: products.map((banner) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'New Collection',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: getWidth(context) * 0.045),
                                ),
                                Text(
                                  maxLines: 3,
                                  'Discount of 50% what you deal for the first Transaction',
                                  style: TextStyle(
                                      color: FColors.onBoardingSubTitleColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w700),
                                ),
                                shopNowButton(
                                  buttonHeight: getHeight(context) * 0.03,
                                  buttonWidth: getWidth(context) * 0.22,
                                  text: 'Shop Now',
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(banner.imageUrl))
                              ),
                              width: 100,
                              height: 100,
                              // child: Text('${}'),
                            ),
                          )
                        ],
                      ),).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                    ),
                  ),
                );
  }