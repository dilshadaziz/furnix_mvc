part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}
final class ProductsLoading extends ProductState{}
final class ProductsLoaded extends ProductState{
  final List<ProductsModel>? products;

  const ProductsLoaded({required this.products});
  @override
  List<Object> get props {
    if(products != null){
      return [products!];
    }
    return [];
  } 
}