import 'package:furnix_store/models/products_model.dart';
import 'package:furnix_store/services/product/product_service.service.dart';

class FirebaseProductRepository{

  final _productService = FirbeaseProductService();
  Future<List<ProductsModel>?> loadProducts()async{
    return await _productService.loadProducts();
  }
}