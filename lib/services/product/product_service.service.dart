import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furnix_store/models/products_model.dart';
import 'package:furnix_store/utils/constants/firebase_consts.dart';

class FirbeaseProductService {
  final firebaseFirestore = FirebaseFirestore.instance;
  Future<List<ProductsModel>?> loadProducts() async {
    final productsCollectionRef =
        firebaseFirestore.collection(FirebaseConsts.products);

    final snapShot = await productsCollectionRef.get();
    List<ProductsModel> products = [];
    debugPrint('snapshot : }');
    if (snapShot.docs.isNotEmpty) {
      for (var doc in snapShot.docs) {
        final product =
            ProductsModel.fromMap(map: doc.data(), productId: doc.id);
        products.add(product);
      }
      return products;
    }
    return null;
  }
}
