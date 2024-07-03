
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/products_model.dart';
import 'package:furnix_store/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FirebaseProductRepository productRepository;
  
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<LoadProductsRequested>(_onLoadProductsRequested);
  }
  Future<void> _onLoadProductsRequested (LoadProductsRequested event, Emitter<ProductState> emit)async{
    emit(ProductsLoading());
    debugPrint('loadProducts Requestedd');
    try {
      final List<ProductsModel>? products = await productRepository.loadProducts();
      
      emit(ProductsLoaded(products:products));
    } catch (e) {
      debugPrint('error fetching $e');
    }
  }
  
}
