import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnix_store/models/products_model.dart';
import 'package:furnix_store/utils/constants/colors.dart';
import 'package:furnix_store/utils/device/devices.dart';
import 'package:furnix_store/views/screens/home/pages/home_page/pages/single_product_page/single_product_page.dart';

Widget getProductItem(List<ProductsModel> products) {
    return ListView.builder(
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) => Row(
            children: [
              index > 0 && index < products.length
                  ? const SizedBox(
                      width: 15,
                    )
                  : const SizedBox(),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SinleProductPage(product:products[index],products: products,)));
                },
                child: Container(
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
              ),
            ],
          )),
    );
  }