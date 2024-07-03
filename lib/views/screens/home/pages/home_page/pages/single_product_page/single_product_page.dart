import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/bloc/order/order_bloc.dart';
import 'package:furnix_store/models/products_model.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/pages/single_product_page/widgets/add_to_cart_button.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/widgets/shop_now_button.dart';

class SinleProductPage extends StatelessWidget {
  final ProductsModel product;
  final List<ProductsModel> products;
  final List<String> images = [
    'image1_url',
    'image2_url',
    'image3_url',
  ];

  final List<Color> colors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
  ];

  SinleProductPage({required this.product, required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.read<OrderBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSlider(),
            _buildProductInfo(),
            _buildTabBarSection(),
            _buildColorOptions(),
            _buildSimilarItemsList(context),
            _buildTotalPriceAndAddToCartButton(context: context,orderBloc: orderBloc),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(product.imageUrl, fit: BoxFit.cover);
        },
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.productName,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('Non-arm chair, pine wood and light grey color'),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.orange),
              Text('4.1'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarSection() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Product Details'),
              Tab(text: 'Reviews'),
            ],
          ),
          SizedBox(
            height: 200, // Dynamic height based on content
            child: TabBarView(
              children: [
                _buildDescriptionTab(),
                _buildProductDetailsTab(),
                _buildReviewsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
          // 'Crafted from beautiful light grey wood, this chair offers a touch of modern elegance to any room.',
          product.productDescription),
    );
  }

  Widget _buildProductDetailsTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('product Details will be here'),
    );
  }

  Widget _buildReviewsTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Reviews go here'),
    );
  }

  Widget _buildColorOptions() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text('Select Color: '),
          Row(
            children: colors.map((color) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarItemsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: getHeight(context)*0.18,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
        
            return Row(
              children: [
                index > 0 && index< products.length ? const SizedBox(width: 15,): const SizedBox(),
                Container(
                    width: getWidth(context) * 0.35,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(158, 158, 158, 0.5), width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: getHeight(context) * 0.18 * 0.7,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(158, 158, 158, 0.2),
                              // border: Border.all(),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(products[index].imageUrl),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      products[index].productName,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        '4.1',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                '\$${products[index].price}',
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: FColors.primaryColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSimilarItem({
    required String imageUrl,
    required String title,
    required String price,
    required String rating,
    required BuildContext context,
  }) {
    return Container(
      width: getWidth(context) * 0.35,
      decoration: BoxDecoration(
        border:
            Border.all(color: Color.fromRGBO(158, 158, 158, 0.5), width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getHeight(context) * 0.18 * 0.7,
            decoration: BoxDecoration(
                color: Color.fromRGBO(158, 158, 158, 0.2),
                // border: Border.all(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                    image: NetworkImage(product.imageUrl), fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        product.productName,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                        Text(
                          '4.1',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: FColors.primaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTotalPriceAndAddToCartButton({required BuildContext context,required OrderBloc orderBloc}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Total Price: ₹268.99',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          addToCartButton(
            onTap: () {
              orderBloc.add(AddToCartRequested(product:product));
            },
            text: 'Add to Cart',
            buttonWidth: getWidth(context) *0.25,
            buttonHeight: getHeight(context)*0.03
          ),
        ],
      ),
    );
  }
}
